(function(){

    app.controller('NewCreator', function($scope, $rootScope, $http, $cookies, $window){
        $rootScope.showSearch = false;

        $scope.creator = {};

        //checks password and password_confirmation
        $scope.checkPassword = function(){

            if($scope.creator.password !== $scope.creator.password_confirmation){
                $scope.validationMessage = true;
                $scope.message = "Lösenorden stämmer inte överens"
            }else{
                $scope.validationMessage = false;
            }
        };

        //Password needs to be minimum 6 characters long
        $scope.validatePassword = function(){

            if($scope.creator.password === undefined){
                $scope.creator.password = "";
            }
            if($scope.creator.password.length < 6){
                $scope.validationMessage = true;
                $scope.message = "Lösenordet måste vara minst 6 tecken långt";
            }else{
                $scope.validationMessage = false;
            }
        };

        //Simple email validation
        $scope.validateEmail = function(){
            var hasAt = false;
            var hasDot = false;

            for(var i = 0; i < $scope.creator.email.length; i++){

                if($scope.creator.email.charAt(i) === "@"){
                    hasAt = true;
                    console.log(hasAt);
                }
                if(hasAt === true && $scope.creator.email.charAt(i) === "."){
                    hasDot = true;
                    console.log(hasDot);
                }
            }

            if(hasAt === true && hasDot === true){
                $scope.validationMessage = false;
            }else{
                $scope.validationMessage = true;
                $scope.message = "Ingen giltig email";
            }
        };


        $scope.saveCreator = function(){

            //If validation fails
            if($scope.validationMessage === true){
                return
            }

            var info = {
                "creatorname": $scope.creator.creatorname,
                "email": $scope.creator.email,
                "password": $scope.creator.password,
                'password_confirmation': $scope.creator.password_confirmation
            };

            $http({
                method: 'POST',
                url: "/api/v1/creators/create/",
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
