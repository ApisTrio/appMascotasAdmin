angular.module("mascotas", ["ngMessages", "ui.router", "ngAnimate", "ngMaterial", "ui.materialize", "uiSwitch", "ngMap", "ngFileUpload", "ismobile"])

.config(["$stateProvider", "$locationProvider", function ($stateProvider, $locationProvider) {

    $locationProvider.html5Mode(true);
    $locationProvider.hashPrefix('!');

    $stateProvider

    .state({
        name: 'loginAdmin',
        url: '/',
        templateUrl: 'app/views/loginAdmin.tpl',
        controller: 'loginAdminController as loginAdmin'
    })

    .state({
        name: 'admin',
        url: '/panel',
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
        name: 'admin.mascota',
        url: '/mascota/{idPlaca: [0-9a-zA-Z]{4,6}}',
        templateUrl: 'app/views/admin.mascotas.tpl',
        controller: 'adminMascotasController as adminMascotas',
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


                    defered.reject("PLACA_INVALIDA")

                })

                return promise;

            }]

        }
    })

    .state({
        name: 'admin.generar',
        url: '/generar',
        templateUrl: 'app/views/admin.generar.tpl',
        controller: 'adminGenerarController as adminGenerar'
    })

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

            $state.go("admin.usuarios");
        }

    });

}])
