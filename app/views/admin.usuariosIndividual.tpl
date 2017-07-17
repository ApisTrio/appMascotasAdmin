<!---- INFORMACION BASICA ---->
<section class="padding-top-30" ng-init="usuariosIndividual.pasosPass = 1">
    <div class="row no-margin-bottom">
        <div class="col s12 m10 offset-m1">
            <h4 class="titulo2 negrita interlineado20 c2">Usuario</h4>
        </div>
    </div>

    <div class="row">
        <div class="col s12 m10 offset-m1">
            <div class="divider"></div>
        </div>
    </div>

    <div class="row" ng-if="!usuariosIndividual.eliminarCompleto">
        <div class="col s12 m4 offset-m1">
            <div class="titulo-info c2">Información Básica</div>
        </div>
    </div>
    <div ng-form="cambiarEmailForm">
        <div class="row" ng-if="!usuariosIndividual.eliminarCompleto">
            <div class="col s12 m4 offset-m1">
                <div class="titulo-info">Nombre de usuario</div>
                <div class="contenido-info white-space-normal">{{usuariosIndividual.datos.usuario.usuario}}</div>
                <div class="divider" ng-show="usuariosIndividual.pasos == 1"></div>
            </div>

            <div class="col s12 m4 offset-m2" ng-if="usuariosIndividual.pasosEmail == 1">
                <div class="titulo-info">E-mail</div>
                <div class="contenido-info white-space-normal">{{usuariosIndividual.datos.usuario.emailU}}</div>
                <div class="divider" ng-show="usuariosIndividual.pasos == 1"></div>
            </div>

            <div class="col s12 m4 offset-m2" ng-if="usuariosIndividual.pasosEmail == 2">
                <div class="campo-formulario">E-mail *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': cambiarEmailForm.email.$pristine || cambiarEmailForm.email.$valid}">
                        <input ng-model="usuariosIndividual.email" ng-class="{'valido': cambiarEmailForm.email.$valid, 'erroneo': (!cambiarEmailForm.email.$valid)}" placeholder="E-mail" type="email" name="email" cdx-validacion data-validacion="emailU" data-deseado="false" required>
                        <cdx-validez data-validez="cambiarEmailForm.email.$valid" data-mostrar="true"></cdx-validez>
                    </div>
                    <div ng-messages="cambiarEmailForm.email.$error" ng-show="cambiarEmailForm.email.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                        <div ng-message="email">Debe ser un E-mail valido.</div>
                        <div ng-message="emailU">El E-mail se encuentra en uso.</div>
                    </div>
                </div>

            </div>

        </div>
        <div class="row" ng-if="!usuariosIndividual.eliminarCompleto && usuariosIndividual.pasosEmail == 2">
            <div class="col s6 offset-s3 col m4 offset-m4 col l4 offset-l4 botones-formulario">
                <div class="row">
                    <div class="col s12 m12 l6" style="margin-bottom: 10px">
                        <button class="boton-neutro" ng-click="usuariosIndividual.cambiarEmailCancelar()">Cancelar</button>
                    </div>
                    <div class="col s12 m12 l6">
                        <button class="boton-verde" ng-click="usuariosIndividual.cambiarEmail(usuariosIndividual.email, usuariosIndividual.datos.usuario.idUsuario, cambiarEmailForm.$valid)" ng-class="{'bloqueado' : !cambiarEmailForm.$valid }">GUARDAR</button>
                    </div>
                </div>


            </div>
        </div>

    </div>


    <div class="col s6 offset-s3 col m4 offset-m4 col l3 offset-l5 botones-formulario" ng-if="!usuariosIndividual.eliminarCompleto && usuariosIndividual.pasosEmail == 1">
        <div class="row">
            <div class="col s12 m12 l6" style="margin-bottom: 10px">
                <button class="boton-verde-negativo" ng-click="usuariosIndividual.pasosEmail = 2;">CORREO</button>
            </div>
        </div>
    </div>

    <div ng-if="usuariosIndividual.pasosPass == 2 &&  !usuariosIndividual.eliminarCompleto" ng-form="cambiarContrasenaForm">
        <div class="row">


            <!------ Contraseña ------>
            <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l1">
                <div class="campo-formulario">Contraseña *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': cambiarContrasenaForm.clave.$pristine || cambiarContrasenaForm.clave.$valid}">
                        <input ng-model="usuariosIndividual.pass" ng-class="{'valido': cambiarContrasenaForm.clave.$valid, 'erroneo': (!cambiarContrasenaForm.clave.$valid && cambiarContrasenaForm.clave.$dirty)}" placeholder="Contraseña" type="password" name="clave" minlength="6" required>
                        <cdx-validez data-validez="cambiarContrasenaForm.clave.$valid" data-mostrar="cambiarContrasenaForm.clave.$dirty"></cdx-validez>
                    </div>
                    <div ng-messages="cambiarContrasenaForm.clave.$error" ng-show="cambiarContrasenaForm.clave.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                        <div ng-message="minlength">Debe contener al menos 6 caracteres.</div>
                    </div>
                </div>
            </div>

            <!------ Verificar Contraseña ------>
            <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l2">
                <div class="campo-formulario">Verificar contraseña *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': cambiarContrasenaForm.clave2.$pristine || cambiarContrasenaForm.clave2.$valid}">
                        <input ng-model="usuariosIndividual.verificarPass" ng-class="{'valido': cambiarContrasenaForm.clave2.$valid, 'erroneo': (!cambiarContrasenaForm.clave2.$valid && cambiarContrasenaForm.clave2.$dirty)}" placeholder="Verificar contraseña" type="password" name="clave2" cdx-validacion-clave data-validacion="{{usuariosIndividual.pass}}" required>
                        <cdx-validez data-validez="cambiarContrasenaForm.clave2.$valid" data-mostrar="cambiarContrasenaForm.clave2.$dirty"></cdx-validez>
                    </div>
                    <div ng-messages="cambiarContrasenaForm.clave2.$error" ng-show="cambiarContrasenaForm.clave2.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                        <div ng-message="identica">Las contraseñas deben ser identicas.</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col s6 offset-s3 col m4 offset-m4 col l4 offset-l4 botones-formulario">
                <div class="row">
                    <div class="col s12 m12 l6" style="margin-bottom: 10px">
                        <button class="boton-neutro" ng-click="usuariosIndividual.cambiarPassCancelar()">Cancelar</button>
                    </div>
                    <div class="col s12 m12 l6">
                        <button class="boton-verde" ng-click="usuariosIndividual.cambiarPass(usuariosIndividual.pass, usuariosIndividual.datos.usuario.idUsuario, cambiarContrasenaForm.$valid)" ng-class="{'bloqueado' : !cambiarContrasenaForm.$valid }">GUARDAR</button>
                    </div>
                </div>


            </div>
        </div>

    </div>



    <div class="col s6 offset-s3 col m4 offset-m4 col l3 offset-l5 botones-formulario" ng-if="usuariosIndividual.pasosPass == 1 &&  !usuariosIndividual.eliminarCompleto">
        <div class="row">
            <div class="col s12 m12 l6" style="margin-bottom: 10px">
                <button class="boton-verde-negativo" ng-click="usuariosIndividual.pasosPass = 2">CONTRASEÑA</button>
            </div>
        </div>
    </div>



