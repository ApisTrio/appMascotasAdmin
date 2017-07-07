<section class="color-blanco header-mascota">
    <div class="row">
        <div class="col s12 center-align">
            <h4 class="negrita no-margin-bottom white-space-normal">{{adminMascota.datos.basico.nombre}}</h4>
        </div>
    </div>

    <div class="row">
        <div class="col s12 center-align white-space-normal"> {{adminMascota.datos.basico.raza}}, {{adminMascota.datos.basico.edad}}</div>
    </div>

    <div class="row">
        <div class="col s12 m4 offset-m4 center-align" ng-form="cargarFotoForm">
            <div class="center-align  contenedor-foto-mascota" ngf-select="adminMascota.cargar($file)" ng-model="adminMascota.imagen" ngf-pattern="'image/*'" ngf-accept="'image/*'" ngf-max-size="5MB" ngf-min-height="200" ngf-min-width="200" ngf-resize="{width: 200, height: 200, type: 'image/jpeg',quality: 0.5, ratio: '1:1', centerCrop: true, restoreExif: false}" ngf-fix-orientation="true" name="foto">
                <div class="circle foto-mascota" style="background-image:url({{adminMascota.apiDir.dominio}}{{adminMascota.apiDir.path}}{{adminMascota.apiDir.imagenes.mascotas}}{{adminMascota.datos.basico.foto}}); background-position: 100% 100%; background-size: cover;" ng-if="adminMascota.datos.basico.foto">
                </div>
                <div class="circle foto-mascota" style="background-image:url(assets/images/icons/foto_perfil.png); border: 1px solid black" ng-if="!adminMascota.datos.basico.foto">
                </div>
                <img class="editar-foto-mascota" src="assets/images/icons/editar_foto_hover.png">
                <img class="exclamacion-perdida" src="assets/images/icons/alerta_activada_mascota_perdida.png" ng-show="(adminMascota.datos.basico.perdida && !adminMascota.datos.basico.encontrado)">

            </div>
            <div ng-messages="cargarFotoForm.foto.$error" class="white-space-normal">
                <div ng-message="maxSize" class="white-space-normal">La imagen no puede superar los 3MB.</div>
                <div ng-message="minHeight" class="white-space-normal">La imagen debe tener al menos 200px de ancho.</div>
                <div ng-message="minWidth" class="white-space-normal">La imagen debe tener al menos 200px de alto.</div>
            </div>
        </div>
    </div>


    <div class="row c2">

        <div class="col s12 m12 l6 offset-l3 center-align">
            <div class="placas-mascota">
                <div class="placa-individual" ng-repeat-start="placa in adminMascota.datos.placas | limitTo:3">
                    <img ng-src="assets/images/placas/{{placa.forma}}/{{placa.modelo}}"> {{placa.codigo}}
                    <div class="eliminar-placa-boton" ng-click="adminMascota.mostrarModal(placa, placa)" ng-if="adminMascota.datos.placas.length > 1">x</div>
                </div>

                <div class="divisor-placas" ng-show="!$last" ng-repeat-end></div>
            </div>
        </div>
        <div class="col s12 m12 l3 center-align">
            <div class="agregar-placa-perfil" ui-sref="perfil.misMascotasPlaca({idMascota: adminMascota.datos.basico.idMascota})">
                <img src="assets/images/forms/agregar_placa.png"> Agregar placa
            </div>
        </div>
    </div>
    <div class="row  no-margin-bottom c2 negrita" ng-if="(adminMascota.datos.basico.perdida && !adminMascota.datos.basico.encontrado)">
        <div class="col s12 center-align">
            <div class="desactivar-alarma-perfil white-space-normal" ui-sref="perfil.desactivarAlerta({idMascota: adminMascota.datos.basico.idMascota})">
                <img src="assets/images/icons/alerta.png"> Desactivar alerta de mascota perdida
            </div>
        </div>
    </div>
</section>

