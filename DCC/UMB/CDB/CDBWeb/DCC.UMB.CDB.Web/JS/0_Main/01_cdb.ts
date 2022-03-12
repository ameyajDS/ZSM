/// <reference path="../app-include.ts"/>
var cdbApp = angular.module("CDB", ["ngRoute", "wdf", "ngGrid"]);
cdbApp.config(['$routeProvider', function ($routeProvider: ng.route.IRouteProvider) {
    wdf.utils.packageId = cdbApp.name;//Set the packageId here and this will be visible to the entire TypeScript/JavaScript code.
    $routeProvider.otherwise({
        templateUrl: '/cdb/Partials/Default'
    });

}]);


  