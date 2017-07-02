angular.module("mascotas", ["ngMessages", "ui.router", "ngAnimate", "ngMaterial", "ui.materialize", "uiSwitch", "ngMap", "ngFileUpload", "ismobile"])

.config(["$stateProvider", "$locationProvider", function ($stateProvider, $locationProvider) {

    $locationProvider.html5Mode(true);
    $locationProvider.hashPrefix('!');

    $stateProvider

        .state({
        name: 'landing',
        url: '/',
        templateUrl: 'app/views/landing.tpl',
        controller: 'landingController as landing'
    })


    .state({
        name: 'loginAdmin',
        url: '/admin/login',
        templateUrl: 'app/views/loginAdmin.tpl',
        controller: 'loginAdminController as loginAdmin'
    })

    .state({
        name: 'admin',
        url: '/admin',
        abstract: true,
        templateUrl: 'app/views/admin.tpl',
        controller: 'adminController as admin'
    })

    .state({
        name: 'admin.usuarios',
        url: '/usuarios',
        templateUrl: 'app/views/admin.usuarios.tpl',
        controller: 'adminUsuariosController as adminUsuarios'
    })

    .state({
        name: 'admin.usuarios.',
        url: '/usuarios',
        templateUrl: 'app/views/admin.usuarios.tpl',
        controller: 'adminUsuariosController as adminUsuarios'
    })

    .state({
        name: 'admin.mascotas',
        url: '/mascotas',
        templateUrl: 'app/views/admin.mascotas.tpl',
        controller: 'adminMascotasController as adminMascotas'
    })

    .state({
        name: 'admin.generar',
        url: '/generar',
        templateUrl: 'app/views/admin.generar.tpl',
        controller: 'adminMascotasController as adminMascotas'
    })


    .state({
        name: 'registroUsuario',
        url: '/registro',
        templateUrl: 'app/views/registroUsuario.tpl',
        controller: 'registroController as registro',
        resolve: {
            "currentAuth": ["$q", "usuariosService", function ($q, usuariosService) {

                if (usuariosService.autorizado()) {

                    return $q.reject("LOGOUT_REQUIRED");
                }

                }]
        }
    })

    ////////////////////////////////////
    /////Mascotas Perdidas e hijos//////
    ////////////////////////////////////

    .state({
        name: 'mascotasPerdidas',
        url: '/mascotas-perdidas',
        templateUrl: 'app/views/mascotasPerdidas.tpl',
        controller: 'mascotasPerdidasController as mascotasPerdidas'

    })

    ////////////////////////////
    //////Perfil e hijos////////
    ////////////////////////////

    .state({
        name: 'perfil',
        url: '/perfil',
        abstract: true,
        templateUrl: 'app/views/perfil.tpl',
        controller: 'perfilController as perfil',
        resolve: {
            "currentAuth": ["$q", "usuariosService", function ($q, usuariosService) {

                if (!usuariosService.autorizado()) {
                    
                    return $q.reject("AUTH_REQUIRED");
                }
                
                 if(!usuariosService.autorizado().dueno){
                        
                        usuariosService.salir();
                        
                    }

                }]
        }
    })

    .state({
        name: 'perfil.miPerfil',
        url: '/mi-perfil',
        templateUrl: 'app/views/perfil.miPerfil.tpl',
        controller: 'miPerfilController as miPerfil'
    })

    .state({
        name: 'perfil.eliminarCuenta',
        url: '/eliminar-cuenta',
        templateUrl: 'app/views/perfil.eliminarCuenta.tpl',
        controller: 'eliminarCuentaController as eliminarCuenta'

    })

    .state({
        name: 'perfil.mascotaPerdida',
        url: '/mascota-perdida',
        templateUrl: 'app/views/perfil.mascotaPerdida.tpl',
        controller: 'mascotaPerdidaController as mascotaPerdida'
    })

    .state({
        name: 'perfil.activarAlerta',
        url: '/activar-alerta',
        templateUrl: 'app/views/perfil.activarAlerta.tpl',
        controller: 'activarAlertaController as activarAlerta'
    })

    .state({
        name: 'perfil.desactivarAlerta',
        url: '/desactivar-alerta?idMascota',
        templateUrl: 'app/views/perfil.desactivarAlerta.tpl',
        controller: 'desactivarAlertaController as desactivarAlerta',
        params: {
            idMascota: null
        }
    })

    .state({
        name: 'perfil.misMascotas',
        url: '/mis-mascotas',
        templateUrl: 'app/views/perfil.misMascotas.tpl',
        controller: 'misMascotasController as misMascotas'
    })

    .state({
        name: 'perfil.misMascotasPlaca',
        url: '/mis-mascotas/nueva-placa?idMascota',
        templateUrl: 'app/views/perfil.misMascotas.placa.tpl',
        controller: 'misMascotasPlacaController as misMascotasPlaca',
        params: {
            idMascota: null
        }
    })

    .state({
        name: 'perfil.misMascotasNueva',
        url: '/mis-mascotas/nueva-mascota',
        templateUrl: 'app/views/perfil.misMascotas.nueva.tpl',
        controller: 'misMascotasNuevaController as misMascotasNueva'
    })

    .state({
        name: 'perfil.misMascotasIndividual',
        url: '/mis-mascotas/{idPlaca: [0-9a-zA-Z]{4,6}}',
        templateUrl: 'app/views/perfil.misMascotas.individual.tpl',
        controller: 'misMascotasIndividualController as misMascotasIndividual',
        resolve: {
            placaValida: ["placasService", "mascotasService", "$stateParams", "$q", "placasService", function (placasService, mascotasService, $stateParams, $q, placasService) {
                var defered = $q.defer();
                var promise = defered.promise;

                placasService.verificarAsignada($stateParams.idPlaca).then(function (res) {



                    $q.all([
                        mascotasService.datos(res.mascotas_idMascota).then(res), mascotasService.duenosMascota(res.mascotas_idMascota).then(res), placasService.placasAsignadas(res.mascotas_idMascota).then(res)
                    ]).then(function (resGlobal) {

                        var datos = {
                            basico: resGlobal[0],
                            duenos: resGlobal[1],
                            placas: resGlobal[2]
                        }

                        defered.resolve(datos);
                    })

                })

                .catch(function (res) {


                    defered.reject("PLACA_INVALIDA_PRIVADA")

                })

                return promise;

            }]

        }
    })

    .state({
            name: 'perfil.misMascotasEditar',
            url: '/mis-mascotas/{idPlaca: [0-9a-zA-Z]{4,6}}/editar',
            templateUrl: 'app/views/perfil.misMascotas.editar.tpl',
            controller: 'misMascotasEditarController as misMascotasEditar'
        })
        .state({
            name: 'perfil.misMascotasEliminar',
            url: '/mis-mascotas/{idPlaca: [0-9a-zA-Z]{4,6}}/eliminar',
            templateUrl: 'app/views/perfil.misMascotas.eliminar.tpl',
            controller: 'misMascotasEliminarController as misMascotasEliminar',
            resolve: {
                placaValida: ["placasService", "mascotasService", "$stateParams", "$q", "placasService", function (placasService, mascotasService, $stateParams, $q, placasService) {
                    var defered = $q.defer();
                    var promise = defered.promise;

                    placasService.verificarAsignada($stateParams.idPlaca).then(function (res) {

                        defered.resolve(res.mascotas_idMascota);

                    })

                    .catch(function (res) {

                        defered.reject("PLACA_INVALIDA_PRIVADA");

                    })

                    return promise;

                }]

            }


        })

    ////////////////////////////
    ////////// Login ///////////
    ////////////////////////////

    .state({
        name: 'login',
        url: '/login',
        templateUrl: 'app/views/login.tpl',
        controller: 'loginController as login',
        resolve: {
            "currentAuth": ["$q", "usuariosService", function ($q, usuariosService) {

                if (usuariosService.autorizado()) {

                    return $q.reject("LOGOUT_REQUIRED");
                }

                }]
        }
    })

    ////////////////////////////
    /////Confirmar Cuenta///////
    ////////////////////////////

    .state({
        name: 'confirmar',
        url: '/confirmar/:id/:token',
        templateUrl: 'app/views/confirmar.tpl',
        controller: 'confirmarController as confirmar'

    })


    ////////////////////////////
    /// Recordar Usuario ///////
    ////////////////////////////   

    .state({
        name: 'recordarUsuario',
        url: '/recordar-usuario',
        templateUrl: 'app/views/recordarUsuario.tpl',
        controller: 'recordarUsuarioController as recordarUsuario'
    })

    ////////////////////////////
    /// Cambiar contraseña ///////
    ////////////////////////////   

    .state({
        name: 'cambiarContrasena',
        url: '/cambiar-contrasena',
        templateUrl: 'app/views/cambiarContrasena.tpl',
        controller: 'cambiarContrasenaController as cambiarContrasena'
    })
    
    .state({
        name: 'eliminarCuenta',
        url: '/eliminar-cuenta/:token',
        templateUrl: 'app/views/eliminarCuentaPublico.tpl',
        controller: 'eliminarCuentaPublicoController as eliminarCuentaPublico'
        
    })

    .state({
        name: 'cambiarContrasenaConfirmar',
        url: '/cambiar-contrasena/:token',
        templateUrl: 'app/views/cambiarContrasenaConfirmar.tpl',
        controller: 'cambiarContrasenaController as cambiarContrasena'
    })

    ////////////////////////////
    ////////// Placa ///////////
    ////////////////////////////

    .state({
        name: 'placa',
        url: '/{idPlaca: [0-9a-zA-Z]{4,6}}',
        templateUrl: 'app/views/placa.tpl',
        controller: 'placaController as placa',
        resolve: {
            placaValida: ["placasService", "mascotasService", "$stateParams", "$q", function (placasService, mascotasService, $stateParams, $q) {
                var defered = $q.defer();
                var promise = defered.promise;

                placasService.verificarAsignada($stateParams.idPlaca).
                then(function (res) {



                    $q.all([
                        mascotasService.datos(res.mascotas_idMascota).then(res),
                        mascotasService.duenosMascota(res.mascotas_idMascota).then(res)
                    ]).then(function (resGlobal) {

                        var datos = {
                            basico: resGlobal[0],
                            duenos: resGlobal[1]
                        }


                        defered.resolve(datos);
                    })



                })

                .catch(function (res) {


                    defered.reject("PLACA_INVALIDA")

                })

                return promise;

            }]

        }
    });



    //$locationProvider.html5Mode(true);


}])

.run(["$rootScope", "$state", "$anchorScroll",function ($rootScope, $state,  $anchorScroll) {
    
    $rootScope.$on('$stateChangeSuccess', function() {
        
        $anchorScroll();
        
    })
                   
                   

    $rootScope.$on("$stateChangeError", function (event, toState, toParams, fromState, fromParams, error) {
        // We can catch the error thrown when the $requireSignIn promise is rejected
        // and redirect the user back to the home page
        if (error === "AUTH_REQUIRED") {

            $state.go("login");
        } else if (error === "LOGOUT_REQUIRED") {

            $state.go("perfil.miPerfil");
        } else if (error === "PLACA_INVALIDA") {

            $state.go("landing");
        } else if (error === "PLACA_INVALIDA_PRIVADA") {

            $state.go("perfil.misMascotas");

        } else {

            console.log(error);
        }

    });

}])