<!---- INFORMACION BASICA ---->
<section class="informacion-mascota" ng-switch="adminMascota.editar.basico.pasos">

    <div class="row">
        <div class="col s10 m8 offset-m1">
            <h4 class="titulo2 negrita interlineado20 c2">Información básica</h4>
        </div>
        <div class="col s2 m2 offset-m1">
            <img class="editar-perfil" src="assets/images/icons/editar.png" ng-click="adminMascota.editar.basico.comenzar(adminMascota.datos.basico)" ng-show="!adminMascota.editar.basico.pasos">
        </div>
    </div>

    <!--NORMAL-->
    <div ng-switch-default>
        <div class="row">
            <div class="col s12 m4 offset-m1">
                <div class="titulo-info">Nombre completo</div>
                <div class="contenido-info white-space-normal">{{adminMascota.datos.basico.nombre}}</div>
                <div class="divider responsive"></div>
            </div>
            <div class="col s12 m4 offset-m2">
                <div class="titulo-info">Fecha de nacimiento</div>
                <div class="contenido-info white-space-normal">{{adminMascota.datos.basico.fecha_nacimiento}}</div>
                <div class="divider"></div>
            </div>
        </div>

        <div class="row">
            <div class="col s12 m4 offset-m1">
                <div class="titulo-info">Género</div>
                <div class="contenido-info white-space-normal">{{adminMascota.datos.basico.genero}}</div>
                <div class="divider responsive"></div>
            </div>
            <div class="col s12 m4 offset-m2">
                <div class="titulo-info">Raza</div>
                <div class="contenido-info white-space-normal">{{adminMascota.datos.basico.raza}}</div>
                <div class="divider"></div>
            </div>
        </div>

        <div class="row">
            <div class="col s12 m4 offset-m1">
                <div class="titulo-info">Número de chip</div>
                <div class="contenido-info white-space-normal" ng-if="adminMascota.datos.basico.chip">{{adminMascota.datos.basico.chip}}</div>
                <div class="contenido-info white-space-normal" ng-if="!adminMascota.datos.basico.chip">...</div>
                <div class="divider responsive"></div>
            </div>
            <div class="col s12 m4 offset-m2">
                <div class="titulo-info">Peso</div>
                <div class="contenido-info white-space-normal" ng-if="adminMascota.datos.basico.peso">{{adminMascota.datos.basico.peso}}</div>
                <div class="contenido-info white-space-normal" ng-if="!adminMascota.datos.basico.peso">...</div>
                <div class="divider"></div>
            </div>
        </div>

        <div class="row no-margin-bottom">
            <div class="col s12 m10 offset-m1">
                <div class="titulo-info">Comentarios</div>
                <div class="contenido-info white-space-normal" ng-if="adminMascota.datos.basico.comentarios">{{adminMascota.datos.basico.comentarios}}</div>
                <div class="contenido-info white-space-normal" ng-if="!adminMascota.datos.basico.comentarios">...</div>
                <div class="divider"></div>
            </div>
        </div>
    </div>

    <!--EDITAR-->
    <div ng-switch-when="true" ng-form="basicoEditarForm">
        <div class="row">
            <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l1">
                <div class="campo-formulario">Nombre de tu mascota *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': basicoEditarForm.nombreMascota.$pristine || basicoEditarForm.nombreMascota.$valid}">
                        <input ng-model="adminMascota.espejo.basico.nombre" ng-class="{'valido': basicoEditarForm.nombreMascota.$valid, 'erroneo': (!basicoEditarForm.nombreMascota.$valid && basicoEditarForm.nombreMascota.$dirty)}" placeholder="Nombre de tu mascota " type="text" name="nombreMascota" minlength="2" required>
                        <cdx-validez data-validez="basicoEditarForm.nombreMascota.$valid" data-mostrar="true"></cdx-validez>
                    </div>
                    <div ng-messages="basicoEditarForm.nombreMascota.$error" ng-show="basicoEditarForm.nombreMascota.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                        <div ng-message="minlength">Debe contener al menos 2 caracteres.</div>
                    </div>
                </div>
            </div>
            <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l2">
                <div class="campo-formulario">Fecha de Nacimiento *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': basicoEditarForm.fecha.$pristine || basicoEditarForm.fecha.$valid}">
                        <input ng-class="{'valido': basicoEditarForm.fecha.$valid, 'erroneo': (!basicoEditarForm.fecha.$valid && basicoEditarForm.fecha.$dirty)}" input-date type="text" name="fecha" id="inputCreated" ng-model="adminMascota.espejo.basico.fecha_nacimiento" container="" format="dd/mm/yyyy" months-full="{{adminMascota.datosDatepicker.meses}}" months-short="{{adminMascota.datosDatepicker.mesesCorto}}" weekdays-full="{{adminMascota.datosDatepicker.diasSemana}}" weekdays-short="" weekdays-letter="{{adminMascota.datosDatepicker.diasSemanaCorto}}" disable="disable" max="{{adminMascota.datosDatepicker.max}}" today="adminMascota.datosDatepicker.hoy" first-day="1" clear="adminMascota.datosDatepicker.limpiar" close="adminMascota.datosDatepicker.cerrar" select-years="12" required/>
                        <cdx-validez data-validez="basicoEditarForm.fecha.$valid" data-mostrar="true"></cdx-validez>
                    </div>
                    <div ng-messages="basicoEditarForm.fecha.$error" ng-show="basicoEditarForm.fecha.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l1">
                <div class="campo-formulario">Género *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': basicoEditarForm.generoMasccota.$pristine || basicoEditarForm.generoMasccota.$valid}">
                        <md-select ng-model="adminMascota.espejo.basico.genero" ng-class="{'valido': basicoEditarForm.generoMasccota.$valid, 'erroneo': (!basicoEditarForm.generoMasccota.$valid && basicoEditarForm.generoMasccota.$dirty)}" placeholder="Genero" class="md-no-underline" name="generoMasccota" required>
                            <md-option value="Macho">Macho</md-option>
                            <md-option value="Hembra">Hembra</md-option>
                        </md-select>
                        <cdx-validez data-validez="basicoEditarForm.generoMasccota.$valid" data-mostrar="true"></cdx-validez>
                    </div>
                    <div ng-messages="basicoEditarForm.generoMasccota.$error" ng-show="basicoEditarForm.generoMasccota.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                    </div>
                </div>
            </div>
            <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l2">
                <div class="campo-formulario">Raza *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': basicoEditarForm.raza.$pristine || basicoEditarForm.raza.$valid}">
                        <md-select ng-model="adminMascota.espejo.basico.idRaza" ng-class="{'valido': basicoEditarForm.raza.$valid, 'erroneo': (!basicoEditarForm.raza.$valid && basicoEditarForm.raza.$dirty)}" placeholder="Raza" name="raza" class="md-no-underline" required>
                            <md-option ng-repeat="raza in adminMascota.razas track by $index" value="{{raza.idRaza}}">{{raza.raza}}</md-option>
                        </md-select>
                        <cdx-validez data-validez="basicoEditarForm.raza.$valid" data-mostrar="true"></cdx-validez>
                    </div>
                    <div ng-messages="basicoEditarForm.raza.$error" ng-show="basicoEditarForm.raza.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                    </div>
                </div>


            </div>
        </div>
        <div class="row">
            <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l1">
                <div class="margin-bottom-30">
                    <div class="campo-formulario">Número de chip</div>
                    <div class="input-formulario">
                        <input ng-model="adminMascota.espejo.basico.chip" placeholder="Número de chip" type="text">
                    </div>
                </div>
            </div>
            <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l2">
                <div class="margin-bottom-30">
                    <div class="campo-formulario">Peso</div>
                    <div class="input-formulario">
                        <md-select ng-model="adminMascota.espejo.basico.peso" placeholder="Peso" class="md-no-underline">
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
            <div class="col s11 offset-s1 m10 offset-m1">
                <div class="margin-bottom-30">
                    <div class="campo-formulario">Comentarios</div>
                    <div class="input-formulario">
                        <textarea ng-model="adminMascota.espejo.basico.comentarios" placeholder="Comentarios" rows="3"></textarea>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col s10 offset-s1 m10 offset-m1">
                * Dato requerido
            </div>
        </div>

        <div class="row">
            <div class="col s6 offset-s3 col m4 offset-m4 col l4 offset-l4 botones-formulario">
                
                <div class="row">
                    <div class="col s12 m6 l6" style="margin-bottom: 10px;">
                        <button class="boton-neutro" ng-click="adminMascota.editar.basico.cancelar()">Cancelar</button>        
                    </div>
                    <div class="col s12 m6 l6">
                        <button class="boton-verde" ng-click="adminMascota.editar.basico.guardar(basicoEditarForm.$valid,adminMascota.espejo.basico)" ng-class="{'bloqueado' : !basicoEditarForm.$valid }">GUARDAR</button>        
                    </div>
                </div>
            
            </div>
        </div>


    </div>
