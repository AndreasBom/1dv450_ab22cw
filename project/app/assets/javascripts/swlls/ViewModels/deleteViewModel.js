(function(){
    app.controller('Delete', function($scope, $rootScope, $routeParams, $http, $location, $cookies, $window){
        $rootScope.showSearch = false; //Hide search bar
        $rootScope.loading = false; //Hide loading

        var eventId = $routeParams.id;
        var creatorIdOfEvent = "";
        var creatorObj= "";

        //Get creator id of specific event
        $scope.eventsToShow.forEach(function(event){
            if(event.id == eventId){
                creatorIdOfEvent = event.creator_id;
            }
        });

        $scope.deleteEvent = function(){
            $rootScope.loading = true;
            $http({
                method: 'DELETE',
                url: "http://localhost:3000/api/v1/events/delete/" + eventId,
                headers: {
                    'X-Api-Key': "aaaaaa"
                }
            }).then(function successCallback(response){
                if(response.status = 200){
                    $cookies.put('beerjoint', "Haket har raderats!");
                    $window.location.href = '/';
                }else{
                    $scope.message = "Det gick inte radera haket";
                    $location.path('/Delete');
                }
            }, function errorCallback(response){
                $rootScope.loading = false;
                var ret = {"status" : response.status, "statusText": response.statusText }
                return ret;
            });
        };



        //find creator (username)

        $http({
            method: 'GET',
            url: "http://localhost:3000/api/v1/creators/show/" + creatorIdOfEvent,
            headers: {
                'X-Api-Key': "aaaaaa"
            },
            cache: true
        }).then(function successCallback(response){
            creatorObj = response.data;

        }, function errorCallback(response){
            var ret = {"status" : response.status, "statusText": response.statusText }
            return ret;
        });

    });
})();
