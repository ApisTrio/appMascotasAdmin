<section class="admin-usuarios">
	<div class="row">
		
		<div class="col s10 offset-s1 m10 offset-m1 titulo-admin">
			<p>Placas</p>
		</div>

	</div>

	<div class="row">
		
		<div class="col s10 offset-s1 m10 offset-m1 titulo-admin-2">
			<p>Estos son los codigos QR activos: </p>
		</div>

	</div>

	<div class="row">
		
		<div class="col s11 offset-s1 m6 offset-m6 filtros-tabla"><span ng-click="adminPlacas.seleccionado('all')" ng-class="{active: adminPlacas.seleccion == 'all'}">Ver todos ({{adminPlacas.placas.length}})</span> <span ng-click="adminPlacas.seleccionado('activas')" ng-class="{active: adminPlacas.seleccion == 'activas'}">Ver activas ({{adminPlacas.placasActivas()}})</span> <span ng-click="adminPlacas.seleccionado('inactivas')" ng-class="{active: adminPlacas.seleccion == 'inactivas'}">Ver inactivas ({{adminPlacas.placasInactivas()}})</span> <span ng-click="adminPlacas.seleccionado('eliminadas')" ng-class="{active: adminPlacas.seleccion == 'eliminadas'}">Ver eliminadas ({{adminPlacas.placasEliminadas()}})</span></div>

	</div>

	<div class="row">
		
		<div class="col s11 offset-s1 m10 offset-m1">
			<table class="table-admin" id="placas">
				<thead>
					<tr>
						<th>Codigo <img ng-click="adminPlacas.ordenPor = 'codigo'; adminPlacas.ordenRevertido = !adminPlacas.ordenRevertido" src="assets/images/icons/orden_lista.png"></th>
						<th ng-if="adminPlacas.seleccion != 'inactivas'">Modelo </th>
						<th ng-if="adminPlacas.seleccion != 'inactivas'">Forma <img ng-click="adminPlacas.ordenPor = 'forma'; adminPlacas.ordenRevertido = !adminPlacas.ordenRevertido" src="assets/images/icons/orden_lista.png"></th>
						<th ng-if="adminPlacas.seleccion == 'all'">Activa <img ng-click="adminPlacas.ordenPor = 'bloqueado'; adminPlacas.ordenRevertido = !adminPlacas.ordenRevertido" src="assets/images/icons/orden_lista.png"></th>
						<th ng-if="adminPlacas.seleccion == 'all' || adminPlacas.seleccion == 'eliminadas'">Borrado <img ng-click="adminPlacas.ordenPor = 'borrado'; adminPlacas.ordenRevertido = !adminPlacas.ordenRevertido" src="assets/images/icons/orden_lista.png"></th>
					</tr>
				</thead>
				<tbody>

					<tr ng-repeat="placa in placasFiltradas = (adminPlacas.placas | filter:(adminPlacas.activo === 'all' ? undefined : adminPlacas.activo ) ) | orderBy:adminPlacas.ordenPor:adminPlacas.ordenRevertido | limitTo: 10 : adminPlacas.saltoPlacas">
						<td class="usuario"> {{ placa.codigo }} </td>
						<td ng-if="adminPlacas.seleccion != 'inactivas'" style="text-align: center;"> <img ng-if="placa.modelo" src="assets/images/placas/{{placa.forma}}/{{placa.modelo}}" width="40"> <div ng-if="!placa.modelo">N/A</div> </td>
						<td ng-if="adminPlacas.seleccion != 'inactivas'"> {{ (placa.forma | uppercase) || "N/A" }} </td>
						<td  ng-if="adminPlacas.seleccion == 'all'"> <span ng-if="placa.bloqueado || placa.borrado"> NO </span> <span ng-if="!placa.bloqueado && !placa.borrado"> SI </span> </td>
						<td ng-if="adminPlacas.seleccion == 'all' || adminPlacas.seleccion == 'eliminadas'"> {{ placa.borrado || "N/A" }} </td>						
					</tr>

					<tr ng-if="!adminPlacas.placas.length">
						<td colspan="11" style="text-align: center;"> No se encontraron resultados </td>
					</tr>

				</tbody>
			</table>
		</div>

	</div>

	<div class="row">
		
		<div class="col s11 offset-s1 m10 offset-m1 flechas">
			<p class="flecha" id="izq" ng-click="adminPlacas.avanzar(adminPlacas.saltoPlacas, false, (placasFiltradas | limitTo: 10 : adminPlacas.saltoPlacas - 10).length)" ng-class="{'bloqueado': ((adminPlacas.saltoPlacas + 10 )/ 10) == 1}" style="cursor: pointer"><</p>
            
                
            <div ng-class="{'actual' : ((adminPlacas.saltoPlacas + 10 )/ 10) == 1}" ng-click="adminPlacas.saltoPlacas = 0" style="cursor: pointer;display:inline-block">1</div>
            
            <div style="display:inline-block;" ng-if="adminPlacas.mostrarSuspenso(((adminPlacas.saltoPlacas + 10 )/ 10), adminPlacas.rango(placasFiltradas.length), 'izquierda')">...</div>
            
            <div ng-repeat="pagina in adminPlacas.rango(placasFiltradas.length) | limitTo: adminPlacas.rango(placasFiltradas.length).length - 2 : 1 " style="display:inline-block; margin-left: 5px; margin-right: 5px; cursor: pointer;" ng-class="{'actual' : ((adminPlacas.saltoPlacas + 10 )/ 10) == pagina}" ng-if="adminPlacas.paginacion(((adminPlacas.saltoPlacas + 10 )/ 10), pagina)" ng-click="adminPlacas.saltoPlacas = (pagina * 10) - 10">{{pagina}}</div>
            
            <div style="display:inline-block;" ng-if="adminPlacas.mostrarSuspenso(((adminPlacas.saltoPlacas + 10 )/ 10), adminPlacas.rango(placasFiltradas.length), 'derecha')">...</div>
            
            <div style="cursor:pointer;display:inline-block" ng-class="{'actual': !(placasFiltradas | limitTo: 10 : adminPlacas.saltoPlacas + 10).length}" ng-click="adminPlacas.saltoPlacas = (adminPlacas.rango(placasFiltradas.length).length * 10) - 10"> {{adminPlacas.rango(placasFiltradas.length).length}}</div>    
                
            
            <p class="flecha" id="der" ng-click="adminPlacas.avanzar(adminPlacas.saltoPlacas, true, (placasFiltradas | limitTo: 10 : adminPlacas.saltoPlacas + 10).length)" ng-class="{'bloqueado': !(placasFiltradas | limitTo: 10 : adminPlacas.saltoPlacas + 10).length}" style="cursor: pointer">></p>
		</div>

	</div>
	

	<div class="row">
    	<div class="col s6 offset-s3 col m6 offset-m3 col l4 offset-l4 botones-formulario">
            <div class="row">
                <div class="col s11 offset-s1 m6 offset-m3 l6 offset-l3">
                    <button class="boton-verde" ng-class="{'bloqueado' : !adminPlacas.exportarFin }" ng-click="adminPlacas.exportar()">EXPORTAR</button>
                </div>
            </div>
        </div>
	</div>

</section>