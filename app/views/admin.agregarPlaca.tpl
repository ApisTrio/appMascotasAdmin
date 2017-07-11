<section class="padding-top-30">
    <div class="row">
        <div class="col s10 offset-s1">
            <h4 class="titulo2 negrita interlineado20 c2 center-align">Nueva Placa</h4>
        </div>
    </div>
</section>
<section ng-form="nuevaPlacaForm" ng-switch="adminAgregarPlaca.pasos" ng-init="adminAgregarPlaca.pasos = 1" class="padding-top-30">

    <div ng-switch-when="1">
        <div class="row">
            <div class="col s10 offset-s1 m10 offset-m1 negrita white-space-normal">
                Agrega una nueva placa. Si no tienes una placa puedes comprarla en nuestra <a target="_blank" href="https://www.dinbeat.com/tienda/">tienda</a>.
            </div>
        </div>
        <div class="row">
            <div class="col s11 offset-s1 m7 offset-m1">
                <div class="campo-formulario">Introduce el número de tu placa *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': nuevaPlacaForm.numeroPlaca.$pristine || nuevaPlacaForm.numeroPlaca.$valid}">
                        <input ng-model="adminAgregarPlaca.placa.codigo" ng-class="{'valido': nuevaPlacaForm.numeroPlaca.$valid, 'erroneo': (!nuevaPlacaForm.numeroPlaca.$valid && nuevaPlacaForm.numeroPlaca.$dirty)}" placeholder="Introduce el número de tu placa" type="text" name="numeroPlaca" cdx-validacion data-validacion="placa" data-deseado="false" cdx-validacion-dispo required>
                        <cdx-validez data-validez="nuevaPlacaForm.numeroPlaca.$valid" data-mostrar="nuevaPlacaForm.numeroPlaca.$dirty"></cdx-validez>
                    </div>
                    <div ng-messages="nuevaPlacaForm.numeroPlaca.$error" ng-show="nuevaPlacaForm.numeroPlaca.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                        <div ng-message="placa">La placa no está disponible.</div>
                        <div ng-message="disponible">La placa no es válida.</div>
                    </div>
                    <div ng-messages="nuevaPlacaForm.numeroPlaca.$pending" ng-show="nuevaPlacaForm.numeroPlaca.$dirty">

                        <div ng-message="placa">Verificando la disponibilidad de la placa...</div>
                        <div ng-message="disponible">Verificando la válidez de la placa...</div>
                    </div>
                </div>
            </div>
        </div>

       <div class="row">
            <div class="col s19 offset-s1 m4 offset-m1 l2 offset-l1">
                <div class="campo-formulario">Selecciona un modelo *</div>
            </div>
            <div class="col s2  m2">

                <cdx-formas data-seleccionado="adminAgregarPlaca.seleccionado"></cdx-formas>

            </div>
        </div>

        <div class="row">
            <div class="col s10 offset-s1 m10 offset-m1 center-align">
                <cdx-modelos ng-model="adminAgregarPlaca.placa.modelos_idModelo" data-seleccionado="{{adminAgregarPlaca.seleccionado}}"  required></cdx-modelos>
            </div>
        </div>
      
        <!--<div class="col s11 offset-s1 m7 offset-m1">
            <div class="campo-formulario">Mascota *</div>
            <div class="input-formulario">
                <div ng-class="{'margin-bottom-30': nuevaPlacaForm.mascota.$pristine || nuevaPlacaForm.mascota.$valid}">
                    <md-select ng-model="adminAgregarPlaca.placa.mascotas_idMascota" placeholder="Selecciona una mascota" name="mascota" class="md-no-underline" ng-class="{'valido': nuevaPlacaForm.mascota.$valid, 'erroneo': (!nuevaPlacaForm.mascota.$valid && nuevaPlacaForm.mascota.$dirty)}" required>
                        <md-option ng-value="{{mascota.idMascota}}" ng-repeat="mascota in adminAgregarPlaca.mascotas track by $index">{{mascota.nombre}}</md-option>
                    </md-select>
                    <cdx-validez data-validez="nuevaPlacaForm.mascota.$valid" data-mostrar="nuevaPlacaForm.mascota.$dirty"></cdx-validez>
                </div>

                <div ng-messages="nuevaPlacaForm.mascota.$error" ng-show="nuevaPlacaForm.mascota.$dirty">
                    <div ng-message="required">Este campo es requerido.</div>
                </div>
            </div>
        </div>-->

        <div class="row">
            <div class="col s10 offset-s1">
                <div class="divider"></div>
            </div>
        </div>

        <div class="row">
            <div class="col s11 offset-s1 m10 offset-m1">
                * Dato requerido
            </div>
        </div>
    </div>
    <div ng-switch-when="2">

        <div class="row">
            <div class="col s10 offset-s1 center-align">
                <img src="assets/images/forms/Confirm2x.png">
            </div>
        </div>

        <div class="row">
            <div class="col s10 offset-s1 center-align">
                <h4 class="titulo2 negrita interlineado20 c2">Haz activado tu nueva placa</h4>
            </div>
        </div>

        <div class="row">
            <div class="col s10 offset-s1 m8 offset-m2 center-align white-space-normal">
                ¡Felicidades! Has agregado una nueva placa DinbeatQR. Recibirás un e-mail de confirmación. Puedes ver todos nuestros modelos en nuestra sección de tienda.
            </div>
        </div>
    </div>
</section>

<section ng-if="adminAgregarPlaca.pasos != 2">
    <div class="row">
        <div class="col s6 offset-s3 col m4 offset-m4 col l4 offset-l4 botones-formulario">
            <div class="row">
                <div class="col s11 offset-s1 m12 l6" style="margin-bottom: 10px;">
                    <button class="boton-neutro" ui-sref="admin.mascota({idPlaca: adminAgregarPlaca.codigo})">Cancelar</button>    
                </div>
                <div class="col s11 offset-s1 m12 l6" style="margin-bottom: 10px;">
                    <button class="boton-verde" ng-click="adminAgregarPlaca.avanzar(nuevaPlacaForm.$valid, adminAgregarPlaca.placa)" ng-class="{'bloqueado' : !nuevaPlacaForm.$valid }">GUARDAR</button>
                </div>
            </div>
            
        </div>
    </div>

</section>