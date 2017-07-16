angular.module("mascotas")

.controller("adminController", ["$scope", "$rootScope", "adminService", "$state",function ($scope, $rootScope, adminService, $state) {
    
    var cdx = this;
    
    $scope.seleccionado = 0;

    $scope.iconosUsuarios = [
        "assets/images/menu-admin-iconos/usuarios.svg",
        "assets/images/menu-admin-iconos/usuarios_hover.svg",
        "assets/images/menu-admin-iconos/usuarios_selected.svg"
    ];
    $scope.iconosGenerar = [
        "assets/images/menu-admin-iconos/generar.svg",
        "assets/images/menu-admin-iconos/generar_hover.svg",
        "assets/images/menu-admin-iconos/generar_selected.svg"
    ];  
    $scope.iconosPlacas = [
        "assets/images/menu-admin-iconos/generar.svg",
        "assets/images/menu-admin-iconos/generar_hover.svg",
        "assets/images/menu-admin-iconos/generar_selected.svg"
    ];

    $scope.cambiarIcono = function(s, i, iconos){

        if (s == i) {
            return iconos[2];
        }

        return iconos[0];

    }
    
    
    
    $scope.$watch('$root.objetoToken', function (valor, nuevoValor) {

        if (valor !== nuevoValor) {

            if ($rootScope.objetoToken == false) {

                $state.go("loginAdmin");

            }

        }

    });
    
    
    cdx.salir = function(){
        
        adminService.salir();
        
    }
    

}])
