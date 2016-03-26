(function() {
    app.controller('Gmaps', function ($scope, $rootScope, $http, $location, uiGmapIsReady) {
        var init = function(){

            //Set default lat, lng and zoom on map
            $scope.map = {
                center: {
                    latitude: 56.66,
                    longitude: 16
                },
                zoom: 6
            };
            $scope.windowOptions = {
                show: true,
                control: {}
            };

            getAllLocations();
            $rootScope.loading = false;
        };

        $scope.allMarkers = [];
        $scope.markersToShow = [];
        var locations;


        /**** Events ******/

            //Click on marker. Will show infoWindow
        $scope.onClick = function(marker, eventName, model) {
            model.show = !model.show;
            getEvent(marker.model.id, function(event){
                //getEvent and then update model
                marker.model.message = event.message;
                marker.model.rating = event.rating;
                marker.model.tags = event.tags;
                $scope.clickedMarker = marker;
            });
        };


        /**** Methods ********/

        var createMarkers = function() {
            for(var i = 0; i < locations.length; i++){
                $scope.allMarkers.push({
                    coords: {
                        latitude: locations[i].latitude,
                        longitude: locations[i].longitude
                    },
                    title: locations[i].name,
                    address: locations[i].address,
                    id: locations[i].id,
                    icon: '/assets/bar.png',
                    message: "",
                    rating: null
                });
            }

            $scope.markersToShow = $scope.allMarkers;
        };

        filterMarkers = function(){
            $scope.markersToShow = [];

            for(var i = 0; i < $scope.allMarkers.length; i++){

                for(var j = 0; j < $rootScope.eventsToShow.length; j++){
                    if($rootScope.eventsToShow[j].position_id == $scope.allMarkers[i].id){
                        $scope.markersToShow.push($scope.allMarkers[i]);
                    }else if($rootScope.eventsToShow[j].position_id == null && //Fulhack för att de seedade ölhaken ska funka
                        $rootScope.eventsToShow[j].name == $scope.allMarkers[i].title){
                        $scope.markersToShow.push($scope.allMarkers[i]);
                    }
                }
            }
        };


        /***** Data fetcher *****/

        var getAllLocations = function(){
            $http({
                method: 'GET',
                url: "http://localhost:3000/api/v1/positions/show/all",
                headers: {
                    'X-Api-Key': "aaaaaa"
                },
                cache: true
            }).then(function successCallback(response){
                locations = response.data;
                createMarkers();
                $rootScope.loading = false;
            }, function errorCallback(response){
                var ret = {"status" : response.status, "statusText": response.statusText };
                return ret;
            });
        };

        //Get one event based on id
        var getEvent = function(id, callback){
            $http({
                method: 'GET',
                url: "http://localhost:3000/api/v1/events/show/" + id,
                headers: {
                    'X-Api-Key': "aaaaaa"
                },
                cache: true
            }).then(function successCallback(response){
                callback(response.data);
            }, function errorCallback(response){
                var ret = {"status" : response.status, "statusText": response.statusText }
                return ret;
            });
        };


        init();
    });//End controller


})();