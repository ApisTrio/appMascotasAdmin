angular.module("mascotas")

.controller("adminDesactivarAlertaController", ["mascotasService", "usuariosService", "$filter", "$stateParams", "$scope", "mailService", "$state", "placaValida",function (mascotasService, usuariosService, $filter, $stateParams, $scope, mailService, $state, placaValida) {

    var cdx = this;

    cdx.centro = [];

    cdx.mascotas = [];

    cdx.datos = {idMascota: placaValida.basico.idMascota };
    
    cdx.nombre =  placaValida.basico.nombre;
    
    cdx.codigo = placaValida.placas[0].codigo;


    cdx.avanzar = function (valido, idMascota) {


        if (valido) {

            mascotasService.nuevaEncontrada(idMascota).then(function (res) {
                
                cdx.opciones = cdx.opciones + 1;

            })




        }

    }



}])
