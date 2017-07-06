angular.module("mascotas")

.controller("adminController", ["$scope", function ($scope) {
    
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

    $scope.cambiarIcono = function(s, i, iconos){

        if (s == i) {
            return iconos[2];
        }

        return iconos[0];

    }

}])
