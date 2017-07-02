angular.module("mascotas")

.directive("cdxPasos", [function () {


    return {
        scope: {

            paso: "=paso"
        },
        controller: function ($scope) {

            $scope.pasos = {
                1: true,
                2: false,
                3: false,
                4: false,
                5: false
            }

        },

        link: function (scope) {

            scope.$watch("paso", function (valor, viejoValor) {

                if (valor !== viejoValor) {

                    scope.pasos[valor] = true;

                }

            })

        },
        templateUrl: 'cdx.pasos.html'
    };


}])

.directive("cdxValidez", [function () {

    return {
        scope: {

            validez: "=validez",
            mostrar: "=mostrar"
        },
        template: '<img src="assets/images/forms/check.png" ng-show="validez" ng-if="mostrar"><img src="assets/images/forms/warning.png" ng-hide="validez"  ng-if="mostrar">'
    };

}])

.directive("cdxFormas", [function () {

    return {
        scope: {
            seleccionado: "=seleccionado"
        },
        templateUrl: 'cdx.formas.html',
        link: function (scope) {



            scope.formas = [
                {

                    url: {
                        normal: "assets/images/forms/modelo_pajarita.png",
                        selected: "assets/images/forms/modelo_pajarita_selected.png"
                    },
                    forma: "pajarita"

                },
                {
                    url: {
                        normal: "assets/images/forms/modelo_redonda.png",
                        selected: "assets/images/forms/modelo_redonda_selected.png"
                    },
                    forma: "redonda"

                }
            ]



            angular.forEach(scope.formas, function (valor, llave) {

                if (llave != 0) {

                    scope.formas[llave].url.visible = scope.formas[llave].url.normal;

                } else {

                    scope.formas[llave].url.visible = scope.formas[llave].url.selected;
                    scope.seleccionado = scope.formas[llave].forma;
                }

            });

            //seleccionar forma

            scope.seleccionar = function (indice) {

                angular.forEach(scope.formas, function (valor, llave) {

                    if (llave == indice) {

                        scope.formas[llave].url.visible = scope.formas[llave].url.selected;

                        scope.seleccionado = scope.formas[llave].forma;

                    } else {

                        scope.formas[llave].url.visible = scope.formas[llave].url.normal;
                    }

                });
            }
        }
    };

}])

.directive('cdxModelos', ["modelosService", "isMobile", function (modelosService, isMobile) {
    return {
        require: "ngModel",
        scope: true,
        templateUrl: 'cdx.modelos.html',
        controller: ["$scope", "modelosService", "apiConstant", "isMobile", function ($scope, modelosService, apiConstant, isMobile) {

            $scope.limite = function(){
                
                if(isMobile.phone){
                    
                    return 3;
                    
                }
                
                else if(isMobile.tablet){
                    
                    return 4;
                }
                
                else{
                    
                    return 6;
                    
                }
                
            }
            
            $scope.modelos = {
                pajarita: [],
                redonda: []
            }
            
            $scope.apiDir = apiConstant;

            angular.forEach($scope.modelos, function (valor, llave) {
                modelosService.listaForma(llave).then(function (res) {


                    $scope.modelos[llave] = res;
                    if ($scope.modelos[llave].length && $scope.modelos[llave] == "pajarita") {

                        $scope.modelos[llave][0].activo = true;
                        $scope.valorCorbata = $scope.modelos[llave][0].idModelo;
                    }

                })


            })




            $scope.seleccionar = function (indice, seleccionado) {

                angular.forEach($scope.modelos[seleccionado], function (valor, llave) {

                    if (llave == indice) {

                        $scope.modelos[seleccionado][llave].activo = true;

                    } else {

                        $scope.modelos[seleccionado][llave].activo = false;

                    }

                })

            }

         
            $scope.avanzar = function (salto, accion, cantidad, resultante, esperado) {
                
                if (accion) {
                    
                    
                   
                    if (salto < cantidad && resultante == esperado) {


                        $scope.cdx.salto = $scope.cdx.salto + 1;


                    }
                } else if (!accion) {

                    if (salto < cantidad && resultante == esperado) {

                        $scope.cdx.salto = $scope.cdx.salto - 1;

                    }

                }
            }

        }],
        link: function (scope, element, attrs, ngModel) {



            if (!ngModel) return;

            scope.actualizar = function () {
                ngModel.$setViewValue(scope.valorCorbata);
            };

            ngModel.$render = function () {
                scope.valorCorbata = ngModel.$modelValue;
            };



            ngModel.$validators.required = function (modelValor, viewValor) {


                if (ngModel.$isEmpty(modelValor)) {
                    // consider empty models to be valid 
                    return false;
                } else {

                    return true;
                }

            };



            attrs.$observe("seleccionado", function (nuevoValor, viejoValor) {

                if (nuevoValor !== viejoValor) {

                    scope.seleccionado = nuevoValor;

                    angular.forEach(scope.modelos[scope.seleccionado], function (valor, llave) {

                        if (scope.modelos[scope.seleccionado][llave].activo == true) {

                            scope.modelos[scope.seleccionado][llave].activo = false;

                        }


                    })

                    ngModel.$setViewValue(null)
                    
                    scope.cdx.salto = 0;

                }


            })

            
        }
    }
}])

