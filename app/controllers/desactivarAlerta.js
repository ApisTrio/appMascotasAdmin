angular.module("mascotas")

.controller("adminDesactivarAlertaController", ["mascotasService", "usuariosService", "$filter", "$stateParams", "$scope", "mailService", "$state", "placaValida",function (mascotasService, usuariosService, $filter, $stateParams, $scope, mailService, $state, placaValida) {

    var cdx = this;
    
    if ($scope.$parent.seleccionado != 1) {

        $scope.$parent.seleccionado = 1;

        $scope.$parent.iconoUsuarios = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 1, $scope.$parent.iconosUsuarios);
        $scope.$parent.iconoGenerar = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 2, $scope.$parent.iconosGenerar);
        $scope.$parent.iconoPlacas = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 3, $scope.$parent.iconosPlacas);
         $scope.$parent.iconoDesvincular = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 4, $scope.$parent.iconosDesvincular);
    }

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
