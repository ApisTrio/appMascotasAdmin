<section class="admin-usuarios">
	<div class="row">
		
		<div class="col s12 m10 offset-m1 titulo-admin">
			<p>Generar placas QR</p>
		</div>

	</div>
	<div class="row">
		<div class="col s12 m10 offset-m1 no-padding" ng-form="generarForm">

			<div class="col s3 m3 l3 no-padding">
                <div class="campo-formulario">N°</div>
                <div class="input-formulario">
                    <div ng-class="{'margin-bottom-30': generarForm.numero.$pristine || generarForm.numero.$valid}">
                        <input ng-model="adminGenerar.numero" ng-class="{'valido': generarForm.numero.$valid, 'erroneo': (!generarForm.numero.$valid && generarForm.numero.$dirty)}" placeholder="N°" type="text" name="numero" ng-pattern="/^[0-9]*$/" required>
                        <cdx-validez data-validez="generarForm.numero.$valid" data-mostrar="generarForm.numero.$dirty"></cdx-validez>
                    </div>

                    <div ng-messages="generarForm.numero.$error" ng-show="generarForm.numero.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                        <div ng-message="pattern">Solo se aceptan digitos.</div>
                    </div>
                </div>
            </div>

			<div class="col s3 m3 l3 no-padding">
                <button class="boton-verde landing margin-top-30" ng-class="{'bloqueado' : !generarForm.$valid }" ng-click="adminGenerar.generar(adminGenerar.numero, generarForm.$valid)">GENERAR</button>
            </div>
            
            <div class="col s3 m3 l3 no-padding">
                <div ng-show="adminGenerar.pasos">
                    <img src="assets/images/forms/check.png"> Se han generado {{adminGenerar.ultimaDescarga}} Placas QR correctamente, la descarga iniciará automáticamente.
                </div>
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