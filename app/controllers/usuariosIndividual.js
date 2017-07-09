angular.module("mascotas")

.controller("usuariosIndividualController", ["$scope", "adminService", "usuariosService", "idValido", function ($scope, adminService, usuariosService, idValido) {
    
    var cdx = this;
    
    
    cdx.datos = idValido;
    

}])
