angular.module("mascotas")

.controller("adminMascotaController", ["placasService", "mascotasService", "$stateParams", "placaValida", "apiConstant", "$filter", "razasService", "$q", "$state", "vacunasService", "$mdDialog", "placasService", "paisesValue", "$scope",function (placasService, mascotasService, $stateParams, placaValida, apiConstant, $filter, razasService, $q, $state, vacunasService, $mdDialog, placasService, paisesValue, $scope) {

    var cdx = this;

    
    if ($scope.$parent.seleccionado != 1) {

        $scope.$parent.seleccionado = 1;

        $scope.$parent.iconoUsuarios = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 1, $scope.$parent.iconosUsuarios);
        $scope.$parent.iconoGenerar = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 2, $scope.$parent.iconosGenerar);
        $scope.$parent.iconoPlacas = $scope.$parent.cambiarIcono($scope.$parent.seleccionado, 2, $scope.$parent.iconosPlacas);
    }

    
    cdx.datos = placaValida;

    cdx.apiDir = apiConstant;

    cdx.paises = paisesValue;

    cdx.cargar = function ($file) {

        if ($file) {

            mascotasService.foto($file, "." + $file.type.split("/")[1]).then(function (res) {

                mascotasService.nuevaFoto(placaValida.basico.idMascota, res).then(function (resNuevaFoto) {

                    cdx.datos.basico.foto = res;

                })



            })
        }
        
        
        
       /* if ($scope.cargarFotoForm.foto.$error && $scope.cargarFotoForm.foto.$pristine){
            
          
            cdx.mostrarErrorFoto()
            
            //$scope.cargarFotoForm.foto.$error = null;
            
            
        }
        
        $scope.cargarFotoForm.foto.$setPristine();*/
        

    }

    cdx.razas = [];

    cdx.vacunas = [];

    mascotasService.datosMedicos(placaValida.basico.idMascota).then(function (res) {

        cdx.datos.medicos = res[0];

    });

    mascotasService.vacunas(placaValida.basico.idMascota).then(function (res) {

        cdx.datos.vacunas = res;

    });

    razasService.listaEspecie(cdx.datos.basico.idEspecie).then(function (res) {

        cdx.razas = res;


    })

    vacunasService.lista().then(function (res) {

        cdx.vacunas = res;

    })


    cdx.espejo = {
        basico: {},
        medico: {},
        vacunas: [],
        duenos: []
    }


    cdx.editar = {

        basico: {
            comenzar: function (basicoOriginal) {

                var fecha_nacimiento = new Date(basicoOriginal.fecha_nacimiento.split("/")[2], basicoOriginal.fecha_nacimiento.split("/")[1] - 1, basicoOriginal.fecha_nacimiento.split("/")[0]);

                cdx.espejo.basico = {

                    anios: basicoOriginal.anios,
                    chip: basicoOriginal.chip,
                    codigo: basicoOriginal.codigo,
                    comentarios: basicoOriginal.comentarios,
                    edad: basicoOriginal.edad,
                    encontrado: basicoOriginal.encontrado,
                    especie: basicoOriginal.especie,
                    fecha_nacimiento: fecha_nacimiento,
                    genero: basicoOriginal.genero,
                    idEspecie: basicoOriginal.idEspecie,
                    idMascota: basicoOriginal.idMascota,
                    idRaza: basicoOriginal.idRaza,
                    meses: basicoOriginal.meses,
                    nombre: basicoOriginal.nombre,
                    perdida: basicoOriginal.perdida,
                    peso: basicoOriginal.peso,
                    raza: basicoOriginal.raza

                }



                cdx.editar.basico.pasos = true;

            },
            cancelar: function () {

                cdx.espejo.basico = null;
                cdx.editar.basico.pasos = false;

            },
            guardar: function (valido, basicoEspejo) {

                if (valido) {

                    basicoEspejo.fecha_nacimiento = $filter('date')(basicoEspejo.fecha_nacimiento, "dd/MM/yyyy");

                    mascotasService.datosModificar(basicoEspejo).then(function (res) {

                        basicoEspejo.foto = cdx.datos.basico.foto;
                        cdx.datos.basico = basicoEspejo;
                        cdx.editar.basico.pasos = false;

                    }).catch(function (res) {

                        cdx.espejo.basico = null;
                        cdx.editar.basico.pasos = false;

                    })

                }

            },
            pasos: false
        },
        medico: {
            comenzar: function (medicoOriginal) {

                if (medicoOriginal) {


                    var fecha_i = new Date(medicoOriginal.desparasitacion_i.split("/")[2], medicoOriginal.desparasitacion_i.split("/")[1] - 1, medicoOriginal.desparasitacion_i.split("/")[0]);

                    var fecha_e = new Date(medicoOriginal.desparasitacion_e.split("/")[2], medicoOriginal.desparasitacion_e.split("/")[1] - 1, medicoOriginal.desparasitacion_e.split("/")[0]);



                    //llenar
                    cdx.espejo.medico = {

                        idInformacion: medicoOriginal.idInformacion,
                        idMascota: cdx.datos.basico.idMascota,
                        desparasitacion_i: fecha_i,
                        desparasitacion_e: fecha_e,
                        centro: medicoOriginal.centro,
                        veterinario: medicoOriginal.veterinario,
                        direccion_veterinario: medicoOriginal.direccion_veterinario,
                        telefono_veterinario: medicoOriginal.telefono_veterinario

                    }



                } else {

                    cdx.espejo.medico = {

                        idInformacion: null,
                        idMascota: cdx.datos.basico.idMascota,
                        desparasitacion_i: null,
                        desparasitacion_e: null,
                        centro: null,
                        veterinario: null,
                        direccion_veterinario: null,
                        telefono_veterinario: null
                    }

                }

                cdx.editar.medico.pasos = true;
            },
            cancelar: function () {

                cdx.espejo.medico = null;
                cdx.editar.medico.pasos = false;
            },
            guardar: function (valido, medicoEspejo) {

                if (valido) {

                    medicoEspejo.desparasitacion_i = $filter('date')(medicoEspejo.desparasitacion_i, "dd/MM/yyyy");
                    medicoEspejo.desparasitacion_e = $filter('date')(medicoEspejo.desparasitacion_e, "dd/MM/yyyy");

                    mascotasService.datosMedicosEditar(medicoEspejo)

                    .then(function (res) {

                        cdx.datos.medicos = medicoEspejo;

                        if (res) {

                            cdx.datos.medicos.idInformacion = res;

                        }

                        cdx.editar.medico.pasos = false;

                    }).catch(function (res) {
                        cdx.espejo.medico = null;
                        cdx.editar.medico.pasos = false;

                    })

                }

            },
            pasos: false
        },
        vacunas: {
            comenzar: function (vacunasOriginal) {


                angular.forEach(vacunasOriginal, function (valor, llave) {

                    var fecha = new Date(vacunasOriginal[llave].fecha.split("/")[2], vacunasOriginal[llave].fecha.split("/")[1] - 1, vacunasOriginal[llave].fecha.split("/")[0]);

                    var recordatorio = null;

                    if (vacunasOriginal[llave].fecha_recordatorio) {

                        recordatorio = new Date(vacunasOriginal[llave].fecha_recordatorio.split("/")[2], vacunasOriginal[llave].fecha_recordatorio.split("/")[1] - 1, vacunasOriginal[llave].fecha_recordatorio.split("/")[0]);

                    }

                    var activo = vacunasOriginal[llave].recordatorio_activo == "1" ? true : false;

                    cdx.espejo.vacunas[llave] = {
                        fecha: vacunasOriginal[llave].fecha,
                        recordatorio: recordatorio,
                        activo: activo,
                        vacunas_idVacuna: vacunasOriginal[llave].idVacuna,
                        idMascota: vacunasOriginal[llave].idMascota,
                        idVamas: vacunasOriginal[llave].idVamas
                    };

                })


                cdx.editar.vacunas.pasos = true;
            },
            cancelar: function () {

                cdx.espejo.vacunas = [];
                cdx.editar.vacunas.eliminar = null;
                cdx.editar.vacunas.pasos = false;

            },
            guardar: function (valido, vacunasEspejo) {

                if (valido) {

                    var promesas = [];

                    angular.forEach(vacunasEspejo, function (valor, llave) {

                        valor.idMascota = cdx.datos.basico.idMascota;

                        valor.recordatorio = $filter('date')(valor.recordatorio, "dd/MM/yyyy");
                        valor.fecha = $filter('date')(valor.fecha, "dd/MM/yyyy");


                        valor.activo = valor.activo ? "1" : "0";

                        promesas.push(mascotasService.registrarVacuna(valor));

                    })

                    angular.forEach(cdx.editar.vacunas.eliminar, function (valor, llave) {


                        promesas.push(mascotasService.eliminarVacuna(valor));

                    })

                    $q.all(promesas).then(function (res) {

                        mascotasService.vacunas(cdx.datos.basico.idMascota).then(function (res) {

                            cdx.datos.vacunas = res;
                            cdx.espejo.vacunas = [];
                            cdx.editar.vacunas.eliminar = [];
                            cdx.editar.vacunas.pasos = false;

                        })

                    })

                    .catch(function () {

                        $state.reload();

                    })

                }
            },
            desaparecer: function (indice) {


                if (cdx.espejo.vacunas[indice].idVamas) {

                    cdx.editar.vacunas.eliminar.push(cdx.espejo.vacunas[indice].idVamas);

                }

                cdx.espejo.vacunas.splice(indice, 1);

            },
            eliminar: [],
            pasos: false

        },
        duenos: {
            comenzar: function (duenosOriginal) {

                angular.forEach(duenosOriginal, function (valor, llave) {

                    var nacimiento = null;

                    if (duenosOriginal[llave].nacimiento) {

                        nacimiento = new Date(duenosOriginal[llave].nacimiento.split("/")[2], duenosOriginal[llave].nacimiento.split("/")[1] - 1, duenosOriginal[llave].nacimiento.split("/")[0]);

                    }
                    cdx.espejo.duenos[llave] = {

                        apellido: duenosOriginal[llave].apellido,
                        ciudad: duenosOriginal[llave].ciudad,
                        codigo_postal: duenosOriginal[llave].codigo_postal,
                        direccion: duenosOriginal[llave].direccion,
                        email: duenosOriginal[llave].email,
                        idDueno: duenosOriginal[llave].idDueno,
                        nacimiento: nacimiento,
                        nombre: duenosOriginal[llave].nombre,
                        pais: duenosOriginal[llave].pais,
                        provincia: duenosOriginal[llave].provincia,
                        sexo: duenosOriginal[llave].sexo,
                        telefono: duenosOriginal[llave].telefono,

                    };

                })

                cdx.editar.duenos.pasos = true;


            },
            cancelar: function () {
                var duenoPrincipal = cdx.espejo.duenos[0];
                cdx.espejo.duenos = [duenoPrincipal];
                cdx.editar.duenos.eliminar = null;
                cdx.editar.duenos.pasos = false;

            },
            guardar: function (valido, duenosEspejo) {

                if (valido) {

                    var promesas = [];

                    angular.forEach(duenosEspejo, function (valor, llave) {

                        if (!valor.idDueno) {

                            valor.idMascota = cdx.datos.basico.idMascota;

                        }

                        valor.nacimiento = $filter('date')(valor.nacimiento, "dd/MM/yyyy");

                        promesas.push(mascotasService.modificarDueno(valor));

                    })

                    angular.forEach(cdx.editar.duenos.eliminar, function (valor, llave) {

                        promesas.push(mascotasService.eliminarDueno(valor));

                    })

                    $q.all(promesas).then(function (res) {

                        mascotasService.duenosMascota(cdx.datos.basico.idMascota).then(function (res) {
                            console.log(res)
                            cdx.datos.duenos = res;
                            var duenoPrincipal = cdx.espejo.duenos[0];
                            cdx.espejo.duenos = [duenoPrincipal];
                            cdx.editar.duenos.eliminar = [];
                            cdx.editar.duenos.pasos = false;

                        })

                    })

                    .catch(function () {

                        $state.reload();

                    })

                }

            },
            desparecer: function (indice) {

                if (cdx.espejo.duenos[indice + 1].idDueno) {

                    cdx.editar.duenos.eliminar.push(cdx.espejo.duenos[indice + 1].idDueno);

                }

                cdx.espejo.duenos.splice(indice + 1, 1);

            },
            eliminar: [],
            pasos: false
        }
    };





    //datos para los datepickers
    cdx.hoy = new Date();

    cdx.datosDatepicker = {

        meses: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        mesesCorto: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
        diasSemana: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        diasSemanaCorto: ['D', 'L', 'M', 'X', 'J', 'V', 'S'],
        hoy: 'Hoy',
        limpiar: 'Limpiar',
        cerrar: 'Cerrar',
        min: (new Date(cdx.hoy.getTime() - (1000 * 60 * 60 * 24 * 15))).toISOString(),
        max: (new Date(cdx.hoy.getTime() + (1000 * 60 * 60 * 24))).toISOString()

    }




    cdx.mostrarModal = function ($event, placa) {

        //console.log(placa)

        var promesa = $mdDialog.show({
            parent: angular.element(document.body),
            targetEvent: $event,
            templateUrl: "cdx.borrarPlaca.html",
            locals: {
                placa: placa
            },
            controller: function ($scope, $mdDialog, placasService, placa) {

                $scope.placa = placa;

                $scope.borrarPlaca = function (palabra, idPlaca) {

                    if ($filter('uppercase')(palabra) == 'ELIMINAR') {


                        placasService.desactivarPlaca(placa.idPlaca)
                            .then(function (res) {
                                $mdDialog.hide();
                            })



                    }

                }
            },
            clickOutsideToClose: true,
            escapeToClose: true
        });

        promesa

            .then(function (res) {





            placasService.placasAsignadas(cdx.datos.basico.idMascota).then(function (res) {

                $mdDialog.hide();
                cdx.datos.placas = res

            })



        })

    }
    
    
    cdx.mostrarErrorFoto = function($event){
        
        $mdDialog.show({
            parent: angular.element(document.body),
            targetEvent: $event,
            templateUrl: "cdx.errorFotoCargar.html",
            controller: function () {

            },
            clickOutsideToClose: true,
            escapeToClose: true
        });
        
    }

    
    
     cdx.uppercase = function(palabra){
        
        return $filter('uppercase')(palabra) == 'ELIMINAR';
        
    }
    
    cdx.eliminarCancelar = function(){
        
        cdx.eliminar = null;
        cdx.eliminarPasos = 1;
    }

    cdx.eliminarConfirmar = function(confirmado, idMascota){
        
        if(confirmado){
            
            mascotasService.darBaja(idMascota).then(function(res){
                
                cdx.eliminarCompleto = true;
                
            }).catch(function(res){
                
                console.log("fallo");
                
            })
            
        }
        
        
    }





}])
