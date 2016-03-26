(function(){

    app.controller('NewCreator', function($scope, $rootScope, $http, $cookies, $window){
        $rootScope.showSearch = false;

        $scope.creator = {

        };

        $scope.saveCreator = function(){

            var info = {
                "creatorname": $scope.creator.creatorname,
                "email": $scope.creator.email,
                "password": $scope.creator.password,
                'password_confirmation': $scope.creator.password_confirmation
            };

            $http({
                method: 'POST',
                url: "http://localhost:3000/api/v1/creators/create/",
                headers: {
                    'X-Api-Key': "aaaaaa"
                },
                data: info
            }).then(function successCallback(response){
                if(response.status = 201){
                    $cookies.put('beerjoint', "Användaren sparades!");
                    $window.location.href = '/';
                }else{
                    $rootScope.warningFlash('Något gick fel!', 'Vänligen försök igen');
                }
            }, function errorCallback(data, status, headers, config){
                $rootScope.warningFlash('Något gick fel!', 'Vänligen försök igen');
            });
        };


    });

})();
