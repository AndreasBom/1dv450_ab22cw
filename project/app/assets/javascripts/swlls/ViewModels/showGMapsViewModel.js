(function() {
    app.controller('Gmaps', function ($scope, $rootScope, $http, $location, uiGmapIsReady) {
        $rootScope.loading = true;

        var init = function(){
            getAllLocations();
            $rootScope.loading = false;
        };

        $rootScope.showSearch = true;
        $scope.markers = [];
        $scope.map = {
            center: {
                latitude: 56.66,
                longitude: 16
            },
            zoom: 6
        };
        $scope.showAll = function(){
            $scope.filteredEvents = [];
            $scope.events.forEach(function(item){
                $scope.filteredEvents.push(item);
            });

        };

        $scope.showPagewise = function(){

        };

        $scope.filterTag = function(tagId){
            $scope.filteredEvents = [];
            $scope.events.forEach(function(item){
                item.tags.forEach(function(tag){
                    if(tag.id == tagId){
                        $scope.filteredEvents.push(item);
                        console.log(tagId);
                    }
                });
            });

        };
        $scope.windowOptions = {
            show: true,
            control: {}
        };

        var locations;

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
                getAllEvents();
                $rootScope.loading = false;
            }, function errorCallback(response){
                var ret = {"status" : response.status, "statusText": response.statusText };
                return ret;
            });
        };

        var createMarkers = function() {
            for(var i = 0; i < locations.length; i++){
                $scope.markers.push({
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

        };

        var getAllEvents = function(){
            $http({
                method: 'GET',
                url: "http://localhost:3000/api/v1/events/show/all",
                headers: {
                    'X-Api-Key': "aaaaaa"
                },
                cache: true
            }).then(function successCallback(response){
                $scope.eventsCount = response.data.count;
                $scope.events = response.data.data;
                $scope.filteredEvents = $scope.events;
            }, function errorCallback(response){
                var ret = {"status" : response.status, "statusText": response.statusText };
                return ret;
            });
        };

        $scope.onClick = function(marker, eventName, model) {
            getEvent(marker.model.id, function(event){
                model.show = !model.show;
                //getEvent and then update model
                marker.model.message = event.message;
                marker.model.rating = event.rating;
                marker.model.tags = event.tags;
                $scope.clickedMarker = marker;
            });
        };



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


        var navigateTo = function(path){
            return $location.path(path);
        };

        init();
    });//End controller


})();