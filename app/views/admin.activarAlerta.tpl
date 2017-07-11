<section class="padding-top-30" ng-show="adminActivarAlerta.opciones != 4">

    <div class="row">
        <div class="col s10 offset-s1 center-align">
            <img src="assets/images/icons/alerta.png">
        </div>
    </div>

    <div class="row">
        <div class="col s10 offset-s1 center-align">
            <h4 class="titulo2 negrita interlineado20 c2">Activar alerta</h4>
        </div>
    </div>

</section>
<section ng-form="alertaForm" ng-switch="adminActivarAlerta.opciones" ng-init="adminActivarAlerta.opciones = 1" ng-class="{'padding-top-30': adminActivarAlerta.opciones == 4}">
    <!-- MASCOTA -->
    <div ng-switch-when="1" class="row" ng-form="formPaso1">

        <div class="col s11 offset-s1 m6 offset-m3">
            <div class="campo-formulario">Mascota</div>
            <div class="input-formulario">
                {{adminActivarAlerta.nombre}}
            </div>
        </div>
    </div>

    <!-- UBICACION -->
    <div ng-switch-when="2" class="row" ng-form="formPaso2">

        <div class="col s12 m6 offset-m3">
            <div class="campo-formulario">Ubicación</div>
            <div class="input-formulario">
                <div ng-if="adminActivarAlerta.mostrarMapa">
                    <ng-map id="mapa" center="{{adminActivarAlerta.centro}}" zoom="18" class="mapa" trigger-resize="true" map-initialized="adminActivarAlerta.mapaCargado()"> </ng-map>
                </div>
                <div ng-if="!adminActivarAlerta.mostrarMapa">Para utilizar la función de GeoLocación, debes permitir al navegador conocer tu ubicación</div>
            </div>
        </div>

    </div>

    <!-- MENSAJE -->
    <div ng-switch-when="3" class="row" ng-form="formPaso3">
        <div class="col s10 offset-s1 m6 offset-m3">
            <div class="margin-bottom-30">
                <div class="campo-formulario">Escribe un mensaje</div>
                <div class="input-formulario">
                    <textarea ng-model="adminActivarAlerta.datos.mensaje" placeholder="Escribe un mensaje" rows="3" name="mensaje" style="width: 100%;"></textarea>
                </div>
            </div>
        </div>
    </div>


    <!-- EMAIL -->
    <div ng-switch-when="4">
        <div class="row">
            <div class="col s10 offset-s1 center-align">
                <img src="assets/images/forms/Confirm.png">
            </div>
        </div>

        <div class="row">
            <div class="col s10 offset-s1 center-align">
                <h4 class="titulo2 negrita interlineado20 c2">Has activado la alerta de mascota perdida</h4>
            </div>
        </div>

        <div class="col s6 offset-s3 col m4 offset-m4 col l3 offset-l5 botones-formulario">
            <div class="row">
                <div class="col s12 m12 l6" style="margin-bottom: 10px">
                    <button class="boton-verde" ui-sref="admin.mascota({idPlaca: adminActivarAlerta.codigo})">VOLVER</button>
                </div>
            </div>
        </div>
    </div>



    <div class="row" ng-if="adminActivarAlerta.opciones !=4">
        <div class="col s6 offset-s3 col m4 offset-m4 col l4 offset-l4 botones-formulario">
            <div class="row">
                <div class="col s12 m12 l6" style="margin-bottom: 10px">
                    <button class="boton-neutro" ui-sref="admin.mascota({idPlaca: adminActivarAlerta.codigo})">Cancelar</button>
                </div>
                <div class="col s12 m12 l6">
                    <button class="boton-verde" ng-click="adminActivarAlerta.avanzar(alertaForm.$valid, adminActivarAlerta.datos)" ng-if="adminActivarAlerta.opciones < 3" ng-class="{'bloqueado' : !alertaForm.$valid }">SIGUIENTE</button>
                </div>
                <div class="col s12 m12 l6">
                    <button class="boton-verde" ng-click="adminActivarAlerta.avanzar(alertaForm.$valid, adminActivarAlerta.datos)" ng-if="adminActivarAlerta.opciones == 3">ACTIVAR</button>
                </div>
            </div>



        </div>

    </div>

</section>