</section>
<!---- INFORMACION MEDICA ---->
<section class="informacion-mascota">
    <div class="row">
        <div class="col s10 m8 offset-m1">
            <h4 class="titulo2 negrita interlineado20 c2">Información médica</h4>
        </div>
    </div>

    <div class="row">
        <div class="col s10 m8 offset-m1">
            <div class="titulo-info c2">Vacunas</div>
        </div>
        <div class="col s2 m2 offset-m1">
            <img class="editar-perfil" src="assets/images/icons/editar.png" ng-click="adminMascota.editar.vacunas.comenzar(adminMascota.datos.vacunas)" ng-show="!adminMascota.editar.vacunas.pasos">
        </div>
    </div>


    <div ng-switch="adminMascota.editar.vacunas.pasos">
        <!--VACUNAS NORMAL -->
        <div ng-switch-default>
            <div class="row" ng-repeat="vacuna in adminMascota.datos.vacunas">
                <div class="col s12 m10 offset-m1 l4 offset-l1">
                    <div class="titulo-info">Fecha de la última vacuna</div>
                    <div class="row fechas-vacunas">
                        <div class="col s6">{{vacuna.vacuna}}</div>
                        <div class="col s6">{{vacuna.fecha}}</div>
                    </div>
                    <div class="row fechas-vacunas" ng-if="!adminMascota.datos.vacunas.length">
                        <div class="col s12">...</div>
                    </div>
                    <div class="divider responsive"></div>
                </div>
                <div class="col s12 m10 offset-m1 l4 offset-l2">
                    <div class="titulo-info">Recordatorio</div>
                    <div class="row fechas-vacunas">
                        <div class="col s6">{{vacuna.vacuna}}</div>
                        <div class="col s6" ng-if="vacuna.fecha_recordatorio">{{vacuna.fecha_recordatorio}}</div>
                        <div class="col s6" ng-if="!vacuna.fecha_recordatorio">...</div>
                    </div>
                    <div class="row fechas-vacunas" ng-if="!adminMascota.datos.vacunas.length">
                        <div class="col s12">...</div>
                    </div>
                    <div class="divider"></div>
                </div>
            </div>
        </div>
        <!--VACUNAS EDITAR-->
        <div ng-switch-when="true" ng-form="vacunasPriForm">
            <div class="row" ng-repeat="vacuna in adminMascota.espejo.vacunas" ng-form="vacunasForm">
                <div class="col s11 offset-s1 m3 offset-m1">
                    <div class="margin-bottom-30">
                        <div class="campo-formulario">Fecha de la última vacuna *</div>
                        <div class="input-formulario">
                            <div ng-class="{'margin-bottom-30': vacunasForm.ciudad.$pristine || vacunasForm.ciudad.$valid}">
                                <md-select ng-model="vacuna.vacunas_idVacuna" ng-class="{'valido': vacunasForm.nombreVacuna.$valid, 'erroneo': (!vacunasForm.nombreVacuna.$valid)}" placeholder="Vacuna" class="md-no-underline" name="nombreVacuna" required>
                                    <md-option ng-value="{{vacuna.idVacuna}}" ng-repeat="vacuna in adminMascota.vacunas">{{vacuna.vacuna}}</md-option>
                                </md-select>
                                <cdx-validez data-validez="vacunasForm.nombreVacuna.$valid" data-mostrar="true"></cdx-validez>
                            </div>
                            <div ng-messages="vacunasForm.nombreVacuna.$error" ng-show="vacunasForm.nombreVacuna.$dirty">
                                <div ng-message="required">Este campo es requerido.</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col s11 offset-s1 m3">
                    <div class="margin-bottom-30">
                        <div class="campo-formulario escondido">x</div>
                        <div class="input-formulario">
                            <div ng-class="{'margin-bottom-30': vacunasForm.fecha.$pristine || vacunasForm.fecha.$valid}">
                                <input ng-class="{'valido': vacunasForm.fecha.$valid, 'erroneo': (!vacunasForm.fecha.$valid)}" input-date type="text" name="fecha" id="inputCreated" ng-model="vacuna.fecha" container="" format="dd/mm/yyyy" months-full="{{adminMascota.datosDatepicker.meses}}" months-short="{{adminMascota.datosDatepicker.mesesCorto}}" weekdays-full="{{adminMascota.datosDatepicker.diasSemana}}" weekdays-short="" weekdays-letter="{{adminMascota.datosDatepicker.diasSemanaCorto}}" disable="disable" today="adminMascota.datosDatepicker.hoy" first-day="1" clear="adminMascota.datosDatepicker.limpiar" close="adminMascota.datosDatepicker.cerrar" select-years="12" required/>
                                <cdx-validez data-validez="vacunasForm.fecha.$valid" data-mostrar="true"></cdx-validez>
                                <img class="eliminar-vacuna-boton" src="assets/images/icons/eliminar.png" ng-click="adminMascota.editar.vacunas.desaparecer($index)">
                            </div>
                            <div ng-messages="vacunasForm.fecha.$error" ng-show="vacunasForm.fecha.$dirty">
                                <div ng-message="required">Este campo es requerido.</div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col s11 offset-s1 m3">
                    <div class="margin-bottom-30">
                        <div class="campo-formulario">Recordatorio</div>
                        <div class="input-formulario">
                            <div ng-class="{'margin-bottom-30': vacunasForm.recordatorio.$pristine || vacunasForm.recordatorio.$valid}">
                                <input input-date type="text" name="recordatorio" id="inputCreated" ng-model="vacuna.recordatorio" container="" format="dd/mm/yyyy" months-full="{{adminMascota.datosDatepicker.meses}}" months-short="{{adminMascota.datosDatepicker.mesesCorto}}" weekdays-full="{{adminMascota.datosDatepicker.diasSemana}}" weekdays-short="" weekdays-letter="{{adminMascota.datosDatepicker.diasSemanaCorto}}" disable="disable" today="adminMascota.datosDatepicker.hoy" first-day="1" clear="adminMascota.datosDatepicker.limpiar" close="adminMascota.datosDatepicker.cerrar" select-years="12" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col s11 offset-s1 m2">
                    <div class="campo-formulario escondido">x</div>
                    <div class="input-formulario">
                        <switch id="activo" name="activo" ng-model="vacuna.activo"></switch>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col s12 m10 offset-m1">
                    <div class="agregar-placa-perfil">
                        <img src="assets/images/forms/agregar_placa.png" ng-click="adminMascota.espejo.vacunas.push({fecha: null, recordatorio: null, vacunas_idVacuna: null, activo: 0, idVamas: null})"> Agregar Vacuna
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col s6 offset-s3 col m4 offset-m4 col l4 offset-l4 botones-formulario">
                    <div class="row">
                        <div class="col s12 m6 l6" style="margin-bottom: 10px;">
                            <button class="boton-neutro" ng-click="adminMascota.editar.vacunas.cancelar()">Cancelar</button>
                        </div>
                        <div class="col s12 m6 l6">
                            <button class="boton-verde" ng-class="{'bloqueado' : !vacunasPriForm.$valid }" ng-click="adminMascota.editar.vacunas.guardar(vacunasPriForm.$valid, adminMascota.espejo.vacunas)">GUARDAR</button>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>

