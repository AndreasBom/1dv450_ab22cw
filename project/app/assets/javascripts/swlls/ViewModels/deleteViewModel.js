(function(){
    app.controller('Delete', function($scope, $rootScope, $routeParams, $http, $location, $window){
        $rootScope.showSearch = false;

        var eventId = $routeParams.id;
        var creatorIdOfEvent = "";
        var creatorObj= "";

        //Get creator id of specific event
        $scope.filteredEvents.forEach(function(event){
            if(event.id == eventId){
                creatorIdOfEvent = event.creator_id;
            }
        });

        //validated on client that username is same as creator of event
/*        $scope.usernameOnBlur = function(){
            $scope.showMessage = false;
            if(creatorObj.creatorname != $scope.username){
                $scope.message = "Du är inte behörig att radera eventet!";
                $scope.showMessage = true;
            }
        };*/


        $scope.deleteEvent = function(){
            $http({
                method: 'DELETE',
                url: "http://localhost:3000/api/v1/events/delete/" + eventId,
                headers: {
                    'X-Api-Key': "aaaaaa"
                }
            }).then(function successCallback(response){
                if(response.status = 200){
                    $window.location.href = '/';
                }else{
                    $location.path('/Delete');
                }
            }, function errorCallback(response){
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
