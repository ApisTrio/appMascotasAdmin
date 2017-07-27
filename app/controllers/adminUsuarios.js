angular.module("mascotas")

.controller("adminUsuariosController", ["$scope", "adminService", "$filter", function ($scope, adminService, $filter) {

    var cdx = this;

    if ($scope.$parent.seleccionado != 1) {

        $scope.$parent.seleccionado = 1;

        $scope.$parent.iconoUsuarios = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 1, $scope.$parent.iconosUsuarios);
        $scope.$parent.iconoGenerar = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 2, $scope.$parent.iconosGenerar);
        $scope.$parent.iconoPlacas = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 3, $scope.$parent.iconosPlacas);
        $scope.$parent.iconoDesvincular = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 4, $scope.$parent.iconosDesvincular);
    }

    cdx.activo = 'all'

    cdx.ordenPor = 'usuario';

    cdx.ordenRevertido = false;

    cdx.registros = []


    adminService.registros()

    .then(function (res) {

        cdx.registros = res.data.result

    })

    cdx.busqueda = function (datos) {

        adminService.busqueda(datos)

        .then(function (res) {

            cdx.registros = res.data.result
            console.log(res.data.result)

        })

    }

    cdx.registrosActivos = function () {

        return $filter('filter')(cdx.registros, {
            activo: 1
        }).length

    }

    cdx.registrosInactivos = function () {

        return $filter('filter')(cdx.registros, {
            activo: 0
        }).length

    }

    cdx.exportarFin = true;

    cdx.exportar = function () {

        if (cdx.exportarFin) {

            cdx.exportarFin = false;

            adminService.exportar($scope.usuariosFiltrados)

            .then(function (res) {

                cdx.exportarFin = true;

            })

        }



    }

    cdx.saltoUsuarios = 0;


    cdx.avanzar = function (salto, accion, cantidad) {





        if (cantidad > 0) {

            if (accion) {

                cdx.saltoUsuarios = salto + 10;

            } else {
                if (salto > 0) {

                    cdx.saltoUsuarios = salto - 10;

                }


            }

        }

    }


    cdx.rango = function (total) {

        //total = 101;

        var numeracion = [];

        var rango = isFinite(total / 10) ? total / 10 : 1;

        for (i = 0; i < rango; i++) {

            numeracion.push(i + 1);

        }

        return numeracion;

    }


    cdx.paginacion = function (paginaActiva, paginaActual) {


        if (paginaActiva > paginaActual) {

            if ((paginaActiva - paginaActual) <= 2) {

                return true;

            } else {

                return false;

            }

        } else if (paginaActual > paginaActiva) {

            if ((paginaActual - paginaActiva) <= 2) {

                return true;

            } else {

                return false;

            }

        } else {

            return true;

        }


    }


    cdx.mostrarSuspenso = function (activa, paginas, posicion) {

        var respuesta = false;
        
        if (posicion == "izquierda") {
           
            angular.forEach(paginas, function (valor, llave) {
                
                if (valor <= activa) {
                    
                    if (!((activa - valor) <= 3)) {

                        respuesta = true;

                    }

                }

            })

        } else if (posicion == "derecha") {

            angular.forEach(paginas, function (valor, llave) {

                if (activa <= valor) {

                    if (!((valor - activa) <= 3)) {
                       
                        respuesta = true;

                    }

                }

            })

        }
        
        
        return respuesta;

    }

}])
