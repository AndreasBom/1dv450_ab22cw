(function(){
    app.controller('AddEvent', function($scope, $rootScope, $http, $window){
        $rootScope.showSearch = false;
        $rootScope.loading = false;
        $scope.event = {
            name: "",
            rating: null,
            message: "",
            tags: []
        };

        $scope.position = {
            address: ""
        };

        $scope.addTag = function(){
            $scope.event.tags.push({
                name: ""
            });
        };


        $scope.saveEvent = function(){
            $rootScope.loading = true;
            var info = {
                "message": $scope.event.message,
                "name": $scope.event.name,
                "rating": parseInt($scope.event.rating),
                "tags": $scope.event.tags,
                "position": {
                    "name": $scope.event.name,
                    "address": $scope.position.address
                }
            };

            $http({
                method: 'POST',
                url: "http://localhost:3000/api/v1/events/create/",
                headers: {
                    'X-Api-Key': "aaaaaa"
                },
                data: info
            }).then(function successCallback(response){
                if(response.status = 200){
                    $window.location.href = '/';
                }else{
                    $location.path('/AddEvent');
                }
            }, function errorCallback(response){
                var ret = {"status" : response.status, "statusText": response.statusText }
                return ret;
            });

        };





    });
})();
