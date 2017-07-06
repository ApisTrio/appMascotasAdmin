angular.module("mascotas")

.controller("adminGenerarController", ["$scope", "adminService", function ($scope, adminService) {
    
    var cdx = this;
    
    if ($scope.$parent.seleccionado != 2) {

        $scope.$parent.seleccionado = 2;

        $scope.$parent.iconoUsuarios = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 1, $scope.$parent.iconosUsuarios);
        $scope.$parent.iconoGenerar = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 2, $scope.$parent.iconosGenerar);
    }
    
    cdx.pasos = 0;
    
    cdx.ultimaDescarga = 0;
    
    cdx.generar = function(cantidad, valido){
        
        if(valido){
            adminService.generar(cantidad);
                 cdx.pasos = 1;
            cdx.ultimaDescarga = cantidad;
            cdx.numero = null;
            $scope.generarForm.$setPristine();
           
           
            
        }
        
    }
    
    

}])