//validaciones
.directive('cdxValidacion', function ($q, validarService) {
    return {
        require: 'ngModel',
        link: function (scope, element, attributes, ctrl) {

            if (attributes.validacion) {

                ctrl.$asyncValidators[attributes.validacion] = function (modelValor, viewValor) {

                    var defered = $q.defer();
                    var promise = defered.promise;

                    if (ctrl.$isEmpty(modelValor)) {
                        // consider empty model valid
                        return defered.resolve();
                    }

                    if (attributes.deseado == "true") {

                        if (attributes.validacion == "placa") {

                            validarService.placa(modelValor)

                            .then(function (res) {

                                defered.reject();
                            })

                            .catch(function (res) {



                                defered.resolve();
                            })

                        } else {

                            validarService.validar(attributes.validacion, modelValor)

                            .then(function (res) {

                                defered.resolve();
                            })

                            .catch(function (res) {

                                defered.reject();
                            })

                        }




                    } else if (attributes.deseado == "false") {

                        if (attributes.validacion == "placa") {

                            validarService.placa(modelValor)

                            .then(function (res) {

                                defered.resolve();
                            })

                            .catch(function (res) {



                                defered.reject();
                            })


                        } else {


                            validarService.validar(attributes.validacion, modelValor)

                            .then(function (res) {


                                defered.reject();
                            })

                            .catch(function (res) {

                                defered.resolve();
                            })

                        }

                    }

                    return promise;

                }

            }




        }
    };
})


.directive("cdxValidacionDispo", ["validarService", "$q", function (validarService, $q) {
    return {
        require: 'ngModel',
        link: function (scope, element, attributes, ctrl) {


            ctrl.$asyncValidators.disponible = function (modelValor, viewValor) {

                var defered = $q.defer();
                var promise = defered.promise;

                if (ctrl.$isEmpty(modelValor)) {
                    // consider empty model valid
                    return defered.resolve();
                }

                validarService.placaDisponible(modelValor).then(function (res) {


                    defered.resolve();
                })

                .catch(function (res) {

                    defered.reject();
                })



                return promise;

            }






        }
    };

}])

.directive("cdxValidacionClave", [function () {

    return {
        require: 'ngModel',
        link: function (scope, element, attributes, ctrl) {


            ctrl.$validators.identica = function (modelValor, viewValor) {


                if (ctrl.$isEmpty(modelValor)) {
                    // consider empty models to be valid
                    return true;
                } else if (modelValor == attributes.validacion) {

                    return true;

                } else {

                    return false;

                }

            };


            attributes.$observe('validacion', function (val) {

                ctrl.$setValidity('identica', attributes.validacion === ctrl.$viewValue);

            });




        }
    };



}])