</section>
<section class="informacion-mascota">
    <div class="row">
        <div class="col s10 m8 offset-m1">
            <div class="titulo-info c2">Información médica adicional</div>
        </div>
        <div class="col s2 m2 offset-m1">
            <img class="editar-perfil" src="assets/images/icons/editar.png" ng-click="adminMascota.editar.medico.comenzar(adminMascota.datos.medicos)" ng-show="!adminMascota.editar.medico.pasos">
        </div>
    </div>
    <div ng-switch="adminMascota.editar.medico.pasos">
        <!--MEDICO NORMAL -->
        <div ng-switch-default>
            <div class="row">
                <div class="col s12 m10 offset-m1 l4 offset-l1">
                    <div class="titulo-info  white-space-normal">Fecha de la última desparasitación interna</div>
                    <div class="contenido-info white-space-normal" ng-if="adminMascota.datos.medicos.desparasitacion_i">{{adminMascota.datos.medicos.desparasitacion_i}}</div>
                    <div class="contenido-info white-space-normal" ng-if="!adminMascota.datos.medicos.desparasitacion_i">...</div>
                    <div class="divider responsive"></div>
                </div>
                <div class="col s12 m10 offset-m1 l4 offset-l2">
                    <div class="titulo-info  white-space-normal">Fecha de la última desparasitación externa</div>
                    <div class="contenido-info white-space-normal" ng-if="adminMascota.datos.medicos.desparasitacion_e">{{adminMascota.datos.medicos.desparasitacion_e}}</div>
                    <div class="contenido-info white-space-normal" ng-if="!adminMascota.datos.medicos.desparasitacion_e">...</div>
                    <div class="divider"></div>
                </div>
            </div>
            <div class="row">
                <div class="col s12 m4 offset-m1">
                    <div class="titulo-info">Centro Veterinario</div>
                    <div class="contenido-info white-space-normal" ng-if="adminMascota.datos.medicos.centro">{{adminMascota.datos.medicos.centro}}</div>
                    <div class="contenido-info white-space-normal" ng-if="!adminMascota.datos.medicos.centro">...</div>
                    <div class="divider responsive"></div>
                </div>
                <div class="col s12 m4 offset-m2">
                    <div class="titulo-info">Veterinario</div>
                    <div class="contenido-info white-space-normal" ng-if="adminMascota.datos.medicos.veterinario">{{adminMascota.datos.medicos.veterinario}}</div>
                    <div class="contenido-info white-space-normal" ng-if="!adminMascota.datos.medicos.veterinario">...</div>
                    <div class="divider"></div>
                </div>
            </div>
            <div class="row">
                <div class="col s12 m4 offset-m1">
                    <div class="titulo-info">Dirección</div>
                    <div class="contenido-info white-space-normal" ng-if="adminMascota.datos.medicos.direccion_veterinario">{{adminMascota.datos.medicos.direccion_veterinario}}</div>
                    <div class="contenido-info white-space-normal" ng-if="!adminMascota.datos.medicos.direccion_veterinario">...</div>
                </div>
                <div class="col s12 m4 offset-m2">
                    <div class="titulo-info">Teléfono</div>
                    <div class="contenido-info white-space-normal" ng-if="adminMascota.datos.medicos.telefono_veterinario"><a ng-href="tel:{{adminMascota.datos.medicos.telefono_veterinario}}">{{adminMascota.datos.medicos.telefono_veterinario}}</a></div>
                    <div class="contenido-info white-space-normal" ng-if="!adminMascota.datos.medicos.telefono_veterinario">...</div>
                </div>
            </div>
            <div class="row no-margin-bottom">
                <div class="col s12 m10 offset-m1">
                    <div class="divider"></div>
                </div>
            </div>
        </div>
        <!-- MEDICO EDITAR -->
        <div ng-switch-when="true" ng-form="infoMedicoForm">
            <div class="row">
                <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l1">
                    <div class="margin-bottom-30">
                        <div class="campo-formulario white-space-normal">Fecha de la última desparasitación interna</div>
                        <div class="input-formulario">
                            <input input-date type="text" name="fecha" ng-model="adminMascota.espejo.medico.desparasitacion_i" container="" format="dd/mm/yyyy" months-full="{{adminMascota.datosDatepicker.meses}}" months-short="{{adminMascota.datosDatepicker.mesesCorto}}" weekdays-full="{{adminMascota.datosDatepicker.diasSemana}}" weekdays-short="" weekdays-letter="{{adminMascota.datosDatepicker.diasSemanaCorto}}" disable="disable" max="{{adminMascota.datosDatepicker.max}}" today="adminMascota.datosDatepicker.hoy" first-day="1" clear="adminMascota.datosDatepicker.limpiar" close="adminMascota.datosDatepicker.cerrar" select-years="12" />
                        </div>
                    </div>
                </div>

                <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l2">
                    <div class="margin-bottom-30">
                        <div class="campo-formulario white-space-normal">Fecha de la última desparasitación externa</div>
                        <div class="input-formulario">
                            <input input-date type="text" name="fecha" ng-model="adminMascota.espejo.medico.desparasitacion_e" container="" format="dd/mm/yyyy" months-full="{{adminMascota.datosDatepicker.meses}}" months-short="{{adminMascota.datosDatepicker.mesesCorto}}" weekdays-full="{{adminMascota.datosDatepicker.diasSemana}}" weekdays-short="" weekdays-letter="{{adminMascota.datosDatepicker.diasSemanaCorto}}" disable="disable" max="{{adminMascota.datosDatepicker.max}}" today="adminMascota.datosDatepicker.hoy" first-day="1" clear="adminMascota.datosDatepicker.limpiar" close="adminMascota.datosDatepicker.cerrar" select-years="12" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l1">
                    <div class="margin-bottom-30">
                        <div class="campo-formulario">Centro Veterinario</div>
                        <div class="input-formulario">
                            <input ng-model="adminMascota.espejo.medico.centro" placeholder="Centro Veterinario" type="text">
                        </div>
                    </div>
                </div>

                <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l2">
                    <div class="margin-bottom-30">
                        <div class="campo-formulario">Veterinario</div>
                        <div class="input-formulario">
                            <input ng-model="adminMascota.espejo.medico.veterinario" placeholder="Veterinario" type="text">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l1">
                    <div class="margin-bottom-30">
                        <div class="campo-formulario">Dirección</div>
                        <div class="input-formulario">
                            <input ng-model="adminMascota.espejo.medico.direccion_veterinario" placeholder="Dirección" type="text">
                        </div>
                    </div>
                </div>

                <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l2">
                    <div class="margin-bottom-30">
                        <div class="campo-formulario">Teléfono</div>
                        <div class="input-formulario">
                            <input ng-model="adminMascota.espejo.medico.telefono_veterinario" placeholder="Teléfono" type="text">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col s10 offset-s1">
                    <div class="divider"></div>
                </div>

            </div>
            <div class="row">
                <div class="col s10 offset-s1 m10 offset-m1">
                    * Dato requerido
                </div>
            </div>

            <div class="row">
                <div class="col s6 offset-s3 col m4 offset-m4 col l4 offset-l4 botones-formulario">
                    <div class="row">
                        <div class="col s12 m6 l6" style="margin-bottom: 10px;">
                            <button class="boton-neutro" ng-click="adminMascota.editar.medico.cancelar()">Cancelar</button>
                        </div>
                        <div class="col s12 m6 l6">
                            <button class="boton-verde" ng-class="{'bloqueado' : !infoMedicoForm.$valid }" ng-click="adminMascota.editar.medico.guardar(infoMedicoForm.$valid, adminMascota.espejo.medico)">GUARDAR</button>
                        </div>
                    </div>
    
                </div>
            </div>
        </div>
    </div>