</section>
<!---- INFORMACION DE CONTACTO---->
<section ng-switch="usuariosIndividual.pasos" ng-init="usuariosIndividual.pasos = 1" ng-if="!usuariosIndividual.eliminarCompleto">
    <div class="row">
        <div class="col s12 m4 offset-m1">
            <div class="titulo-info c2">Información de Contacto</div>
        </div>
    </div>
    <div ng-switch-default>
        <div class="row">
            <div class="col s12 m4 offset-m1">
                <div class="titulo-info">Nombre</div>
                <div class="contenido-info white-space-normal">{{usuariosIndividual.datos.dueno.nombre}}</div>
                <div class="divider"></div>
            </div>
            <div class="col s12 m4 offset-m2">
                <div class="titulo-info">Apellido</div>
                <div class="contenido-info white-space-normal">{{usuariosIndividual.datos.dueno.apellido}}</div>
                <div class="divider"></div>
            </div>
        </div>

        <div class="row">
            <div class="col s12 m4 offset-m1">
                <div class="titulo-info">Teléfono de contacto</div>
                <div class="contenido-info white-space-normal">{{usuariosIndividual.datos.dueno.telefono}}</div>
                <div class="divider"></div>
            </div>
            <div class="col s12 m4 offset-m2">
                <div class="titulo-info">E-mail</div>
                <div class="contenido-info white-space-normal">{{usuariosIndividual.datos.dueno.email}}</div>
                <div class="divider"></div>
            </div>
        </div>

        <div class="row" style="margin-left: none;">
            <div class="col s12 m4 offset-m1">
                <div class="titulo-info">Fecha de nacimiento</div>
                <div class="contenido-info white-space-normal">{{usuariosIndividual.datos.dueno.nacimiento}}</div>
                <div class="divider"></div>
            </div>
            <div class="col s12 m4 offset-m2">
                <div class="titulo-info">Sexo</div>
                <div class="contenido-info" ng-if="usuariosIndividual.datos.dueno.sexo">{{usuariosIndividual.datos.dueno.sexo}}</div>
                <div class="contenido-info" ng-if="!usuariosIndividual.datos.dueno.sexo">...</div>
                <div class="divider"></div>
            </div>
        </div>

        <div class="row">
            <div class="col s12 m4 offset-m1">
                <div class="titulo-info">Dirección</div>
                <div class="contenido-info white-space-normal" ng-if="usuariosIndividual.datos.dueno.direccion">{{usuariosIndividual.datos.dueno.direccion}}, {{usuariosIndividual.datos.dueno.codigo_postal}}, {{usuariosIndividual.datos.dueno.ciudad}}, {{usuariosIndividual.datos.dueno.provincia}}, {{usuariosIndividual.datos.dueno.pais}}</div>
                <div class="contenido-info white-space-normal" ng-if="!usuariosIndividual.datos.dueno.direccion"> {{usuariosIndividual.datos.dueno.codigo_postal}}, {{usuariosIndividual.datos.dueno.ciudad}}, {{usuariosIndividual.datos.dueno.provincia}}, {{usuariosIndividual.datos.dueno.pais}}</div>
            </div>
        </div>

        <div class="row">
            <div class="col s12 m10 offset-m1">
                <div class="divider"></div>
            </div>
        </div>

        <div class="col s6 offset-s3 col m4 offset-m4 col l3 offset-l5 botones-formulario">
            <div class="row">
                <div class="col s12 m12 l6" style="margin-bottom: 10px">
                    <button class="boton-verde-negativo" ng-click="usuariosIndividual.editarComenzar(usuariosIndividual.datos)">EDITAR</button>
                </div>
            </div>
        </div>
    </div>

    <div ng-switch-when="2" ng-form="editarForm">
        <div class="row">

            <!--- NOMBRE DEL CONTACTO --->
            <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l1">
                <div class="campo-formulario">Nombre *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': editarForm.nombre.$valid}">
                        <input ng-model="usuariosIndividual.datosEspejo.nombre" ng-class="{'valido': editarForm.nombre.$valid, 'erroneo': (!editarForm.nombre.$valid)}" placeholder="Nombre Completo" type="text" name="nombre" minlength="2" required>
                        <cdx-validez data-validez="editarForm.nombre.$valid" data-mostrar="true"></cdx-validez>
                    </div>
                    <div ng-messages="editarForm.nombre.$error" ng-show="editarForm.nombre.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                        <div ng-message="minlength">Debe contener al menos 2 caracteres.</div>
                    </div>
                </div>
            </div>

            <!--- APELLIDO --->
            <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l2">
                <div class="campo-formulario">Apellido *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': editarForm.nombre.$valid}">
                        <input ng-model="usuariosIndividual.datosEspejo.apellido" ng-class="{'valido': editarForm.apellido.$valid, 'erroneo': (!editarForm.apellido.$valid)}" placeholder="Apellido" type="text" name="apellido" minlength="2" required>
                        <cdx-validez data-validez="editarForm.apellido.$valid" data-mostrar="true"></cdx-validez>
                    </div>
                    <div ng-messages="editarForm.apellido.$error" ng-show="editarForm.apellido.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                        <div ng-message="minlength">Debe contener al menos 2 caracteres.</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">

            <!-- TELEFONO -->
            <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l1">
                <div class="campo-formulario">Télefonos de contacto *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': editarForm.telefono.$pristine || editarForm.telefono.$valid}">
                        <input ng-model="usuariosIndividual.datosEspejo.telefono" ng-class="{'valido': editarForm.telefono.$valid, 'erroneo': (!editarForm.telefono.$valid && editarForm.telefono.$dirty)}" placeholder="Télefonos de contacto" type="tel" name="telefono" ng-pattern="/^[0-9]*$/" required>
                        <cdx-validez data-validez="editarForm.telefono.$valid" data-mostrar="true"></cdx-validez>
                    </div>
                    <div ng-messages="editarForm.telefono.$error" ng-show="editarForm.telefono.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                        <div ng-message="pattern">Solo se aceptan digitos.</div>
                    </div>
                </div>
            </div>
            <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l2">
                <div class="campo-formulario">E-mail *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': editarForm.nombre.$valid}">
                        <input ng-model="usuariosIndividual.datosEspejo.email" ng-class="{'valido': editarForm.email.$valid, 'erroneo': (!editarForm.email.$valid)}" placeholder="E-mail" type="email" name="email" required>
                        <cdx-validez data-validez="editarForm.email.$valid" data-mostrar="true"></cdx-validez>
                    </div>
                    <div ng-messages="editarForm.email.$error" ng-show="editarForm.email.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                        <div ng-message="email">Debe ser un E-mail valido.</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">

            <!-- FECHA -->
            <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l1">
                <div class="campo-formulario">Código postal *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': editarForm.postcode.$pristine || editarForm.postcode.$valid}">
                        <input ng-model="usuariosIndividual.datosEspejo.codigo_postal" ng-class="{'valido': editarForm.postcode.$valid, 'erroneo': (!editarForm.postcode.$valid && editarForm.postcode.$dirty)}" placeholder="Código postal" type="text" name="postcode" required>
                        <cdx-validez data-validez="editarForm.postcode.$valid" data-mostrar="true"></cdx-validez>
                    </div>
                    <div ng-messages="editarForm.postcode.$error" ng-show="editarForm.postcode.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                    </div>
                </div>
            </div>

            <!-- DIRECCION -->
            <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l2">
                <div class="campo-formulario">Dirección</div>
                <div class="input-formulario">
                    <div class="margin-bottom-30">
                        <input ng-model="usuariosIndividual.datosEspejo.direccion" placeholder="Dirección" type="text">
                    </div>
                </div>
            </div>
        </div>

        <div class="row">

            <!-- PAIS -->
            <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l1">
                <div class="campo-formulario">País *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': editarForm.pais.$pristine || editarForm.pais.$valid}">
                        <md-select ng-model="usuariosIndividual.datosEspejo.pais" ng-class="{'valido': editarForm.pais.$valid, 'erroneo': (!editarForm.pais.$valid && editarForm.pais.$dirty)}" placeholder="País" class="md-no-underline" name="pais" required>
                            <md-option value="{{pais}}" ng-repeat="pais in usuariosIndividual.paises">{{pais}}</md-option>
                        </md-select>
                        <cdx-validez data-validez="editarForm.pais.$valid" data-mostrar="true"></cdx-validez>
                    </div>
                    <div ng-messages="editarForm.pais.$error" ng-show="editarForm.pais.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                    </div>
                </div>
            </div>

            <!-- PROVINCIA -->
            <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l2">
                <div class="campo-formulario">Provincia *</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': editarForm.provincia.$pristine || editarForm.provincia.$valid}">
                        <input ng-model="usuariosIndividual.datosEspejo.provincia" ng-class="{'valido': editarForm.provincia.$valid, 'erroneo': (!editarForm.provincia.$valid && editarForm.provincia.$dirty)}" placeholder="Provincia" type="text" name="provincia" required>

                        <cdx-validez data-validez="editarForm.provincia.$valid" data-mostrar="true"></cdx-validez>
                    </div>
                    <div ng-messages="editarForm.provincia.$error" ng-show="editarForm.provincia.$dirty">
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
                    <div ng-class="{'margin-bottom-30': editarForm.ciudad.$pristine || editarForm.ciudad.$valid}">
                        <input ng-model="usuariosIndividual.datosEspejo.ciudad" ng-class="{'valido': editarForm.ciudad.$valid, 'erroneo': (!editarForm.ciudad.$valid && editarForm.ciudad.$dirty)}" placeholder="Ciudad" type="text" name="ciudad" required>
                        <cdx-validez data-validez="editarForm.ciudad.$valid" data-mostrar="true"></cdx-validez>
                    </div>
                    <div ng-messages="editarForm.ciudad.$error" ng-show="editarForm.ciudad.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                    </div>
                </div>
            </div>

            <!-- SEXO -->
            <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l2">
                <div class="campo-formulario">Sexo</div>
                <div class="input-formulario">
                    <div class="margin-bottom-30">
                        <md-select ng-model="usuariosIndividual.datosEspejo.sexo" placeholder="Sexo" class="md-no-underline">
                            <md-option value="Masculino">Masculino</md-option>
                            <md-option value="Femenino">Femenino</md-option>
                        </md-select>
                    </div>
                </div>
            </div>


        </div>

        <div class="row">

            <!-- FECHA -->
            <div class="col s11 offset-s1 m5 offset-m1 l4 offset-l1">
                <div class="campo-formulario">Fecha de Nacimiento</div>
                <div class="input-formulario">
                    <div>
                        <input input-date type="text" name="fecha" ng-model="usuariosIndividual.datosEspejo.nacimiento" container="" format="dd/mm/yyyy" months-full="{{usuariosIndividual.datosDatepicker.meses}}" months-short="{{usuariosIndividual.datosDatepicker.mesesCorto}}" weekdays-full="{{usuariosIndividual.datosDatepicker.diasSemana}}" weekdays-short="" weekdays-letter="{{usuariosIndividual.datosDatepicker.diasSemanaCorto}}" disable="disable" max="{{usuariosIndividual.datosDatepicker.max}}" today="usuariosIndividual.datosDatepicker.hoy" first-day="1" clear="usuariosIndividual.datosDatepicker.limpiar" close="usuariosIndividual.datosDatepicker.cerrar" select-years="80" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col s6 offset-s3 col m4 offset-m4 col l4 offset-l4 botones-formulario">
                <div class="row">
                    <div class="col s12 m12 l6" style="margin-bottom: 10px">
                        <button class="boton-neutro" ng-click="usuariosIndividual.editarCancelar()">Cancelar</button>
                    </div>
                    <div class="col s12 m12 l6">
                        <button class="boton-verde" ng-click="usuariosIndividual.editarGuardar(editarForm.$valid, usuariosIndividual.datosEspejo)" ng-class="{'bloqueado' : !editarForm.$valid }">GUARDAR</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>
