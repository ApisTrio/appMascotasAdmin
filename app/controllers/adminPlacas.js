angular.module("mascotas")

.controller("adminPlacasController", ["$scope", "adminService", "$filter", function ($scope, adminService, $filter) {
    
    var cdx = this;
    
    if ($scope.$parent.seleccionado != 3) {

        $scope.$parent.seleccionado = 3;

        $scope.$parent.iconoUsuarios = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 1, $scope.$parent.iconosUsuarios);
        $scope.$parent.iconoGenerar = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 2, $scope.$parent.iconosGenerar);
        $scope.$parent.iconoPlacas = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 2, $scope.$parent.iconosPlacas);
    }



	cdx.activo = 'all'; 
	cdx.seleccion = 'all';

	cdx.ordenPor = 'codigo';
	
	cdx.ordenRevertido = false;

    cdx.placas = []


    adminService.placas()

    .then(function (res) {

    	cdx.placas = res.data.result
    
    })

    cdx.placasActivas = function() { 

    	return $filter('filter')(cdx.placas, {bloqueado: null, borrado: null}).length

	}

    cdx.placasInactivas = function() { 

    	return $filter('filter')(cdx.placas, {bloqueado: ''}).length

	}


    cdx.placasEliminadas = function() { 

    	return $filter('filter')(cdx.placas, {borrado: ''}).length

	}

	cdx.seleccionado = function(sel) {

		cdx.saltoPlacas = 0;

		if (sel == 'all') {

			cdx.activo = 'all'; 
			cdx.seleccion = 'all';

		}else if(sel == 'activas') {

			cdx.activo = {borrado: null, bloqueado: null}; 
			cdx.seleccion = 'activas';

		}else if(sel == 'inactivas') {

			cdx.activo = {bloqueado: ''}; 
			cdx.seleccion = 'inactivas';

		}else if(sel == 'eliminadas') {

			cdx.activo = {borrado: ''}; 
			cdx.seleccion = 'eliminadas';

		}

	} 



	cdx.saltoPlacas = 0;


	cdx.avanzar = function(salto, accion, cantidad){

		



		if(cantidad > 0){

			if(accion){

				cdx.saltoPlacas = salto + 10;

			} else{
				if(salto > 0){
					cdx.saltoPlacas = salto - 10;

				}
				

			}	

		}

	}

}])
