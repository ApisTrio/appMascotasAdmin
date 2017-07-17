<section class="admin-usuarios" ng-switch="desvincularPlaca.pasos" ng-init="desvincularPlaca.pasos = 1">
    <div class="row">

            <div class="col s12 m10 offset-m1 titulo-admin">
                <p>Desvincular Placa</p>
            </div>

        </div>
    <div ng-switch-default>
        <div class="row" ng-form="placaDesvincularForm">
            <div class="col s11 offset-s1 m7 offset-m1">
                <div class="campo-formulario">Introduce el número de placa</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': placaDesvincularForm.numeroPlaca.$pristine || placaDesvincularForm.numeroPlaca.$valid}">
                        <input ng-model="desvincularPlaca.codigo" ng-change="desvincularPlaca.buscarDatos(desvincularPlaca.codigo, placaDesvincularForm.numeroPlaca.$valid)" ng-class="{'valido': placaDesvincularForm.numeroPlaca.$valid, 'erroneo': (!placaDesvincularForm.numeroPlaca.$valid && placaDesvincularForm.numeroPlaca.$dirty)}" placeholder="Introduce el número de tu placa" type="text" name="numeroPlaca" cdx-validacion data-validacion="placa" data-deseado="true" cdx-validacion-dispo data-dispo-inverso="1" required>
                        <cdx-validez data-validez="placaDesvincularForm.numeroPlaca.$valid" data-mostrar="placaDesvincularForm.numeroPlaca.$dirty"></cdx-validez>
                    </div>
                    <div ng-messages="placaDesvincularForm.numeroPlaca.$error" ng-show="placaDesvincularForm.numeroPlaca.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                        <div ng-message="disponible">La placa no está asignada a ninguna mascota.</div>
                        <div ng-message="placa">La placa no es válida.</div>
                    </div>
                    <div ng-messages="placaDesvincularForm.numeroPlaca.$pending" ng-show="placaDesvincularForm.numeroPlaca.$dirty">
                        <div ng-message="placa">Verificando el estado de la placa...</div>
                        <div ng-message="disponible">Verificando la válidez de la placa...</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row" ng-if="desvincularPlaca.datos">

            <div class="col s11 offset-s1 m2  offset-m1">
                <div class="campo-formulario">Mascota</div>
                <div class="input-formulario">{{desvincularPlaca.datos.basico.nombre}}</div>

            </div>


            <div class="col s11 offset-s1 m2">
                <div class="campo-formulario">Placas (Cantidad)</div>
                <div class="input-formulario">{{desvincularPlaca.datos.placas.length}}</div>

            </div>

            <div class="col s11 offset-s1 m2">
                <div class="campo-formulario">Dueño</div>
                <div class="input-formulario">{{desvincularPlaca.datos.duenos[0].nombre}} {{desvincularPlaca.datos.duenos[0].apellido}}</div>
            </div>
        </div>

        <div class="row" ng-if="desvincularPlaca.datos.placas.length < 2">
            <div class="col s11 offset-s1 m7 offset-m1">
                La mascota debe poseer mas de 1 placa para realizar la desvinculación.
            </div>
        </div>


        <div class="row" ng-if="desvincularPlaca.datos.placas.length > 1">


            <div class="col s12 m10 offset-m1">
                <button class="boton-verde landing" ng-click="desvincularPlaca.desvincular(desvincularPlaca.idPlaca)">DESVINCULAR</button>
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
                <h4 class="titulo2 negrita interlineado20 c2">¡La placa ha sido liberada con exito!</h4>
            </div>
        </div>
    
    </div>

</section>
