angular.module("mascotas")

.controller("adminGenerarController", ["$scope", function ($scope) {
    
    var cdx = this;
    
    if ($scope.$parent.seleccionado != 2) {

        $scope.$parent.seleccionado = 2;

        $scope.$parent.iconoUsuarios = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 1, $scope.$parent.iconosUsuarios);
        $scope.$parent.iconoGenerar = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 2, $scope.$parent.iconosGenerar);
    }
    

}])
