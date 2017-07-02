angular.module("mascotas")

.controller("loginAdminController", ["usuariosService", "$state", "currentAuth", "$scope", "$mdDialog", function (usuariosService, $state, currentAuth, $scope, $mdDialog) {

    var cdx = this;

    cdx.mostrarModal = function ($event, texto) {

        
        if (texto == "Clave invalida") {
            var titulo = "La clave que has introducido no es válida";
            var mensaje = "Verifica que la clave sea correcta";

        }
        
        else if(texto == "Su usuario no existe"){
            
            var titulo = "El usuario que has introducido no existe";
            var mensaje = "Verifica que el usuario sea correcto";
            
        }
        
        
        else if(texto == "Usuario inactivo"){
            
            var titulo = "Todavía no has confirmado tu cuenta";
            var mensaje = "Por favor, revisa tu bandeja de entrada y confirma tu cuenta para poder iniciar sesión";
            
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

            usuariosService.sesion(datos.usuario, datos.pass)

            .then(function (res) {

                $state.go("perfil.miPerfil");

            })

            .catch(function (res) {
                
                cdx.mostrarModal(null, res);


            })
        }

    }

}])
