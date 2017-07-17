angular.module("mascotas")

.controller("adminActivarAlertaController", ["NavigatorGeolocation", "NgMap", "mascotasService", "usuariosService", "$filter", "mailService", "$scope", "placaValida", function (NavigatorGeolocation, NgMap, mascotasService, usuariosService, $filter, mailService, $scope, placaValida) {

    var cdx = this;
    
    if ($scope.$parent.seleccionado != 1) {

        $scope.$parent.seleccionado = 1;

        $scope.$parent.iconoUsuarios = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 1, $scope.$parent.iconosUsuarios);
        $scope.$parent.iconoGenerar = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 2, $scope.$parent.iconosGenerar);
        $scope.$parent.iconoPlacas = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 3, $scope.$parent.iconosPlacas);
    }
    
    cdx.centro = [];

    cdx.mascotas = [];

    cdx.datos = {
        fecha: null,
        ubicacion: null,
        mensaje: null,
        mascota: null,
        idMascota: placaValida.basico.idMascota
    };

    cdx.codigo = placaValida.placas[0].codigo;

    cdx.nombre = placaValida.basico.nombre;
    cdx.hoy = new Date();

    NavigatorGeolocation.getCurrentPosition()

    .then(function (position) {

        cdx.centro[0] = position.coords.latitude;
        cdx.centro[1] = position.coords.longitude;

        cdx.datos.ubicacion = JSON.stringify({
            latitud: position.coords.latitude,
            longitud: position.coords.longitude
        });

        cdx.mostrarMapa = true;


    });




    cdx.mapaCargado = function () {


        NgMap.getMap().then(function (map) {



            google.maps.event.addListener(map, "idle", function () {
                var center = map.getCenter();
                google.maps.event.trigger(map, 'resize');
                map.setCenter(center);
               
            });

        });
    }


    cdx.avanzar = function (valido, datos) {

        if (valido) {

            if (cdx.opciones < 3) {

                cdx.opciones = cdx.opciones + 1;

            } else if (cdx.opciones == 3) {

                datos.fecha = $filter('date')(cdx.hoy, "dd/MM/yyyy")

                mascotasService.nuevaPerdida(datos)

                .then(function (res) {

                    cdx.opciones = cdx.opciones + 1;


                })

                .catch(function (res) {

                    console.log("error")

                })

            }

        }

    }

}])
