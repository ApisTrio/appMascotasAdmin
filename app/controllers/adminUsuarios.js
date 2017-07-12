angular.module("mascotas")

.controller("adminUsuariosController", ["$scope", "adminService", "$filter", function ($scope, adminService, $filter) {
    
    var cdx = this;
    
    if ($scope.$parent.seleccionado != 1) {

        $scope.$parent.seleccionado = 1;

        $scope.$parent.iconoUsuarios = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 1, $scope.$parent.iconosUsuarios);
        $scope.$parent.iconoGenerar = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 2, $scope.$parent.iconosGenerar);
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

    cdx.registrosActivos = function() { 

    	return $filter('filter')(cdx.registros, {activo: 1}).length

	}

    cdx.registrosInactivos = function() { 

    	return $filter('filter')(cdx.registros, {activo: 0}).length

	}

	cdx.exportarFin = true;

	cdx.exportar = function() {

		if(cdx.exportarFin){ 

			cdx.exportarFin = false;

			var table = angular.element('#registros').html();

				adminService.exportar(table)

			    .then(function (res) {

			    	cdx.exportarFin = true;
			    
			    })

		}

	

	}
}])
