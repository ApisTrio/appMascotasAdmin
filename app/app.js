angular.module("mascotas", ["ngMessages", "ui.router", "ngAnimate", "ngMaterial", "ui.materialize", "uiSwitch", "ngMap", "ngFileUpload", "ismobile"])

.config(["$stateProvider", "$locationProvider", function ($stateProvider, $locationProvider) {

    $locationProvider.html5Mode(true);
    $locationProvider.hashPrefix('!');

    $stateProvider

    .state({
        name: 'loginAdmin',
        url: '/admin/login',
        templateUrl: 'app/views/loginAdmin.tpl',
        controller: 'loginAdminController as loginAdmin'
    })

    .state({
        name: 'admin',
        url: '/',
        abstract: true,
        templateUrl: 'app/views/admin.tpl',
        controller: 'adminController as admin'
    })

    .state({
        name: 'admin.usuarios',
        url: 'usuarios',
        templateUrl: 'app/views/admin.usuarios.tpl',
        controller: 'adminUsuariosController as adminUsuarios'
    })

    .state({
        name: 'admin.mascotas',
        url: 'mascotas',
        templateUrl: 'app/views/admin.mascotas.tpl',
        controller: 'adminMascotasController as adminMascotas'
    })

    .state({
        name: 'admin.generar',
        url: 'generar',
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

            $state.go("landing");
        } else if (error === "PLACA_INVALIDA_PRIVADA") {

            $state.go("perfil.misMascotas");

        } else {

            console.log(error);
        }

    });

}])
