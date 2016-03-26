
(function(){

    app.controller('NavigationViewModel', function($scope, $rootScope, $location, $window, $cookies, Flash){

        $scope.navigation = function(value, id){
            if(id == undefined){
                id="";
            }
            navigateTo(value + id);
        };

        $scope.relocateTo = function (path){
            console.log("Relocate");
            $window.location.href = path;
        };

        var navigateTo = function(path){
            return $location.path(path);
        };

        $scope.successFlash = function (message) {
            var message = '<strong>' + message + ' ' + '</strong>';
            var id = Flash.create('success', message, 7000, {class: 'custom-class', id: 'custom-id'}, true);
            // First argument (string) is the type of the flash alert.
            // Second argument (string) is the message displays in the flash alert (HTML is ok).
            // Third argument (number, optional) is the duration of showing the flash. 0 to not automatically hide flash (user needs to click the cross on top-right corner).
            // Fourth argument (object, optional) is the custom class and id to be added for the flash message created.
            // Fifth argument (boolean, optional) is the visibility of close button for this flash.
            // Returns the unique id of flash message that can be used to call Flash.dismiss(id); to dismiss the flash message.
        };

        $rootScope.warningFlash = function (message) {
            var message = '<strong>' + message + ' ' + '</strong>';
            var id = Flash.create('danger', message, 7000, {class: 'custom-class', id: 'custom-id'}, true);

        };

        var message = $cookies.get('beerjoint');

        if(message !== undefined){

            $scope.successFlash(message);
            $cookies.remove('beerjoint');
        }

/*
        $rootScope.successFlash = function (head, body) {
            var message = '<strong>' + head + ' ' + '</strong>' + body;
            var id = Flash.create('success', message, 7000, {class: 'custom-class', id: 'custom-id'}, true);
            // First argument (string) is the type of the flash alert.
            // Second argument (string) is the message displays in the flash alert (HTML is ok).
            // Third argument (number, optional) is the duration of showing the flash. 0 to not automatically hide flash (user needs to click the cross on top-right corner).
            // Fourth argument (object, optional) is the custom class and id to be added for the flash message created.
            // Fifth argument (boolean, optional) is the visibility of close button for this flash.
            // Returns the unique id of flash message that can be used to call Flash.dismiss(id); to dismiss the flash message.
        };

        $rootScope.warningFlash = function (head, body) {
            var message = '<strong>' + head + ' ' + '</strong>' + body;
            var id = Flash.create('danger', message, 7000, {class: 'custom-class', id: 'custom-id'}, true);

        };*/



    });




})();