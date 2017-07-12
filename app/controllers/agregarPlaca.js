angular.module("mascotas")

.controller("adminAgregarPlacaController", ["mascotasService", "placasService", "usuariosService", "$stateParams", "$scope", "$state", "placaValida", function (mascotasService, placasService, usuariosService, $stateParams, $scope, $state, placaValida) {

    var cdx = this;

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
