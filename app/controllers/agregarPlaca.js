angular.module("mascotas")

.controller("adminAgregarPlacaController", ["mascotasService", "placasService", "usuariosService", "$stateParams", "$scope", "$state", "placaValida", function (mascotasService, placasService, usuariosService, $stateParams, $scope, $state, placaValida) {

    var cdx = this;

    if ($scope.$parent.seleccionado != 1) {

        $scope.$parent.seleccionado = 1;

        $scope.$parent.iconoUsuarios = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 1, $scope.$parent.iconosUsuarios);
        $scope.$parent.iconoGenerar = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 2, $scope.$parent.iconosGenerar);
        $scope.$parent.iconoPlacas = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 3, $scope.$parent.iconosPlacas);
    }

    cdx.placa = {mascotas_idMascota: placaValida.basico.idMascota};
    
    cdx.codigo = placaValida.placas[0].codigo;

    cdx.avanzar = function (valido, datos) {

        if (valido) {

            placasService.asignar(datos).then(function (res) {

                cdx.pasos = cdx.pasos + 1;

            })

        }

    }
    
    
    cdx.volver = function (placa) {

        if (placa) {
            $state.go("perfil.misMascotasIndividual", {idPlaca: placa});
        }
        
        else{  
            $state.go("perfil.misMascotas");
        }

    }




}])
