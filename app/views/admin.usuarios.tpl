<section class="admin-usuarios">
	<div class="row">
		
		<div class="col s10 offset-s1 m10 offset-m1 titulo-admin">
			<p>Buscar</p>
		</div>

	</div>
	
	<div ng-form="busqueda">

		<div class="row">

			<div class="col s11 offset-s1 m2 offset-m1">
				<div class="campo-formulario-admin">ID:</div>
	        	<div class="input-formulario-admin">
	        		<div>
						<input ng-model="adminUsuarios.datos.id" type="text" name="id">
					</div>
				</div>
			</div>

			<div class="col s11 offset-s1 m2">
				<div class="campo-formulario-admin">Especie:</div>
	        	<div class="input-formulario-admin">
	        		<div>
						<input ng-model="adminUsuarios.datos.especie" type="text" name="nombre">
					</div>
				</div>
			</div>

			<div class="col s11 offset-s1 m2">
				<div class="campo-formulario-admin">Raza:</div>
	        	<div class="input-formulario-admin">
	        		<div>
						<input ng-model="adminUsuarios.datos.raza" type="text" name="raza">
					</div>
				</div>
			</div>

			<div class="col s11 offset-s1 m2">
				<div class="campo-formulario-admin">Mascota:</div>
	        	<div class="input-formulario-admin">
	        		<div>
						<input ng-model="adminUsuarios.datos.mascota" type="text" name="mascota">
					</div>
				</div>
			</div>

			<div class="col s11 offset-s1 m2">
				<div class="campo-formulario-admin">Usuario:</div>
	        	<div class="input-formulario-admin">
	        		<div>
						<input ng-model="adminUsuarios.datos.usuario" type="text" name="usuario">
					</div>
				</div>
			</div>

		</div>		

		<div class="row">
			
			<div class="col s11 offset-s1 m2 offset-m1">
				<div class="campo-formulario-admin">Telefono:</div>
	        	<div class="input-formulario-admin">
	        		<div>
						<input ng-model="adminUsuarios.datos.telefono" type="text" name="telefono">
					</div>
				</div>
			</div>

			<div class="col s11 offset-s1 m2">
				<div class="campo-formulario-admin">E-mail:</div>
	        	<div class="input-formulario-admin">
	        		<div>
						<input ng-model="adminUsuarios.datos.email" type="text" name="email">
					</div>
				</div>
			</div>

			<div class="col s11 offset-s1 m2">
				<div class="campo-formulario-admin">Fecha:</div>
	        	<div class="input-formulario-admin">
	        		<div>
						<input ng-model="adminUsuarios.datos.fecha" type="text" name="ciudad">
					</div>
				</div>
			</div>


			<div class="col s11 offset-s1 m2">
				<div class="campo-formulario-admin">Ciudad / Provincia:</div>
	        	<div class="input-formulario-admin">
	        		<div>
						<input ng-model="adminUsuarios.datos.ciudad_provincia" type="text" name="ciudad_provincia">
					</div>
				</div>
			</div>

			<div class="col s11 offset-s1 m2">
				<div class="campo-formulario-admin">Perdido:</div>
	        	<switch id="enabled" name="enabled" ng-model="adminUsuarios.datos.perdida" class="white"></switch>
			</div>

		</div>

		<div class="row">
			
			<div class="col s11 offset-s1 m2 offset-m1">
				<div class="campo-formulario-admin">Código postal:</div>
	        	<div class="input-formulario-admin">
	        		<div>
						<input ng-model="adminUsuarios.datos.codigo_postal" type="text" name="codigo_postal">
					</div>
				</div>
			</div>

			<div class="col s11 offset-s1 m2">
				<div class="campo-formulario-admin">País:</div>
	        	<div class="input-formulario-admin">
	        		<div>
						<input ng-model="adminUsuarios.datos.pais" type="text" name="forma_placa">
					</div>
				</div>
			</div>

			<div class="col s11 offset-s1 m2">
				<div class="campo-formulario-admin">Forma placa:</div>
				<div style="padding-top: 5px;">
	                <input ng-model="adminUsuarios.datos.forma" value="redonda" type="radio" class="with-gap radio-green" id="forma_placa_redonda" name="forma_placa" checked="checked"/>
	                <label for="forma_placa_redonda">Redonda</label>
	                <input ng-model="adminUsuarios.datos.forma" value="pajarita" type="radio" class="with-gap radio-green" id="forma_placa_pajarito" name="forma_placa"/>
	                <label for="forma_placa_pajarito">Pajarita</label>
	            </div>
			</div>

			<div class="col s11 offset-s1 m2">
				<div class="campo-formulario-admin">Diseño:</div>
	        	<div class="input-formulario-admin">
	        		<div>
						<input ng-model="adminUsuarios.datos.modelo" type="text" name="diseno">
					</div>
				</div>
			</div>

			<div class="col s11 offset-s1 m2 margin-top-30">
				<button class="boton-verde" ng-click="adminUsuarios.busqueda(adminUsuarios.datos)">BUSCAR</button>
			</div>

		</div>

	</div>

	<div class="row">
		
		<div class="col s10 offset-s1 m10 offset-m1 titulo-admin-2">
			<p>Estos son los codigos QR activos: </p>
		</div>

	</div>

	<div class="row">
		
		<div class="col s11 offset-s1 m5 offset-m7 filtros-tabla"><span ng-click="adminUsuarios.activo = 'all'" ng-class="{active: adminUsuarios.activo == 'all'}">Ver todos ({{adminUsuarios.registros.length}})</span> <span ng-click="adminUsuarios.activo = 1" ng-class="{active: adminUsuarios.activo == 1}">Ver activos ({{adminUsuarios.registrosActivos()}})</span> <span ng-click="adminUsuarios.activo = null" ng-class="{active: adminUsuarios.activo == null}">Ver inactivos ({{adminUsuarios.registrosInactivos()}})</span></div>

	</div>

	<div class="row">
		
		<div class="col s11 offset-s1 m10 offset-m1">
			<table class="table-admin">
				<thead>
					<tr>
						<th>Usuario <img ng-click="adminUsuarios.ordenPor = 'usuario'; adminUsuarios.ordenRevertido = !adminUsuarios.ordenRevertido" src="assets/images/icons/orden_lista.png"></th>
						<th>Teléfono <img ng-click="adminUsuarios.ordenPor = 'telefono'; adminUsuarios.ordenRevertido = !adminUsuarios.ordenRevertido" src="assets/images/icons/orden_lista.png"></th>
						<th>E-mail <img ng-click="adminUsuarios.ordenPor = 'email'; adminUsuarios.ordenRevertido = !adminUsuarios.ordenRevertido" src="assets/images/icons/orden_lista.png"></th>
						<th>Ubicación <img ng-click="adminUsuarios.ordenPor = 'ciudad'; adminUsuarios.ordenRevertido = !adminUsuarios.ordenRevertido" src="assets/images/icons/orden_lista.png"></th>
						<th>C.P <img ng-click="adminUsuarios.ordenPor = 'codigo_postal'; adminUsuarios.ordenRevertido = !adminUsuarios.ordenRevertido" src="assets/images/icons/orden_lista.png"></th>						
						<th>Mascota <img ng-click="adminUsuarios.ordenPor = 'nombre'; adminUsuarios.ordenRevertido = !adminUsuarios.ordenRevertido" src="assets/images/icons/orden_lista.png"></th>
						<th>ID <img ng-click="adminUsuarios.ordenPor = 'codigo'; adminUsuarios.ordenRevertido = !adminUsuarios.ordenRevertido" src="assets/images/icons/orden_lista.png"></th>
						<th>Modelos</th>
						<th>Especie <img ng-click="adminUsuarios.ordenPor = 'especie'; adminUsuarios.ordenRevertido = !adminUsuarios.ordenRevertido" src="assets/images/icons/orden_lista.png"></th>
						<th>Raza <img ng-click="adminUsuarios.ordenPor = 'raza'; adminUsuarios.ordenRevertido = !adminUsuarios.ordenRevertido" src="assets/images/icons/orden_lista.png"></th>
						<th>Fecha <img ng-click="adminUsuarios.ordenPor = 'fecha_nacimiento'; adminUsuarios.ordenRevertido = !adminUsuarios.ordenRevertido" src="assets/images/icons/orden_lista.png"></th>
					</tr>
				</thead>
				<tbody>

					<tr ng-repeat-start="registro in adminUsuarios.registros | filter:(adminUsuarios.activo === 'all' ? undefined : { activo: adminUsuarios.activo }) | orderBy:adminUsuarios.ordenPor:adminUsuarios.ordenRevertido">
						<td class="usuario" rowspan="{{registro.mascotas.length}}"> {{ registro.usuario }} </td>
						<td rowspan="{{registro.mascotas.length}}"> {{ registro.telefono }} </td>
						<td rowspan="{{registro.mascotas.length}}"> {{ registro.emailU }} </td>
						<td rowspan="{{registro.mascotas.length}}"> {{ registro.ciudad }}, {{ registro.provincia }}, {{registro.pais}} </td>
						<td rowspan="{{registro.mascotas.length}}"> {{ registro.codigo_postal }} </td>
						
						<td class="usuario"> {{ registro.mascotas[0].nombre }} </td>
						<td>
							<span ng-repeat-start="placas in registro.mascotas[0].placas"> {{placas.codigo}} </span> <br ng-repeat-end> 
						</td>
						<td style="text-align: center;"> 
							<img ng-repeat-start="placa in registro.mascotas[0].placas" src="assets/images/placas/{{placa.forma}}/{{placa.modelo}}" width="40"> <br ng-repeat-end> 
						</td>
						<td> {{registro.mascotas[0].especie}} </td>
						<td> {{registro.mascotas[0].raza}} </td>
						<td> {{registro.mascotas[0].fecha_nacimiento}} </td>						
					</tr>
					<tr ng-repeat-end ng-repeat="mascota in registro.mascotas.slice(1)">
						<td class="usuario"> {{ mascota.nombre }} </td>
						<td>
							<span ng-repeat-start="placas in mascota.placas"> {{placas.codigo}} </span> <br ng-repeat-end> 
						</td>
						<td style="text-align: center;">
							<img ng-repeat-start="placa in mascota.placas" src="assets/images/placas/{{placa.forma}}/{{placa.modelo}}" width="40"> <br ng-repeat-end>
						</td>
						<td> {{mascota.especie}} </td>
						<td> {{mascota.raza}} </td>
						<td> {{mascota.fecha_nacimiento}} </td>	
					</tr>

					<tr ng-if="!adminUsuarios.registros.length">
						<td colspan="11" style="text-align: center;"> No se encontraron resultados </td>
					</tr>


				</tbody>
			</table>
		</div>

	</div>

	<div class="row">
    	<div class="col s6 offset-s3 col m6 offset-m3 col l4 offset-l4 botones-formulario">
            <div class="row">
                <div class="col s11 offset-s1 m6 l6" style="margin-bottom: 10px;">
                    <button class="boton-neutro" ui-sref="perfil.miPerfil">Cancelar</button>
                </div>
                <div class="col s11 offset-s1 m6 l6">
                    <button class="boton-verde">EXPORTAR</button>
                </div>
            </div>
        </div>
	</div>

</section>