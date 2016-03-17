/*
var app = angular.module('app', ['ngRoute', 'uiGmapgoogle-maps'])
    .config(function(uiGmapGoogleMapApiProvider) {
        uiGmapGoogleMapApiProvider.configure({
            key: 'AIzaSyCkecsYpA6plPh6HyFwwlVMRLInST7Ne60',
            v: '3.20',
            libraries: 'weather,geometry,visualization'
        });
    });*/

var app = angular.module('app', ['ngRoute', 'uiGmapgoogle-maps', 'ngFlash'])
    .config(function($routeProvider, $locationProvider){
        $locationProvider.html5Mode(true);
        $routeProvider
            .when('/ShowAll', {
                templateUrl: "assets/swlls/views/All.html",
                controller: 'Gmaps'
            })
            .when('/Delete/:id', {
                templateUrl: "assets/swlls/views/Delete.html",
                controller: 'Delete'
            })
            .when('/AddEvent', {
                templateUrl: "assets/swlls/views/AddEvent.html",
                controller: 'AddEvent'
            })
            .when('/NewCreator', {
                templateUrl: "assets/swlls/views/NewCreator.html",
                controller: 'NewCreator'
            })

            .otherwise({ redirectTo: '/ShowAll' });

    });
