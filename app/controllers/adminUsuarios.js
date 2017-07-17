angular.module("mascotas")

.controller("adminUsuariosController", ["$scope", "adminService", "$filter", function ($scope, adminService, $filter) {
    
    var cdx = this;
    
    if ($scope.$parent.seleccionado != 1) {

        $scope.$parent.seleccionado = 1;

        $scope.$parent.iconoUsuarios = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 1, $scope.$parent.iconosUsuarios);
        $scope.$parent.iconoGenerar = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 2, $scope.$parent.iconosGenerar);
        $scope.$parent.iconoPlacas = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 2, $scope.$parent.iconosPlacas);
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

			adminService.exportar($scope.usuariosFiltrados)

		    .then(function (res) {

		    	cdx.exportarFin = true;
		    
		    })

		}

	

	}

cdx.saltoUsuarios = 0;


	cdx.avanzar = function(salto, accion, cantidad){

		



		if(cantidad > 0){

			if(accion){

				cdx.saltoUsuarios = salto + 10;

			} else{
				if(salto > 0){
					cdx.saltoUsuarios = salto - 10;

				}
				

			}	

		}

	}
}])
