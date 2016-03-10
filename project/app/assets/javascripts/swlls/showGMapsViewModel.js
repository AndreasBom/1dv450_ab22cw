(function() {
    app.controller('Gmaps', function ($scope, $http) {
        $scope.map = {
            center: {
                latitude: 56.66,
                longitude: 16
            },
            zoom: 8
        };


        var locations;
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
        }, function errorCallback(response){
            var ret = {"status" : response.status, "statusText": response.statusText }
            return ret;
        });

        $scope.markers = [];
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
                    icon: '/assets/iconsurfing.png'
                });
            }
        };


        //$scope.events = [];
        $http({
            method: 'GET',
            url: "http://localhost:3000/api/v1/events/show/all",
            headers: {
                'X-Api-Key': "aaaaaa"
            },
            cache: true
        }).then(function successCallback(response){
            console.log(response.data);
            $scope.eventsCount = response.data.count;
            $scope.events = response.data.data;
            console.log($scope.events);
        }, function errorCallback(response){
            var ret = {"status" : response.status, "statusText": response.statusText }
            return ret;
        });



        $scope.windowOptions = {
            show: true,
            control: {}
        };

        $scope.onClick = function(marker, eventName, model) {
            model.show = !model.show;
            $scope.clickedMarker = marker;
            getEvent(marker.model.id, function(event){

                //getEvent and then update model
                marker.model.message = event.message;
                marker.model.rating = event.rating;
                marker.model.tags = event.tags

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

    });//End controller





})();//End script scope






            /*
            $scope.windowOptions = {
                show: true
            };

            /!*$scope.onClick = function (data) {
                //$scope.windowOptions.show = !$scope.windowOptions.show;
                console.log('$scope.windowOptions.show: ', $scope.windowOptions.show);
                console.log('This is a ' + data);
                //alert('This is a ' + data);
            };*!/

            $scope.closeClick = function () {
                $scope.windowOptions.show = false;
            };

            $scope.title = "Window Title!";

            uiGmapIsReady.promise() // if no value is put in promise() it defaults to promise(1)
                .then(function (instances) {

                })
                .then(function () {
                    $scope.addMarkerClickFunction($scope.markers);
                });


                var locations;
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
                }, function errorCallback(response){
                    var ret = {"status" : response.status, "statusText": response.statusText }
                    return ret;
                });

                $scope.markers = [];
                var createMarkers = function() {
                    for(var i = 0; i < locations.length; i++){
                        $scope.markers.push({
                            coords: {
                                latitude: locations[i].latitude,
                                longitude: locations[i].longitude,
                            },
                            title: locations[i].name,
                            address: locations[i].address,
                            id: locations[i].id,
                            icon: 'assets/iconsurfing.png',
                            data: "HejData"
                        });
                    }
                };*/
/*********/


        /*$scope.markers = [{
            id: 0,
            coords: {
                latitude: 37.7749295,
                longitude: -122.4194155
            },
            data: 'restaurant'
        }, {
            id: 1,
            coords: {
                latitude: 37.79,
                longitude: -122.42
            },
            data: 'house'
        }, {
            id: 2,
            coords: {
                latitude: 37.77,
                longitude: -122.41
            },
            data: 'hotel'
        }];
*/
       /* $scope.addMarkerClickFunction = function (markersArray) {
            angular.forEach(markersArray, function (value, key) {
                value.onClick = function () {
                    console.log(value);
                    $scope.onClick(value.data);
                    $scope.MapOptions.markers.selected = value;
                };
            });
        };


                // click event on marker
                $scope.onClick = function(marker){
                    console.log(marker);
                    /!*$scope.MapOptions.markers.selected = marker;
                    console.log()
                    marker.model.show = !marker.model.show;
                    getEvent(marker.model.id);*!/

                };


        $scope.MapOptions = {
            minZoom: 3,
            zoomControl: false,
            draggable: true,
            navigationControl: false,
            mapTypeControl: false,
            scaleControl: false,
            streetViewControl: false,
            disableDoubleClickZoom: false,
            keyboardShortcuts: true,
            markers: {
                selected: {}
            },
            styles: [{
                featureType: "poi",
                elementType: "labels",
                stylers: [{
                    visibility: "off"
                }]
            }, {
                featureType: "transit",
                elementType: "all",
                stylers: [{
                    visibility: "off"
                }]
            }]
        };
}]);
*/



/*
    angular.module('app')
        .controller('Gmaps', ['$scope', 'uiGmapGoogleMapApi', '$http' , function($scope, uiGmapGoogleMapApi, $http){
        //default settings
            $scope.map = {
                center: {
                    latitude: 56.66,
                    longitude: 16
                },
                zoom: 10,
                bounds: {},
                options: {
                    scrollwheel: false
                }
            };


            $scope.MapOptions = {
                minZoom: 3,
                zoomControl: false,
                draggable: true,
                navigationControl: false,
                mapTypeControl: false,
                scaleControl: false,
                streetViewControl: false,
                disableDoubleClickZoom: false,
                keyboardShortcuts: true,
                markers: {
                    selected: {}
                },
                styles: [{
                    featureType: "poi",
                    elementType: "labels",
                    stylers: [{
                        visibility: "off"
                    }]
                }, {
                    featureType: "transit",
                    elementType: "all",
                    stylers: [{
                        visibility: "off"
                    }]
                }]
            };

            // Get locations
            var locations;
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
            }, function errorCallback(response){
                var ret = {"status" : response.status, "statusText": response.statusText }
                return ret;
            });


            //Create and add markers to map
            $scope.markers = [];
            var createMarkers = function() {
                for(var i = 0; i < locations.length; i++){
                    $scope.markers.push({
                        latitude: locations[i].latitude,
                        longitude: locations[i].longitude,
                        title: locations[i].name,
                        address: locations[i].address,
                        id: locations[i].id,
                        icon: 'assets/iconsurfing.png'
                    });
                }
            };
            // click event on marker
            /!*$scope.onClick = function(marker){
                console.log(marker);
                marker.model.show = !marker.model.show;
                getEvent(marker.model.id);

            };
*!/
            $scope.windowOptions = {
                show: false
            };

            $scope.onClick = function() {
                console.log("hej");
                $scope.windowOptions.show = !$scope.windowOptions.show;
            };

            $scope.closeClick = function() {
                $scope.windowOptions.visible = false;
            };

            $scope.title = "Window Title!";



            var getEvent = function(id){
                $http({
                    method: 'GET',
                    url: "http://localhost:3000/api/v1/events/show/" + id,
                    headers: {
                        'X-Api-Key': "aaaaaa"
                    },
                    cache: true
                }).then(function successCallback(response){
                    //$scope.message = response.data.message;
                    console.log(response.data.message);
                    $scope.message = response.data.message;
                }, function errorCallback(response){
                    var ret = {"status" : response.status, "statusText": response.statusText }
                    return ret;
                });
            };


 uiGmapGoogleMapApi.then(function(maps) {
 });
    }]);

    angular.module('app')
        .controller('infoWindow', ['$scope', function($scope){
            $scope.testtest = "Ny title";
        }]);
*/



