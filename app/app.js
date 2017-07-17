angular.module("mascotas", ["ngMessages", "ui.router", "ngAnimate", "ngMaterial", "ui.materialize", "uiSwitch", "ngMap", "ngFileUpload", "ismobile"])

.config(["$stateProvider", "$locationProvider", function ($stateProvider, $locationProvider) {

    $locationProvider.html5Mode(true);
    $locationProvider.hashPrefix('!');

    $stateProvider

        .state({
        name: 'loginAdmin',
        url: '/',
        templateUrl: 'app/views/loginAdmin.tpl',
        controller: 'loginAdminController as loginAdmin',
        resolve: {
            "currentAuth": ["$q", "adminService", function ($q, adminService) {

                if (adminService.autorizado()) {

                    return $q.reject("LOGOUT_REQUIRED");
                }

                }]
        }
    })

    .state({
        name: 'admin',
        url: '/panel',
        abstract: true,
        templateUrl: 'app/views/admin.tpl',
        controller: 'adminController as admin',
        resolve: {
            "currentAuth": ["$q", "adminService", function ($q, adminService) {

                if (!adminService.autorizado()) {

                    return $q.reject("AUTH_REQUIRED");
                }

                if (!adminService.autorizado().token) {

                    usuariosService.salir();

                }

                }]
        }
    })

    .state({
        name: 'admin.usuarios',
        url: '/usuarios',
        templateUrl: 'app/views/admin.usuarios.tpl',
        controller: 'adminUsuariosController as adminUsuarios'
    })

    .state({
        name: 'admin.usuariosIndividual',
        url: '/usuarios/:idUsuario',
        templateUrl: 'app/views/admin.usuariosIndividual.tpl',
        controller: 'usuariosIndividualController as usuariosIndividual',
        resolve: {
            idValido: ["usuariosService", "$stateParams", "$q", "validarService", "mascotasService", function (usuariosService, $stateParams, $q, validarService, mascotasService) {

                var defered = $q.defer();
                var promise = defered.promise;

                validarService.validar("idUsuario", $stateParams.idUsuario).then(function (res) {

                        usuariosService.obtener($stateParams.idUsuario).then(function (resUsuario) {
                    
                            mascotasService.duenoObtener(resUsuario.duenos_idDueno).then(function(resDueno){
                                
                                resDueno.idDueno = resUsuario.duenos_idDueno;
                                var datos = {usuario:resUsuario, dueno: resDueno};
                                
                                defered.resolve(datos);
                            })
                            
                                   
            
                        });


                    })
                    .catch(function (res) {

                        defered.reject("ID_INVALIDO");

                    })

                return promise;

            }]
        }
    })
    
    .state({
        name: 'admin.usuariosNuevaMascota',
        url: '/usuarios/:idUsuario/nueva-mascota',
        templateUrl: 'app/views/admin.nuevaMascota.tpl',
        controller: 'nuevaMascotaController as nuevaMascota',
        resolve: {
            idValido: ["usuariosService", "$stateParams", "$q", "validarService", "mascotasService", function (usuariosService, $stateParams, $q, validarService, mascotasService) {

                var defered = $q.defer();
                var promise = defered.promise;

                validarService.validar("idUsuario", $stateParams.idUsuario).then(function (res) {

                        usuariosService.obtener($stateParams.idUsuario).then(function (resUsuario) {
                    
                            mascotasService.duenoObtener(resUsuario.duenos_idDueno).then(function(resDueno){
                                
                                resDueno.idDueno = resUsuario.duenos_idDueno;
                                var datos = {usuario:resUsuario, dueno: resDueno};
                                
                                defered.resolve(datos);
                            })
                            
                                   
            
                        });


                    })
                    .catch(function (res) {

                        defered.reject("ID_INVALIDO");

                    })

                return promise;

            }]
        }
        
    })



    .state({
        name: 'admin.mascota',
        url: '/mascota/{idPlaca: [0-9a-zA-Z]{4,6}}',
        templateUrl: 'app/views/admin.mascota.tpl',
        controller: 'adminMascotaController as adminMascota',
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
                    }).catch(function(res){
                        
                        defered.reject("PLACA_INVALIDA")
                        
                    })

                })

                .catch(function (res) {


                    defered.reject("PLACA_INVALIDA")

                })

                return promise;

            }]

        }
    })
    
    .state({
        name: 'admin.agregarPlaca',
        url: '/mascota/{idPlaca: [0-9a-zA-Z]{4,6}}/agregar-placa',
        templateUrl: 'app/views/admin.agregarPlaca.tpl',
        controller: 'adminAgregarPlacaController as adminAgregarPlaca',
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
                        
                        console.log(datos);
                        
                        defered.resolve(datos);
                        
                    }).catch(function(res){
                        
                        defered.reject("PLACA_INVALIDA")
                        
                    })

                })

                .catch(function (res) {


                    defered.reject("PLACA_INVALIDA")

                })

                return promise;

            }]

        }
    })
    
    .state({
        name: 'admin.activarAlerta',
        url: '/mascota/{idPlaca: [0-9a-zA-Z]{4,6}}/activar-alerta',
        templateUrl: 'app/views/admin.activarAlerta.tpl',
        controller: 'adminActivarAlertaController as adminActivarAlerta',
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
                        
                        console.log(datos);
                        
                        defered.resolve(datos);
                        
                    }).catch(function(res){
                        
                        defered.reject("PLACA_INVALIDA")
                        
                    })

                })

                .catch(function (res) {


                    defered.reject("PLACA_INVALIDA")

                })

                return promise;

            }]

        }
    })
    
    .state({
        name: 'admin.desactivarAlerta',
        url: '/mascota/{idPlaca: [0-9a-zA-Z]{4,6}}/desactivar-alerta',
        templateUrl: 'app/views/admin.desactivarAlerta.tpl',
        controller: 'adminDesactivarAlertaController as adminDesactivarAlerta',
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
                        
                        console.log(datos);
                        
                        defered.resolve(datos);
                        
                    }).catch(function(res){
                        
                        defered.reject("PLACA_INVALIDA")
                        
                    })

                })

                .catch(function (res) {


                    defered.reject("PLACA_INVALIDA")

                })

                return promise;

            }]

        }
    })
    
    .state({
        name: 'admin.placaDesvincular',
        url: '/placa-desvincular',
        templateUrl: 'app/views/admin.desvincularPlaca.tpl',
        controller: 'desvincularPlacaController as desvincularPlaca'
    })

    .state({
        name: 'admin.generar',
        url: '/generar',
        templateUrl: 'app/views/admin.generar.tpl',
        controller: 'adminGenerarController as adminGenerar'
    })

    .state({
        name: 'admin.placas',
        url: '/placas',
        templateUrl: 'app/views/admin.placas.tpl',
        controller: 'adminPlacasController as adminPlacas'
    })

   
}])

.run(["$rootScope", "$state", "$anchorScroll", function ($rootScope, $state, $anchorScroll) {

    $rootScope.$on('$stateChangeSuccess', function () {

        $anchorScroll();

    })



    $rootScope.$on("$stateChangeError", function (event, toState, toParams, fromState, fromParams, error) {
        // We can catch the error thrown when the $requireSignIn promise is rejected
        // and redirect the user back to the home page
        if (error === "AUTH_REQUIRED") {

            $state.go("loginAdmin");
        } else if (error === "LOGOUT_REQUIRED") {

            $state.go("admin.usuarios");
        } else if (error === "PLACA_INVALIDA") {

            $state.go("admin.usuarios");
        } else if (error === "ID_INVALIDO") {

            $state.go("admin.usuarios");

        }

    });

}])
