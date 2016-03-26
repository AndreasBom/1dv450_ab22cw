
(function(){
    app.controller('Show', function($scope, $rootScope, $http, $location){
        $rootScope.showSearch = true;
        $scope.showPagination = false;
        $scope.currentPage = 0;
        $scope.pageSize = $scope.eventsCount;
        $scope.offset = 0;
        $scope.limit = $scope.eventsCount;

        var init = function(){
            getAllEvents();
        };

        /****** Events ******/

        //Filters out events with same tag
        $scope.filterTag = function(tagId){
            $scope.showPagination = false; //hide pagination
            $scope.currentPage = 0; //set page to 0
            $rootScope.eventsToShow = [];

            if(tagId == null){ //if null show all events
                $rootScope.eventsToShow = $rootScope.allEvents;
            }else{ //Show events with simular tag
                $rootScope.allEvents.forEach(function(item){
                    item.tags.forEach(function(tag){
                        if(tag.id == tagId){
                            //rootScope is used so controller GMaps also has this value, Used for markers in map
                            $rootScope.eventsToShow.push(item);
                        }
                    });
                });
            }
            //function in GMaps for markers on map
            filterMarkers();
        };

        //Show all events
        $scope.showAll = function(){
            $scope.showPagination = false; //Hide pagination
            $scope.currentPage = 0; //set page to 0
            $rootScope.eventsToShow = [];
            $scope.pageSize = $scope.eventsCount;
            $rootScope.allEvents.forEach(function(item){
                $rootScope.eventsToShow.push(item);
            });
            //function in GMaps for markers on map
            filterMarkers();
        };

        //Show events pagewise
        $scope.showPagewise = function(){
            $scope.showAll(); //remove tag-filter
            $scope.showPagination = true; //Hide pagination
            $scope.pageSize = 2; //Limit page size to 2 event/page
            $scope.noOfPages = Math.ceil($scope.eventsCount/$scope.pageSize); //number of pages
        };


        /****** Data fetchers ******/

        //Get all events
        var getAllEvents = function(){
            $http({
                method: 'GET',
                url: "http://localhost:3000/api/v1/events/show/all",
                headers: {
                    'X-Api-Key': "aaaaaa"
                },
                cache: true
            }).then(function successCallback(response){
                //
                $scope.eventsCount = response.data.count;
                $rootScope.allEvents = response.data.data;
                $rootScope.eventsToShow = $rootScope.allEvents

            }, function errorCallback(response){
                var ret = {"status" : response.status, "statusText": response.statusText };
                return ret;
            });
        };

        //Get events pagewise
        var getEventsPagewise = function(offset, limit){
            $http({
                method: 'GET',
                url: "http://localhost:3000/api/v1/events/show/all?offset=" + offset + "&limit=" + limit,
                headers: {
                    'X-Api-Key': "aaaaaa"
                },
                cache: true
            }).then(function successCallback(response){
                //
                $scope.eventsCount = response.data.count;
                $scope.eventsLimit = response.data.limit;
                $rootScope.allEvents = response.data.data;
                $rootScope.eventsToShow = $rootScope.allEvents

            }, function errorCallback(response){
                var ret = {"status" : response.status, "statusText": response.statusText };
                return ret;
            });
        };


        /****** Utils ******/

        var navigateTo = function(path){
            return $location.path(path);
        };



        init();
    })//controller end

    .directive('pagination', function(){
        return {
            restrict:'E',
            templateUrl: 'assets/swlls/views/pagination.html'
        }
    });
})();
