<section class="padding-top-30">
    <div class="row" ng-show="nuevaMascota.pasos < 3">
        <div class="col s10 offset-s1">
            <h4 class="titulo2 negrita interlineado20 c2 center-align">Nueva Mascota</h4>
        </div>
    </div>
</section>
<section ng-form="nuevaMascotaForm" ng-init="nuevaMascota.pasos = 1" ng-switch="nuevaMascota.pasos">
    <div ng-form="formPaso1" ng-switch-when="1">
        <div class="row">
            <div class="col s11 offset-s1 m10 offset-m1 negrita white-space-normal">
                Introduce los datos de tu mascota.
            </div>
        </div>
        <div class="row">
            <div class="col s11 offset-s1 m4 offset-m1">
                <div class="campo-formulario">Nombre de tu mascota *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': formPaso1.nombreMascota.$pristine || formPaso1.nombreMascota.$valid}">
                        <input ng-model="nuevaMascota.datos.nombre" ng-class="{'valido': formPaso1.nombreMascota.$valid, 'erroneo': (!formPaso1.nombreMascota.$valid && formPaso1.nombreMascota.$dirty)}" placeholder="Nombre de tu mascota " type="text" name="nombreMascota" minlength="3" required>
                        <cdx-validez data-validez="formPaso1.nombreMascota.$valid" data-mostrar="formPaso1.nombreMascota.$dirty"></cdx-validez>
                    </div>
                    <div ng-messages="formPaso1.nombreMascota.$error" ng-show="formPaso1.nombreMascota.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                        <div ng-message="minlength">Debe contener al menos 3 caracteres.</div>
                    </div>
                </div>
            </div>
            <div class="col s11 offset-s1 m4 offset-m2">
                <div class="margin-bottom-30">
                    <div class="campo-formulario" style="position: relative;">Foto <img style="cursor: pointer;" width="17" ng-mouseover="nuevaMascota.aviso = true" ng-mouseleave="nuevaMascota.aviso = false" src="assets/images/icons/info.png">
                        <div ng-show="nuevaMascota.aviso" ng-init="nuevaMascota.aviso = false" ng-click="registro.aviso = !registro.aviso" class="aviso-foto">Debes subir una foto de máximo 3Mb y con una medida mínima de 200px y 200px</div>
                    </div>
                    <div class="input-formulario">
                        <div ng-hide="nuevaMascota.imagen">

                            <button class="boton-verde-negativo" ngf-select ng-model="nuevaMascota.imagen" name="file" ngf-pattern="'image/*'" ngf-accept="'image/*'" ngf-max-size="5mb" ngf-min-height="200" ngf-min-width="200" ngf-resize="{width: 200, height: 200, type: 'image/jpeg',quality: 0.5, ratio: '1:1', centerCrop: true, restoreExif: false}" ngf-fix-orientation="true" name="foto">CARGAR FOTO</button>
                            <div class="o" style="display: inline-block">
                                O
                            </div>
                            <button class="boton-verde-negativo tomar-foto" ngf-select ng-model="nuevaMascota.imagen" name="file" ngf-pattern="'image/*'" ngf-accept="'image/*'" ngf-max-size="5mb" ngf-min-height="200" ngf-min-width="200" ngf-resize="{width: 200, height: 200, type: 'image/jpeg',quality: 0.5, ratio: '1:1', centerCrop: true, restoreExif: false}" ngf-fix-orientation="true" ngf-capture="'camera'" name="foto">HACER FOTO</button>


                        </div>
                        <div ng-show="nuevaMascota.imagen">

                            <button class="boton-verde previsualizar landing" ng-click="nuevaMascota.previsualizar($event, nuevaMascota.imagen)">PREVISUALIZAR</button> O <button class="boton-neutro landing" ng-click="nuevaMascota.imagen = null">Cancelar</button>
                            <!--<img ngf-src="nuevaMascota.imagen">-->
                        </div>
                        <div ng-messages="formPaso1.$error" class="white-space-normal">
                            <div ng-message="maxSize" class="white-space-normal">La imagen no puede superar los 3MB.</div>
                            <div ng-message="minHeight" class="white-space-normal">La imagen debe tener al menos 200px de ancho.</div>
                            <div ng-message="minWidth" class="white-space-normal">La imagen debe tener al menos 200px de alto.</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col s11 offset-s1 m4 offset-m1">
                <div class="campo-formulario">Género *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': formPaso1.generoMasccota.$pristine || formPaso1.generoMasccota.$valid}">
                        <md-select ng-model="nuevaMascota.datos.genero" ng-class="{'valido': formPaso1.generoMasccota.$valid, 'erroneo': (!formPaso1.generoMasccota.$valid && formPaso1.generoMasccota.$dirty)}" placeholder="Genero" class="md-no-underline" name="generoMasccota" required>
                            <md-option value="Macho">Macho</md-option>
                            <md-option value="Hembra">Hembra</md-option>
                        </md-select>
                        <cdx-validez data-validez="formPaso1.generoMasccota.$valid" data-mostrar="formPaso1.generoMasccota.$dirty"></cdx-validez>
                    </div>
                    <div ng-messages="formPaso1.generoMasccota.$error" ng-show="formPaso1.generoMasccota.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                    </div>
                </div>
            </div>
            <div class="col s11 offset-s1 m4 offset-m2">
                <div class="campo-formulario">Fecha de Nacimiento *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': formPaso1.fecha.$pristine || formPaso1.fecha.$valid}">
                        <input ng-class="{'valido': formPaso1.fecha.$valid, 'erroneo': (!formPaso1.fecha.$valid && formPaso1.fecha.$dirty)}" input-date type="text" name="fecha" id="inputCreated" ng-model="nuevaMascota.datos.fecha_nacimiento" container="" format="dd/mm/yyyy" months-full="{{nuevaMascota.datosDatepicker.meses}}" months-short="{{nuevaMascota.datosDatepicker.mesesCorto}}" weekdays-full="{{nuevaMascota.datosDatepicker.diasSemana}}" weekdays-short="" weekdays-letter="{{nuevaMascota.datosDatepicker.diasSemanaCorto}}" disable="disable" max="{{nuevaMascota.datosDatepicker.max}}" today="nuevaMascota.datosDatepicker.hoy" first-day="1" clear="nuevaMascota.datosDatepicker.limpiar" close="nuevaMascota.datosDatepicker.cerrar" select-years="80" required>
                        <cdx-validez data-validez="formPaso1.fecha.$valid" data-mostrar="formPaso1.fecha.$dirty"></cdx-validez>
                    </div>
                    <div ng-messages="formPaso1.fecha.$error" ng-show="formPaso1.fecha.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col s11 offset-s1 m4 offset-m1">
                <div class="campo-formulario">Especie *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': formPaso1.especie.$pristine || formPaso1.especie.$valid}">
                        <md-select ng-change="nuevaMascota.cargarRazas(nuevaMascota.datos.especie)" ng-model="nuevaMascota.datos.especie" ng-class="{'valido': formPaso1.especie.$valid, 'erroneo': (!formPaso1.especie.$valid && formPaso1.especie.$dirty)}" placeholder="Especie" name="especie" class="md-no-underline" required>
                            <md-option ng-repeat="especie in nuevaMascota.especies" value="{{especie.idEspecie}}">{{especie.especie}}</md-option>
                        </md-select>
                        <cdx-validez data-validez="formPaso1.especie.$valid" data-mostrar="formPaso1.especie.$dirty"></cdx-validez>
                    </div>
                    <div ng-messages="formPaso1.especie.$error" ng-show="formPaso1.especie.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                    </div>
                </div>
            </div>
            <div class="col s11 offset-s1 m4 offset-m2">
                <div class="campo-formulario">Raza *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': formPaso1.raza.$pristine || formPaso1.raza.$valid}">
                        <md-select ng-model="nuevaMascota.datos.razas_idRaza" ng-class="{'valido': formPaso1.raza.$valid, 'erroneo': (!formPaso1.raza.$valid && formPaso1.raza.$dirty)}" placeholder="Raza" name="raza" class="md-no-underline" required>
                            <md-option ng-repeat="raza in nuevaMascota.razas" value="{{raza.idRaza}}">{{raza.raza}}</md-option>
                        </md-select>
                        <cdx-validez data-validez="formPaso1.raza.$valid" data-mostrar="formPaso1.raza.$dirty"></cdx-validez>
                    </div>
                    <div ng-messages="formPaso1.raza.$error" ng-show="formPaso1.raza.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col s11 offset-s1 m4 offset-m1">
                <div class="margin-bottom-30">
                    <div class="campo-formulario">Número de chip</div>
                    <div class="input-formulario"><input ng-model="nuevaMascota.datos.chip" placeholder="Número de chip" type="text"></div>
                </div>
            </div>
            <div class="col s11 offset-s1 m4 offset-m2">
                <div class="margin-bottom-30">
                    <div class="campo-formulario">Peso</div>
                    <div class="input-formulario">
                        <md-select ng-model="nuevaMascota.datos.peso" placeholder="Peso" class="md-no-underline">
                            <md-option value="-1 Kg">-1 Kg</md-option>
                            <md-option value="2-4 Kg">2-4 Kg</md-option>
                            <md-option value="5-14 Kg">5-14 Kg</md-option>
                            <md-option value="15-24 Kg">15-24 Kg</md-option>
                            <md-option value="25-40 Kg">25-40 Kg</md-option>
                            <md-option value="+40 Kg">+40 Kg</md-option>
                        </md-select>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col s11 offset-s1 m11 offset-m1">
                <div class="margin-bottom-30">
                    <div class="campo-formulario">Comentarios</div>
                    <div class="input-formulario">
                        <textarea ng-model="nuevaMascota.datos.comentarios" placeholder="Comentarios" rows="3"></textarea>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col s11 offset-s1 m10 offset-m1">
                    * Dato requerido
                </div>
            </div>
        </div>

    </div>
    <div ng-form="formPaso2" ng-switch-when="2">

        <div class="row">
            <div class="s11 offset-s1 m10 offset-m1 negrita white-space-normal">
                Introduce los datos de tu placa. Si no tienes una placa puedes comprarla en nuestra <a target="_blank" href="https://www.dinbeat.com/tienda/">tienda</a>.
            </div>
        </div>
        <div class="row">
            <div class="col s11 offset-s1 m4 offset-m1">
                <div class="campo-formulario">Introduce el número de tu placa *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': formPaso2.numeroPlaca.$pristine || formPaso2.numeroPlaca.$valid}">
                        <input ng-model="nuevaMascota.datos.codigo" ng-class="{'valido': formPaso2.numeroPlaca.$valid, 'erroneo': (!formPaso2.numeroPlaca.$valid && formPaso2.numeroPlaca.$dirty)}" placeholder="Introduce el número de tu placa" type="text" name="numeroPlaca" cdx-validacion data-validacion="placa" data-deseado="false" cdx-validacion-dispo required>
                        <cdx-validez data-validez="formPaso2.numeroPlaca.$valid" data-mostrar="formPaso2.numeroPlaca.$dirty"></cdx-validez>
                    </div>
                    <div ng-messages="formPaso2.numeroPlaca.$error" ng-show="formPaso2.numeroPlaca.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                        <div ng-message="placa">La placa no está disponible.</div>
                        <div ng-message="disponible">La placa no es válida.</div>
                    </div>
                    <div ng-messages="formPaso2.numeroPlaca.$pending" ng-show="formPaso2.numeroPlaca.$dirty">

                        <div ng-message="placa">Verificando la disponibilidad de la placa...</div>
                        <div ng-message="disponible">Verificando la válidez de la placa...</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col s11 offset-s1 m4 offset-m1 l2 offset-l1">
                <div class="campo-formulario">Selecciona un modelo *</div>
            </div>
            <div class="col s11 offset-s1 m2" style="margin-left: 24px;">

                <cdx-formas data-seleccionado="nuevaMascota.seleccionado" class="margin-bottom-30"></cdx-formas>

            </div>
        </div>

        <div class="row">
            <div class="col s10 offset-s1 m10 offset-m1 center-align">
                <cdx-modelos ng-model="nuevaMascota.datos.modelos_idModelo" data-seleccionado="{{nuevaMascota.seleccionado}}" required class="margin-bottom-30"></cdx-modelos>
            </div>
        </div>

        <div class="row">
            <div class="col s12 m10 offset-m1">
                * Dato requerido
            </div>
        </div>
    </div>
    <div ng-switch-when="3">
        <div class="row">
            <div class="col s10 offset-s1 center-align">
                <img src="assets/images/forms/Confirm.png">
            </div>
        </div>

        <div class="row">
            <div class="col s10 offset-s1 center-align">
                <h4 class="titulo2 negrita interlineado20 c2">Has agregado una nueva mascota</h4>
            </div>
        </div>

        <div class="row">
            <div class="col s10 offset-s1 m8 offset-m2 center-align white-space-normal">
                Has creado el perfil de una nueva mascota, para editar sus datos accede a su ficha.
            </div>
        </div>
    </div>


</section>
<section>
    <div class="row">
        <div class="col s6 offset-s3 col m6 offset-m3 col l4 offset-l4 botones-formulario" ng-show="nuevaMascota.pasos < 3">
            <div class="row">
                <div class="col s12 m6 l6" style="margin-bottom: 10px;">
                    <button class="boton-neutro" ui-sref="admin.usuariosIndividual({idUsuario: nuevaMascota.idUsuario})">Cancelar</button>
                </div>
                <div class="col s12 m6 l6">
                    <button class="boton-verde" ng-click="nuevaMascota.avanzar(nuevaMascotaForm.$valid, nuevaMascota.datos)" ng-class="{'bloqueado' : !nuevaMascotaForm.$valid }">SIGUIENTE</button>
                </div>
            </div>



            <div class="col s12 m4 offset-m4 botones-formulario" ng-show="nuevaMascota.pasos == 3">
                <button class="boton-verde" ui-sref="perfil.misMascotasIndividual({idPlaca: nuevaMascota.perfilMascota})">VER PERFIL</button>
            </div>
        </div>
    </div>
</section>