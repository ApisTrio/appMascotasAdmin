angular.module("mascotas")

.controller("desvincularPlacaController", ["$scope", "adminService", "mascotasService", "placasService", "$q", function ($scope, adminService, mascotasService, placasService, $q) {

    var cdx = this;

      if ($scope.$parent.seleccionado != 4) {

        $scope.$parent.seleccionado = 4;

        $scope.$parent.iconoUsuarios = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 1, $scope.$parent.iconosUsuarios);
        $scope.$parent.iconoGenerar = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 2, $scope.$parent.iconosGenerar);
        $scope.$parent.iconoPlacas = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 3, $scope.$parent.iconosPlacas);
        $scope.$parent.iconoDesvincular = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 4, $scope.$parent.iconosDesvincular);
    }
    
    cdx.datos = null;

    cdx.buscarDatos = function (codigo) {

        placasService.verificarAsignada(codigo).then(function (res) {
            cdx.idPlaca = res.placas_idPlaca;

            $q.all([
                        mascotasService.datos(res.mascotas_idMascota).then(res), mascotasService.duenosMascota(res.mascotas_idMascota).then(res), placasService.placasAsignadas(res.mascotas_idMascota).then(res)
                    ])


            .then(function (resGlobal) {

                var datos = {
                    basico: resGlobal[0],
                    duenos: resGlobal[1],
                    placas: resGlobal[2]
                }

                cdx.datos = datos;

            })

            .catch(function (res) {

                cdx.datos = null;

            })


        })

        .catch(function (res) {

            cdx.datos = null;
            cdx.idPlaca = null;

        })

    }
    
    
    cdx.desvincular = function(idPlaca){
        
        
        adminService.desvincular(idPlaca).then(function(res){
            
            cdx.pasos = 2
            
        }).catch(function(res){
            
        })
        
    }



}])
