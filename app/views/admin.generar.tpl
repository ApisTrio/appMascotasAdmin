<section class="admin-usuarios">
	<div class="row">
		
		<div class="col s12 m10 offset-m1 titulo-admin">
			<p>Generar placas QR</p>
		</div>

	</div>
	<div class="row">
		<div class="col s12 m10 offset-m1 no-padding">

			<div class="col s3 m3 l3 no-padding">
                <div class="campo-formulario">N°</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': formPaso1.nombre.$pristine || formPaso1.nombre.$valid}">
                        <input ng-model="generar.numero" placeholder="N°" type="text" name="nombre" required>
                        <cdx-validez data-validez="generar.numero.$valid" data-mostrar="generar.numero.$dirty"></cdx-validez>
                    </div>

                    <div ng-messages="generar.numero.$error" ng-show="generar.numero.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                    </div>
                </div>
            </div>

			<div class="col s3 m3 l3 no-padding">
                <button class="boton-verde landing margin-top-30" ui-sref="login">GENERAR</button>
            </div>

		</div>
	</div>

	<div class="row">
		<div class="col s12 m10 offset-m1 no-padding">
			<div>
				<a href="#" style="color: black">Volver a descargar <img src="assets/images/icons/download.png" style="width: 16px;
    vertical-align: middle; margin-left: 10px"></a>
			</div>
		</div>
	</div>

	<div class="row no-margin">
		
		<div class="col s12 m10 offset-m1 titulo-admin-2">
			<p>GHistorial de Placas QR generadas</p>
		</div>

	</div>

	<div class="row">

		<div class="col s12 m4 offset-m1">
			<table class="table-admin">
				<thead>
					<tr>
						<th>Fecha <img src="assets/images/icons/orden_lista.png"></th>
						<th>Cantidad <img src="assets/images/icons/orden_lista.png"></th>
						<th>Descargar</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>12/04/17</td>
						<td>2300</td>
						<td style="text-align: center;">
							<a href="#">
								<img src="assets/images/icons/download.png" style="width: 16px; vertical-align: middle;">
							</a>								
						</td>
					</tr>
				</tbody>
			</table>
		</div>

	</div>
</section>