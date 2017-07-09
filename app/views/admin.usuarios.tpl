<section class="admin-usuarios">
	<div class="row">
		
		<div class="col s10 offset-s1 m10 offset-m1 titulo-admin">
			<p>Buscar</p>
		</div>

	</div>
	
	<div class="row">

		<div class="col s11 offset-s1 m2 offset-m1">
			<div class="campo-formulario-admin">ID:</div>
        	<div class="input-formulario-admin">
        		<div>
					<input ng-model="adminadmin.id" type="text" name="id" minlength="3" required>
				</div>
			</div>
		</div>

		<div class="col s11 offset-s1 m2">
			<div class="campo-formulario-admin">Especie:</div>
        	<div class="input-formulario-admin">
        		<div>
					<input ng-model="adminadmin.especie" type="text" name="nombre" minlength="3" required>
				</div>
			</div>
		</div>

		<div class="col s11 offset-s1 m2">
			<div class="campo-formulario-admin">Raza:</div>
        	<div class="input-formulario-admin">
        		<div>
					<input ng-model="adminadmin.raza" type="text" name="raza" minlength="3" required>
				</div>
			</div>
		</div>

		<div class="col s11 offset-s1 m2">
			<div class="campo-formulario-admin">Mascota:</div>
        	<div class="input-formulario-admin">
        		<div>
					<input ng-model="adminadmin.mascota" type="text" name="mascota" minlength="3" required>
				</div>
			</div>
		</div>

		<div class="col s11 offset-s1 m2">
			<div class="campo-formulario-admin">Usuario:</div>
        	<div class="input-formulario-admin">
        		<div>
					<input ng-model="adminadmin.usuario" type="text" name="usuario" minlength="3" required>
				</div>
			</div>
		</div>

	</div>		

	<div class="row">
		
		<div class="col s11 offset-s1 m2 offset-m1">
			<div class="campo-formulario-admin">Telefono:</div>
        	<div class="input-formulario-admin">
        		<div>
					<input ng-model="admin.telefono" type="text" name="telefono" minlength="3" required>
				</div>
			</div>
		</div>

		<div class="col s11 offset-s1 m2">
			<div class="campo-formulario-admin">E-mail:</div>
        	<div class="input-formulario-admin">
        		<div>
					<input ng-model="admin.email" type="text" name="email" minlength="3" required>
				</div>
			</div>
		</div>

		<div class="col s11 offset-s1 m2">
			<div class="campo-formulario-admin">Ciudad:</div>
        	<div class="input-formulario-admin">
        		<div>
					<input ng-model="admin.ciudad" type="text" name="ciudad" minlength="3" required>
				</div>
			</div>
		</div>


		<div class="col s11 offset-s1 m2">
			<div class="campo-formulario-admin">Ciudad / Provincia:</div>
        	<div class="input-formulario-admin">
        		<div>
					<input ng-model="admin.ciudad_provincia" type="text" name="ciudad_provincia" minlength="3" required>
				</div>
			</div>
		</div>

		<div class="col s11 offset-s1 m2">
			<div class="campo-formulario-admin">Perdido:</div>
        	<switch id="enabled" name="enabled" ng-model="enabled" class="white"></switch>
		</div>

	</div>

	<div class="row">
		
		<div class="col s11 offset-s1 m2 offset-m1">
			<div class="campo-formulario-admin">Código postal:</div>
        	<div class="input-formulario-admin">
        		<div>
					<input ng-model="admin.codigo_postal" type="text" name="codigo_postal" minlength="3" required>
				</div>
			</div>
		</div>

		<div class="col s11 offset-s1 m2">
			<div class="campo-formulario-admin">País:</div>
        	<div class="input-formulario-admin">
        		<div>
					<input ng-model="admin.pais" type="text" name="forma_placa" minlength="3" required>
				</div>
			</div>
		</div>

		<div class="col s11 offset-s1 m2">
			<div class="campo-formulario-admin">Forma placa:</div>
			<div style="padding-top: 5px;">
                <input ng-model="registro.terminos" type="radio" class="with-gap radio-green" id="forma_placa_redonda" name="forma_placa"/>
                <label for="forma_placa_redonda">Redonda</label>
                <input ng-model="registro.terminos" type="radio" class="with-gap radio-green" id="forma_placa_pajarito" name="forma_placa"/>
                <label for="forma_placa_pajarito">Pajarito</label>
            </div>
		</div>

		<div class="col s11 offset-s1 m2">
			<div class="campo-formulario-admin">Diseño:</div>
        	<div class="input-formulario-admin">
        		<div>
					<input ng-model="admin.diseno" type="text" name="diseno" minlength="3" required>
				</div>
			</div>
		</div>

		<div class="col s11 offset-s1 m2 margin-top-30">
			<button class="boton-verde" ng-click="admin.buscar()">BUSCAR</button>
		</div>



	</div>

	<div class="row">
		
		<div class="col s10 offset-s1 m10 offset-m1 titulo-admin-2">
			<p>Estos son los codigos QR activos: </p>
		</div>

	</div>

	<div class="row">
		
		<div class="col s11 offset-s1 m5 offset-m7 filtros-tabla"><span class="active">Ver todos (1230)</span> <span>Ver activos (1000)</span> <span>Ver inactivos (230)</span></div>

	</div>

	<div class="row">
		
		<div class="col s11 offset-s1 m10 offset-m1">
			<table class="table-admin">
				<thead>
					<tr>
						<th>Usuario <img src="assets/images/icons/orden_lista.png"></th>
						<th>Teléfono <img src="assets/images/icons/orden_lista.png"></th>
						<th>E-mail <img src="assets/images/icons/orden_lista.png"></th>
						<th>Ubicación <img src="assets/images/icons/orden_lista.png"></th>
						<th>C.P <img src="assets/images/icons/orden_lista.png"></th>						
						<th>Mascota <img src="assets/images/icons/orden_lista.png"></th>
						<th>ID <img src="assets/images/icons/orden_lista.png"></th>
						<th>Modelos <img src="assets/images/icons/orden_lista.png"></th>
						<th>Especie <img src="assets/images/icons/orden_lista.png"></th>
						<th>Raza <img src="assets/images/icons/orden_lista.png"></th>
						<th>Fecha <img src="assets/images/icons/orden_lista.png"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="usuario" rowspan="2"> Daniel Torres</td>
						<td rowspan="2">54326789</td>
						<td rowspan="2">danieljtorres94@gmail.com</td>
						<td rowspan="2">Ronda, Malaga, España</td>
						<td rowspan="2">08907</td>
						<td class="usuario">Duke</td>
						<td>
							123456 <br> 654321
						</td>
						<td>Modelos</td>
						<td>Perro</td>
						<td>Mestizo de Braco Aleman</td>
						<td>03 Jul 2017</td>
					</tr>
					<tr>
						<td class="usuario">Duke</td>
						<td>
							123456 <br> 654321
						</td>
						<td>Modelos</td>
						<td>Perro</td>
						<td>Mestizo de Braco Aleman</td>
						<td>03 Jul 2017</td>
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