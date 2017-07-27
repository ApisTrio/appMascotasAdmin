angular.module("mascotas")

.controller("adminPlacasController", ["$scope", "adminService", "$filter", function ($scope, adminService, $filter) {
    
    var cdx = this;
    
    if ($scope.$parent.seleccionado != 3) {

        $scope.$parent.seleccionado = 3;

        $scope.$parent.iconoUsuarios = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 1, $scope.$parent.iconosUsuarios);
        $scope.$parent.iconoGenerar = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 2, $scope.$parent.iconosGenerar);
        $scope.$parent.iconoPlacas = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 3, $scope.$parent.iconosPlacas);
         $scope.$parent.iconoDesvincular = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 4, $scope.$parent.iconosDesvincular);
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



	cdx.exportarFin = true;

	cdx.exportar = function() {

		if(cdx.exportarFin){ 

			cdx.exportarFin = false;

			adminService.exportarPlacas($scope.placasFiltradas)

		    .then(function (res) {

		    	cdx.exportarFin = true;
		    
		    })

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
    
    
    
    cdx.rango = function (total) {

        //total = 101;

        var numeracion = [];

        var rango = isFinite(total / 10) ? total / 10 : 1;

        for (i = 0; i < rango; i++) {

            numeracion.push(i + 1);

        }

        return numeracion;

    }


    cdx.paginacion = function (paginaActiva, paginaActual) {


        if (paginaActiva > paginaActual) {

            if ((paginaActiva - paginaActual) <= 2) {

                return true;

            } else {

                return false;

            }

        } else if (paginaActual > paginaActiva) {

            if ((paginaActual - paginaActiva) <= 2) {

                return true;

            } else {

                return false;

            }

        } else {

            return true;

        }


    }


    cdx.mostrarSuspenso = function (activa, paginas, posicion) {

        var respuesta = false;
        
        if (posicion == "izquierda") {
           
            angular.forEach(paginas, function (valor, llave) {
                
                if (valor <= activa) {
                    
                    if (!((activa - valor) <= 3)) {

                        respuesta = true;

                    }

                }

            })

        } else if (posicion == "derecha") {

            angular.forEach(paginas, function (valor, llave) {

                if (activa <= valor) {

                    if (!((valor - activa) <= 3)) {
                       
                        respuesta = true;

                    }

                }

            })

        }
        
        
        return respuesta;

    }

}])