</section>

<!---- INFORMACION DE MIS DUEÑOS ---->
<section class="informacion-mascota" ng-switch="adminMascota.editar.duenos.pasos">
    <div class="row">
        <div class="col s10 m8 offset-m1">
            <h4 class="titulo2 negrita interlineado20 c2">Información de mi(s) dueño(s)</h4>
        </div>
        <div class="col s2 m2 offset-m1">
            <img class="editar-perfil" src="assets/images/icons/editar.png" ng-click="adminMascota.editar.duenos.comenzar(adminMascota.datos.duenos)" ng-show="!adminMascota.editar.duenos.pasos">
        </div>
    </div>
    <!--<div class="col s10 m8 offset-m1">
        <div class="titulo-info c2">Dueño principal</div>
    </div>
    <div class="row">
        <div class="col s12 m4 offset-m1">
            <div class="titulo-info">Nombre completo</div>
            <div class="contenido-info white-space-normal">{{adminMascota.datos.duenos[0].nombre}} {{adminMascota.datos.duenos[0].apellido}}</div>
            <div class="divider responsive"></div>
        </div>
        <div class="col s12 m4 offset-m2">
            <div class="titulo-info">Fecha de nacimiento</div>
            <div class="contenido-info white-space-normal" ng-if="adminMascota.datos.duenos[0].nacimiento">{{adminMascota.datos.duenos[0].nacimiento}}</div>
            <div class="contenido-info white-space-normal" ng-if="!adminMascota.datos.duenos[0].nacimiento">...</div>
            <div class="divider"></div>
        </div>
    </div>

    <div class="row">
        <div class="col s12 m4 offset-m1">
            <div class="titulo-info">Teléfonos de contacto</div>
            <div class="contenido-info white-space-normal"><a ng-href="tel:{{adminMascota.datos.duenos[0].telefono}}">{{adminMascota.datos.duenos[0].telefono}}</a></div>
            <div class="divider responsive"></div>
        </div>
        <div class="col s12 m4 offset-m2">
            <div class="titulo-info">E-mail</div>
            <div class="contenido-info white-space-normal"><a ng-href="mailto:{{adminMascota.datos.duenos[0].email}}">{{adminMascota.datos.duenos[0].email}}</a></div>
            <div class="divider"></div>
        </div>
    </div>

    <div class="row">
        <div class="col s12 m4 offset-m1">
            <div class="titulo-info">Dirección</div>
            <div class="contenido-info white-space-normal" ng-if="adminMascota.datos.duenos[0].direccion">{{adminMascota.datos.duenos[0].direccion}},{{adminMascota.datos.duenos[0].codigo_postal}}, {{adminMascota.datos.duenos[0].ciudad}}, {{adminMascota.datos.duenos[0].provincia}}, {{adminMascota.datos.duenos[0].pais}} </div>
            <div class="contenido-info white-space-normal" ng-if="!adminMascota.datos.duenos[0].direccion">{{adminMascota.datos.duenos[0].codigo_postal}}, {{adminMascota.datos.duenos[0].ciudad}}, {{adminMascota.datos.duenos[0].provincia}}, {{adminMascota.datos.duenos[0].pais}} </div>
        </div>
    </div>

    <div class="row">
        <div class="col s12 m10 offset-m1">
            <div class="divider"></div>
        </div>
    </div>
    -->
    <!-- DUEÑOS NORMAL-->
    <div ng-switch-default>
        <div class="col s10 m8 offset-m1" ng-show="adminMascota.datos.duenos.length > 1">
            <div class="titulo-info c2">Mis otros dueños</div>
        </div>
        <div class="row" ng-repeat-start="dueno in adminMascota.datos.duenos | limitTo: adminMascota.datos.duenos.length - 1 : 1">
            <div class="col s12 m4 offset-m1">
                <div class="titulo-info">Nombre completo</div>
                <div class="contenido-info white-space-normal">{{dueno.nombre}} {{dueno.apellido}}</div>
                <div class="divider responsive"></div>
            </div>
            <div class="col s12 m4 offset-m2">
                <div class="titulo-info">Fecha de nacimiento</div>
                <div class="contenido-info white-space-normal" ng-if="dueno.nacimiento">{{dueno.nacimiento}}</div>
                <div class="contenido-info white-space-normal" ng-if="!dueno.nacimiento">...</div>
                <div class="divider"></div>
            </div>
        </div>

        <div class="row">
            <div class="col s12 m4 offset-m1">
                <div class="titulo-info">Teléfonos de contacto</div>
                <div class="contenido-info white-space-normal"><a ng-href="tel:{{dueno.telefono}}">{{dueno.telefono}}</a></div>
                <div class="divider responsive"></div>
            </div>
            <div class="col s12 m4 offset-m2">
                <div class="titulo-info">E-mail</div>
                <div class="contenido-info white-space-normal"><a ng-href="mailto:{{dueno.email}}">{{dueno.email}}</a></div>
                <div class="divider"></div>
            </div>
        </div>

        <div class="row">
            <div class="col s12 m4 offset-m1">
                <div class="titulo-info">Dirección</div>
                <div class="contenido-info white-space-normal" ng-if="dueno.direccion">{{dueno.direccion}},{{dueno.codigo_postal}}, {{dueno.ciudad}}, {{dueno.provincia}}, {{dueno.pais}} </div>
                <div class="contenido-info white-space-normal" ng-if="!dueno.direccion">{{dueno.codigo_postal}}, {{dueno.ciudad}}, {{dueno.provincia}}, {{dueno.pais}} </div>
            </div>
        </div>

        <div class="row" ng-repeat-end>
            <div class="col s12 m10 offset-m1">
                <div class="divider"></div>
            </div>
        </div>
    </div>
    <div ng-switch-when="true" ng-form="duenoExtraPrinForm">
        <div class="col s10 m8 offset-m1">
            <div class="titulo-info c2">Mis otros dueños</div>
        </div>
        <div ng-repeat="dueno in adminMascota.espejo.duenos | limitTo: adminMascota.espejo.duenos.length - 1 : 1" ng-form="duenoExtraForm">
            <div class="row">
                <!--- NOMBRE DEL CONTACTO --->
                <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l1">
                    <div class="campo-formulario">Nombre *</div>
                    <div class="input-formulario">
                        <div ng-class="{'margin-bottom-30': duenoExtraForm.nombre.$pristine || duenoExtraForm.nombre.$valid}">
                            <input ng-model="dueno.nombre" ng-class="{'valido': duenoExtraForm.nombre.$valid, 'erroneo': (!duenoExtraForm.nombre.$valid)}" placeholder="Nombre Completo" type="text" name="nombre" minlength="3" required>
                            <cdx-validez data-validez="duenoExtraForm.nombre.$valid" data-mostrar="true"></cdx-validez>
                        </div>
                        <div ng-messages="duenoExtraForm.nombre.$error" ng-show="duenoExtraForm.nombre.$dirty">
                            <div ng-message="required">Este campo es requerido.</div>
                            <div ng-message="minlength">Debe contener al menos 3 caracteres.</div>
                        </div>
                    </div>
                </div>

                <!--- APELLIDO --->
                <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l2">
                    <div class="campo-formulario">Apellido *</div>
                    <div class="input-formulario">
                        <div ng-class="{'margin-bottom-30': duenoExtraForm.apellido.$pristine || duenoExtraForm.apellido.$valid}">
                            <input ng-model="dueno.apellido" ng-class="{'valido': duenoExtraForm.apellido.$valid, 'erroneo': (!duenoExtraForm.apellido.$valid)}" placeholder="Apellido" type="text" name="apellido" minlength="3" required>
                            <cdx-validez data-validez="duenoExtraForm.apellido.$valid" data-mostrar="true"></cdx-validez>
                        </div>
                        <div ng-messages="duenoExtraForm.apellido.$error" ng-show="duenoExtraForm.apellido.$dirty">
                            <div ng-message="required">Este campo es requerido.</div>
                            <div ng-message="minlength">Debe contener al menos 3 caracteres.</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">

                <!-- TELEFONO -->
                <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l1">
                    <div class="campo-formulario">Télefonos de contacto *</div>
                    <div class="input-formulario">
                        <div ng-class="{'margin-bottom-30': duenoExtraForm.telefono.$pristine || duenoExtraForm.telefono.$valid}">
                            <input ng-model="dueno.telefono" ng-class="{'valido': duenoExtraForm.telefono.$valid, 'erroneo': (!duenoExtraForm.telefono.$valid)}" placeholder="Télefonos de contacto" type="tel" name="telefono" ng-pattern="/^[0-9]*$/" required>
                            <cdx-validez data-validez="duenoExtraForm.telefono.$valid" data-mostrar="true"></cdx-validez>
                        </div>
                        <div ng-messages="duenoExtraForm.telefono.$error" ng-show="duenoExtraForm.telefono.$dirty">
                            <div ng-message="required">Este campo es requerido.</div>
                            <div ng-message="pattern">Solo se aceptan digitos.</div>
                        </div>
                    </div>
                </div>
                <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l2">
                    <div class="campo-formulario">E-mail *</div>
                    <div class="input-formulario">
                        <div ng-class="{'margin-bottom-30': duenoExtraForm.email.$pristine || duenoExtraForm.email.$valid}">
                            <input ng-model="dueno.email" ng-class="{'valido': duenoExtraForm.email.$valid, 'erroneo': (!duenoExtraForm.email.$valid)}" placeholder="E-mail" type="email" name="email" required>
                            <cdx-validez data-validez="duenoExtraForm.email.$valid" data-mostrar="true"></cdx-validez>
                        </div>
                        <div ng-messages="duenoExtraForm.email.$error" ng-show="duenoExtraForm.email.$dirty">
                            <div ng-message="required">Este campo es requerido.</div>
                            <div ng-message="email">Debe ser un E-mail valido.</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">

                <!-- FECHA -->
                <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l1">
                    <div class="campo-formulario">Fecha de Nacimiento</div>
                    <div class="input-formulario">
                        <div ng-class="{'margin-bottom-30': duenoExtraForm.fecha.$pristine || duenoExtraForm.fecha.$valid}">
                            <input input-date type="text" name="fecha" ng-model="dueno.nacimiento" container="" format="dd/mm/yyyy" months-full="{{adminMascota.datosDatepicker.meses}}" months-short="{{adminMascota.datosDatepicker.mesesCorto}}" weekdays-full="{{adminMascota.datosDatepicker.diasSemana}}" weekdays-short="" weekdays-letter="{{adminMascota.datosDatepicker.diasSemanaCorto}}" disable="disable" max="{{adminMascota.datosDatepicker.max}}" today="adminMascota.datosDatepicker.hoy" first-day="1" clear="adminMascota.datosDatepicker.limpiar" close="adminMascota.datosDatepicker.cerrar" select-years="12" />
                        </div>
                    </div>
                </div>

                <!-- SEXO -->
                <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l2">
                    <div class="campo-formulario">Sexo</div>
                    <div class="input-formulario">
                        <div class="margin-bottom-30">
                            <md-select ng-model="dueno.sexo" placeholder="Sexo" class="md-no-underline">
                                <md-option value="Masculino">Masculino</md-option>
                                <md-option value="Femenino">Femenino</md-option>
                            </md-select>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">

                <!-- PAIS -->
                <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l1">
                    <div class="campo-formulario">País *</div>
                    <div class="input-formulario">
                        <div ng-class="{'margin-bottom-30': duenoExtraForm.pais.$pristine || duenoExtraForm.pais.$valid}">
                            <md-select ng-model="dueno.pais" ng-class="{'valido': duenoExtraForm.pais.$valid, 'erroneo': (!duenoExtraForm.pais.$valid)}" placeholder="País" class="md-no-underline" name="pais" required>
                                <md-option value="{{pais}}" ng-repeat="pais in adminMascota.paises">{{pais}}</md-option>
                            </md-select>
                            <cdx-validez data-validez="duenoExtraForm.pais.$valid" data-mostrar="true"></cdx-validez>
                        </div>
                        <div ng-messages="duenoExtraForm.pais.$error" ng-show="duenoExtraForm.pais.$dirty">
                            <div ng-message="required">Este campo es requerido.</div>
                        </div>
                    </div>
                </div>

                <!-- PROVINCIA -->
                <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l2">
                    <div class="campo-formulario">Provincia *</div>
                    <div class="input-formulario">
                        <div ng-class="{'margin-bottom-30': duenoExtraForm.provincia.$pristine || duenoExtraForm.provincia.$valid}">
                            <input ng-model="dueno.provincia" ng-class="{'valido': duenoExtraForm.provincia.$valid, 'erroneo': (!duenoExtraForm.provincia.$valid)}" placeholder="Provincia" type="text" name="provincia" required>
                            <cdx-validez data-validez="duenoExtraForm.provincia.$valid" data-mostrar="true"></cdx-validez>
                        </div>
                        <div ng-messages="duenoExtraForm.provincia.$error" ng-show="duenoExtraForm.provincia.$dirty">
                            <div ng-message="required">Este campo es requerido.</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">

                <!-- CIUDAD -->
                <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l1">
                    <div class="campo-formulario">Ciudad *</div>
                    <div class="input-formulario">
                        <div ng-class="{'margin-bottom-30': duenoExtraForm.ciudad.$pristine || duenoExtraForm.ciudad.$valid}">
                            <input ng-model="dueno.ciudad" ng-class="{'valido': duenoExtraForm.ciudad.$valid, 'erroneo': (!duenoExtraForm.ciudad.$valid)}" placeholder="Ciudad" type="text" name="ciudad" required>
                            <cdx-validez data-validez="duenoExtraForm.ciudad.$valid" data-mostrar="true"></cdx-validez>
                        </div>
                        <div ng-messages="duenoExtraForm.ciudad.$error" ng-show="duenoExtraForm.ciudad.$dirty">
                            <div ng-message="required">Este campo es requerido.</div>
                        </div>
                    </div>
                </div>

                <!-- DIRECCION -->
                <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l2">
                    <div class="margin-bottom-30">
                        <div class="campo-formulario">Dirección</div>
                        <div class="input-formulario">
                            <input ng-model="dueno.direccion" placeholder="Dirección" type="text">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">

                <!-- CODIGO POSTAL -->
                <div class="col s11 offset-s1 m4 offset-m1">
                    <div class="campo-formulario">Código postal *</div>
                    <div class="input-formulario">
                        <div ng-class="{'margin-bottom-30': duenoExtraForm.postcode.$pristine || duenoExtraForm.postcode.$valid}">
                            <input ng-model="dueno.codigo_postal" ng-class="{'valido': duenoExtraForm.postcode.$valid, 'erroneo': (!duenoExtraForm.postcode.$valid)}" placeholder="Código postal" type="text" name="postcode" required>
                            <cdx-validez data-validez="duenoExtraForm.postcode.$valid" data-mostrar="true"></cdx-validez>
                        </div>
                        <div ng-messages="duenoExtraForm.postcode.$error" ng-show="duenoExtraForm.postcode.$dirty">
                            <div ng-message="required">Este campo es requerido.</div>
                        </div>
                    </div>
                </div>


                <div class="col s10 offset-s1 m4 offset-m2">
                    <div class="margin-bottom-30 margin-top-30">
                        <button class="boton-neutro landing" ng-click="adminMascota.editar.duenos.desparecer($index)">Eliminar este contacto</button>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col s10 offset-s1">
                    <div class="divider"></div>
                </div>
            </div>


        </div>

        <div class="row">
            <div class="col s12 m10 offset-m1">
                <div class="agregar-placa-perfil">
                    <img src="assets/images/forms/agregar_placa.png" ng-click="adminMascota.espejo.duenos.push({nombre: null, apellido: null, telefono: null, email: null, nacimiento: null, direccion: null, pais: null, provincia: null, ciudad: null, codigo_postal: null, sexo: null})"> Agregar Dueño
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col s10 offset-s1">
                <div class="divider"></div>
            </div>

        </div>
        <div class="row">
            <div class="col s10 offset-s1 m10 offset-m1">
                * Dato requerido
            </div>
        </div>

        <div class="row">
            <div class="col s6 offset-s3 col m4 offset-m4 col l4 offset-l4 botones-formulario">
                <div class="row">
                    <div class="col s12 m6 l6" style="margin-bottom: 10px;">
                        <button class="boton-neutro" ng-click="adminMascota.editar.duenos.cancelar()">Cancelar</button>
                    </div>
                    <div class="col s12 m6 l6">
                        <button class="boton-verde" ng-class="{'bloqueado' : !duenoExtraPrinForm.$valid }" ng-click="adminMascota.editar.duenos.guardar(duenoExtraPrinForm.$valid, adminMascota.espejo.duenos)">GUARDAR</button>
                    </div>
                </div>
                
            </div>
        </div>
    </div>

</section>

<section>
    <div class="row">
        <div class="col s10 offset-s1">
            <div ui-sref="perfil.misMascotasEliminar({idPlaca: adminMascota.datos.basico.codigo})" class="eliminar-pequeno">Dar de baja a {{adminMascota.datos.basico.nombre}}</div>
        </div>
    </div>

</section>
