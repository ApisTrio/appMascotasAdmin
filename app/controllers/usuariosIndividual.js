angular.module("mascotas")

.controller("usuariosIndividualController", ["$scope", "adminService", "usuariosService", "idValido", "paisesValue", "$filter", "mascotasService", "apiConstant", function ($scope, adminService, usuariosService, idValido, paisesValue, $filter, mascotasService, apiConstant) {
    
    var cdx = this;
    
    cdx.datos = idValido;
    
    cdx.apiDir = apiConstant;
    
    cdx.mascotas = [];
    
    mascotasService.mascotasDueno(cdx.datos.dueno.idDueno).then(function(res){
        
        cdx.mascotas = res;
        
        
    })
    
    cdx.paises = paisesValue;

    cdx.editarComenzar = function (datosOriginales) {

        if (datosOriginales.dueno.nacimiento) {
            var nacimiento = new Date(datosOriginales.dueno.nacimiento.split("/")[2], datosOriginales.dueno.nacimiento.split("/")[1] - 1, datosOriginales.dueno.nacimiento.split("/")[0]);
        }
        
        else{
            
            var nacimiento = null;
            
        }

        cdx.datosEspejo = {

            actualizado: datosOriginales.dueno.actualizado,
            apellido: datosOriginales.dueno.apellido,
            borrado: datosOriginales.dueno.borrado,
            ciudad: datosOriginales.dueno.ciudad,
            codigo_postal: datosOriginales.dueno.codigo_postal,
            creado: datosOriginales.dueno.creado,
            direccion: datosOriginales.dueno.direccion,
            email: datosOriginales.dueno.email,
            idDueno: datosOriginales.dueno.idDueno,
            nacimiento: nacimiento,
            nombre: datosOriginales.dueno.nombre,
            pais: datosOriginales.dueno.pais,
            provincia: datosOriginales.dueno.provincia,
            sexo: datosOriginales.dueno.sexo,
            telefono: datosOriginales.dueno.telefono

        };

        cdx.pasos = 2;
    }

    cdx.editarGuardar = function (valido, datosEspejo) {

        if (valido) {
            datosEspejo.nacimiento = $filter('date')(datosEspejo.nacimiento, "dd/MM/yyyy");

            mascotasService.modificarDueno(datosEspejo)

            .then(function (res) {


                cdx.datos.dueno = datosEspejo;
                usuariosService.actualizarSesion(cdx.datos);
                cdx.pasos = 1;

            }).catch(function (res) {


                cdx.datosEspejo = null;
                cdx.pasos = 1;
            })
        }

    }

    cdx.editarCancelar = function () {

        cdx.datosEspejo = null;
        cdx.pasos = 1;
    }

    cdx.cambiarPassCancelar = function(){
        
        cdx.pass = null;
        cdx.passVerificar = null;
        cdx.pasosPass = 1;
        
    }
    
    cdx.cambiarPass = function(contrasena, idUsuario, valido){
        
        if(valido){
            
            adminService.cambiarContrasena(contrasena, idUsuario).then(function(res){

                cdx.pass = null;
                cdx.passVerificar = null;
                cdx.pasosPass = 1;

            })
        }
    }
    

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
    
    
    cdx.uppercase = function(palabra){
        
        return $filter('uppercase')(palabra) == 'ELIMINAR';
        
    }
    
    cdx.eliminarCancelar = function(){
        
        cdx.eliminar = null;
        cdx.eliminarPasos = 1;
    }

    cdx.eliminarConfirmar = function(confirmado, idUsuario){
        
        if(confirmado){
            
            
            adminService.borrarUsuario(idUsuario).then(function(res){
                
                cdx.eliminarCompleto = true;
                
            }).catch(function(res){
                
                console.log("fallo");
                
            })
            
        }
        
        
    }
    
}])