<section ng-if="!usuariosIndividual.eliminarCompleto">
    <div class="row">
        <div class="col s10 offset-s1">
            <div class="campo-formulario">Mascotas Asociadas</div>
        </div>
    </div>
    <div class="row">
        <div class="col s10 offset-s1">
            <div class="row">
                <div class="col s12 m4 l2" ng-repeat="mascota in usuariosIndividual.mascotas" style="margin-top: 30px;cursor: pointer">
                    <div class="circle foto-mascota-pequena" style="background-image:url({{usuariosIndividual.apiDir.dominio}}{{usuariosIndividual.apiDir.path}}{{usuariosIndividual.apiDir.imagenes.mascotas}}{{mascota.foto}}); background-position: 100% 100%; background-size: cover;" ng-if="mascota.foto" ui-sref="admin.mascota({idPlaca: mascota.codigo})">
                    </div>
                    <div class="circle foto-mascota-pequena" style="background-image:url(assets/images/icons/foto_perfil.png); border: 1px solid black" ng-if="!mascota.foto" ui-sref="admin.mascota({idPlaca: mascota.codigo})">
                    </div>
                    <div class="center-align" ui-sref="admin.mascota({idPlaca: mascota.codigo})">{{mascota.nombre}}</div>
                </div>

                <div class="col s12 m4 l2" style="margin-top: 30px;">

                    <div class="center-align" ui-sref="admin.usuariosNuevaMascota({idUsuario: usuariosIndividual.datos.usuario.idUsuario})" style="cursor: pointer">
                        <img class="circle mascota-add-pequena" width="100px" src="assets/images/icons/agregar_nueva_mascota.png">
                    </div>

                    <div class="col s12 center-align" ui-sref="admin.nuevaMascota({idUsuario: usuariosIndividual.datos.usuario.idUsuario})" style="cursor: pointer">
                        <div class="center-align">Agregar nueva mascota
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</section>
<section ng-switch="usuariosIndividual.eliminarPasos" ng-init="usuariosIndividual.eliminarPasos = 1" ng-if="!usuariosIndividual.eliminarCompleto">
    <div class="row" ng-switch-default>
        <div class="col s10 offset-s1">
            <div ng-click="usuariosIndividual.eliminarPasos = 2" class="eliminar-pequeno">Eliminar Usuario</div>
        </div>
    </div>
    <div class="row" ng-switch-when="2">
        <div class="row">
            <div class="col s10 offset-s1 center-align">
                Se eliminará el usuario {{usuariosIndividual.datos.usuario.usuario}}, para conﬁrmar escribe la palabra ELIMINAR
            </div>
        </div>
        <div class="row">

            <div class="col s10 offset-s1 m4 offset-m4 l4 offset-l4">
                <div class="input-formulario">
                    <input ng-model="usuariosIndividual.eliminar" placeholder="ELIMINAR" type="text" style="width: 100%">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col s6 offset-s3 col m4 offset-m4 col l4 offset-l4 botones-formulario">
                <div class="row">
                    <div class="col s12 m12 l6" style="margin-bottom: 10px">
                        <button class="boton-neutro" ng-click="usuariosIndividual.eliminarCancelar()">Cancelar</button>
                    </div>
                    <div class="col s12 m12 l6">
                        <button class="boton-verde" ng-click="usuariosIndividual.eliminarConfirmar(usuariosIndividual.uppercase(usuariosIndividual.eliminar), usuariosIndividual.datos.usuario.idUsuario)" ng-class="{'bloqueado' : !usuariosIndividual.uppercase(usuariosIndividual.eliminar) }">CONFIRMAR</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section ng-if="usuariosIndividual.eliminarCompleto">
    <div class="row">
        <div class="col s10 offset-s1 center-align">
            <img src="assets/images/forms/Confirm.png">
        </div>
    </div>
    <div class="row">
        <div class="col s10 offset-s1 center-align">
            <h4 class="titulo2 negrita interlineado20 c2">Hemos eliminado al usuario {{usuariosIndividual.datos.usuario.usuario}}</h4>
        </div>
    </div>
</section>
