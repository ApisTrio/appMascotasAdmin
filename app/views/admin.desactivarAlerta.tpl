<section class="padding-top-30" ng-show="adminDesactivarAlerta.opciones != 2">

    <div class="row">
        <div class="col s10 offset-s1 center-align">
            <img src="assets/images/icons/alerta.png">
        </div>
    </div>

    <div class="row">
        <div class="col s10 offset-s1 center-align">
            <h4 class="titulo2 negrita interlineado20 c2">Desactivar alerta</h4>
        </div>
    </div>

</section>
<section ng-form="alertaForm" ng-switch="adminDesactivarAlerta.opciones" ng-init="adminDesactivarAlerta.opciones = 1" ng-class="{'padding-top-30': adminDesactivarAlerta.opciones == 2}">
    <!-- MASCOTA -->
    <div ng-switch-when="1" class="row" ng-form="formPaso1">

        <div class="col s11 offset-s1 m6 offset-m3">
            <div class="campo-formulario">Mascota *</div>
            <div class="input-formulario">
                {{adminDesactivarAlerta.nombre}}
            </div>
        </div>
    </div>

    <!-- EMAIL -->
    <div ng-switch-when="2">
        <div class="row">
            <div class="col s10 offset-s1 center-align">
                <img src="assets/images/forms/Confirm.png">
            </div>
        </div>

        <div class="row">
            <div class="col s10 offset-s1 center-align">
                <h4 class="titulo2 negrita interlineado20 c2">Has desactivado la alerta de mascota perdida</h4>
            </div>
        </div>
        
        <div class="col s6 offset-s3 col m4 offset-m4 col l3 offset-l5 botones-formulario">
                <div class="row">
                    <div class="col s12 m12 l6" style="margin-bottom: 10px">
                        <button class="boton-verde" ui-sref="admin.mascota({idPlaca: adminDesactivarAlerta.codigo})">VOLVER</button>
                    </div>
                </div>
            </div>

       
    </div>



    <div class="row" ng-if="adminDesactivarAlerta.opciones !=2">
        <div class="col s6 offset-s3 col m4 offset-m4 col l4 offset-l4 botones-formulario">
            <div class="row">
                <div class="col s12 m12 l6" style="margin-bottom: 10px">
                    <button class="boton-neutro" ui-sref="admin.mascota({idPlaca: adminDesactivarAlerta.codigo})">Cancelar</button> 
                </div>
                <div class="col s12 m12 l6">
                    <button class="boton-verde" ng-click="adminDesactivarAlerta.avanzar(alertaForm.$valid, adminDesactivarAlerta.datos.idMascota)" ng-class="{'bloqueado' : !alertaForm.$valid }" >DESACTIVAR</button>
                </div>
            </div>
        </div>

    </div>

</section>
