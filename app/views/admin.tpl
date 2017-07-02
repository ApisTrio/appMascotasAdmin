<section class="admin">
	<div ng-form="filtro">

		<div class="row">
			
			<div class="col s10 offset-s1 m10 offset-m1 titulo-admin">
				<p>Bienvenido admin</p>
			</div>

		</div>

		<div class="row">

			<div class="col s12 m2 offset-m1">
				<div class="campo-formulario-admin">ID:</div>
            	<div class="input-formulario-admin">
            		<div>
						<input ng-model="adminadmin.id" type="text" name="id" minlength="3" required>
					</div>
				</div>
			</div>

			<div class="col s12 m2">
				<div class="campo-formulario-admin">Especie:</div>
            	<div class="input-formulario-admin">
            		<div>
						<input ng-model="adminadmin.especie" type="text" name="nombre" minlength="3" required>
					</div>
				</div>
			</div>

			<div class="col s12 m2">
				<div class="campo-formulario-admin">Raza:</div>
            	<div class="input-formulario-admin">
            		<div>
						<input ng-model="adminadmin.raza" type="text" name="raza" minlength="3" required>
					</div>
				</div>
			</div>

			<div class="col s12 m2">
				<div class="campo-formulario-admin">Mascota:</div>
            	<div class="input-formulario-admin">
            		<div>
						<input ng-model="adminadmin.mascota" type="text" name="mascota" minlength="3" required>
					</div>
				</div>
			</div>

			<div class="col s12 m2">
				<div class="campo-formulario-admin">Usuario:</div>
            	<div class="input-formulario-admin">
            		<div>
						<input ng-model="adminadmin.usuario" type="text" name="usuario" minlength="3" required>
					</div>
				</div>
			</div>

		</div>		

		<div class="row">
			
			<div class="col s12 m2 offset-m1">
				<div class="campo-formulario-admin">Telefono:</div>
            	<div class="input-formulario-admin">
            		<div>
						<input ng-model="admin.telefono" type="text" name="telefono" minlength="3" required>
					</div>
				</div>
			</div>

			<div class="col s12 m2">
				<div class="campo-formulario-admin">E-mail:</div>
            	<div class="input-formulario-admin">
            		<div>
						<input ng-model="admin.email" type="text" name="email" minlength="3" required>
					</div>
				</div>
			</div>

			<div class="col s12 m2">
				<div class="campo-formulario-admin">Ciudad:</div>
            	<div class="input-formulario-admin">
            		<div>
						<input ng-model="admin.ciudad" type="text" name="ciudad" minlength="3" required>
					</div>
				</div>
			</div>


			<div class="col s12 m2">
				<div class="campo-formulario-admin">Ciudad / Provincia:</div>
            	<div class="input-formulario-admin">
            		<div>
						<input ng-model="admin.ciudad_provincia" type="text" name="ciudad_provincia" minlength="3" required>
					</div>
				</div>
			</div>

			<div class="col s12 m2">
				<div class="campo-formulario-admin">Perdido:</div>
            	<switch id="enabled" name="enabled" ng-model="enabled" class="white"></switch>
			</div>

		</div>

		<div class="row">
			
			<div class="col s12 m2 offset-m1">
				<div class="campo-formulario-admin">Código postal:</div>
            	<div class="input-formulario-admin">
            		<div>
						<input ng-model="admin.codigo_postal" type="text" name="codigo_postal" minlength="3" required>
					</div>
				</div>
			</div>

			<div class="col s12 m2">
				<div class="campo-formulario-admin">País:</div>
            	<div class="input-formulario-admin">
            		<div>
						<input ng-model="admin.pais" type="text" name="forma_placa" minlength="3" required>
					</div>
				</div>
			</div>

			<div class="col s12 m2">
				<div class="campo-formulario-admin">Forma placa:</div>
				<div style="padding-top: 5px;">
	                <input ng-model="registro.terminos" type="radio" class="with-gap radio-green" id="forma_placa_redonda" name="forma_placa"/>
	                <label for="forma_placa_redonda">Redonda</label>
	                <input ng-model="registro.terminos" type="radio" class="with-gap radio-green" id="forma_placa_pajarito" name="forma_placa"/>
	                <label for="forma_placa_pajarito">Pajarito</label>
                </div>
			</div>

			<div class="col s12 m2">
				<div class="campo-formulario-admin">Diseño:</div>
            	<div class="input-formulario-admin">
            		<div>
						<input ng-model="admin.diseno" type="text" name="diseno" minlength="3" required>
					</div>
				</div>
			</div>

			<div class="col s12 m2">
				<button class="boton-verde" ng-click="admin.buscar()">BUSCAR</button>
			</div>



		</div>

		<div class="row">
			
			<div class="col s10 offset-s1 m10 offset-m1 titulo-admin-2">
				<p>Estos son los codigos QR activos: </p>
			</div>

		</div>

		<div class="row">
			
			<div class="col s12 m4 offset-m7 filtros-tabla"><span class="active">Ver todos (1230)</span> <span>Ver activos (1000)</span> <span>Ver inactivos (230)</span></div>

		</div>

		<div class="row">
			
			<div class="col s12 m10 offset-m1">
				<table class="table-admin">
					<thead>
						<tr>
							<th>Usuario</th>
							<th>Mascota</th>
							<th>ID</th>
							<th>Especie</th>
							<th>Raza</th>
							<th>Teléfono</th>
							<th>E-mail</th>
							<th>Ubicación</th>
							<th>C.P</th>
							<th>Fecha</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="usuario"> Daniel Torres</td>
							<td>Duke</td>
							<td>
								123456 <br> 654321
							</td>
							<td>Perro</td>
							<td>Mestizo de Braco Aleman</td>
							<td>54326789</td>
							<td>danieljtorres94@gmail.com</td>
							<td>Ronda, Malaga, España</td>
							<td>08907</td>
							<td>03 Jul 2017</td>
							<td>lapicito</td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>


	</div>
</section>