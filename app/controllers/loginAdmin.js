angular.module("mascotas")

.controller("loginAdminController", ["adminService", "$state", "currentAuth", "$scope", "$mdDialog", function (adminService, $state, currentAuth, $scope, $mdDialog) {

    var cdx = this;

    cdx.mostrarModal = function ($event, texto) {

        
        if (texto == "datos-invalidos") {
            var titulo = "Los datos introducidos son incorrectos";
            var mensaje = "Verifica que el usuario o la contraseña sean correctos";

        }
        
        $mdDialog.show({
            parent: angular.element(document.body),
            targetEvent: $event,
            templateUrl: "cdx.falloLogin.html",
            locals: {
                mensaje: mensaje,
                titulo: titulo,
            },
            controller: function ($scope, $mdDialog, mensaje, titulo) {

                $scope.cerrarModal = function () {
                    $mdDialog.hide();
                }
                
                $scope.mensaje = mensaje;
                $scope.titulo = titulo;
            },
            clickOutsideToClose: true,
            escapeToClose: true
        });



    }


    cdx.iniciarSesion = function (datos, valido) {

        $scope.loginForm.$setSubmitted();

        if (valido) {

            adminService.login(datos)

            .then(function (res) {

                $state.go("admin.usuarios");

            })

            .catch(function (res) {
                
                cdx.mostrarModal(null, 'datos-invalidos');


            })
        }

    }

}])
