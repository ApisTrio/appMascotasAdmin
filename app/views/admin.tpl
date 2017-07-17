<section>

    <div class="menu-item-bottom" ng-click="admin.salir()">
        <div class="icono-menu">
            <img  ng-src="assets/images/menu-admin-iconos/logout_selected.svg">
        </div>
    </div>
	
    <div class="row contenedor-admin">

        <div class="col s2 m1 l1 lx1 menu no-padding">

        	<div class="contenedor-logo">
        		<div class="logo">
        			<a href="http://www.dinbeat.com/">
                        <img src="assets/images/logo/logo_dinbeat.svg">
                    </a>
        		</div>
        	</div>

            <div class="menu-item" ui-sref="admin.usuarios" ui-sref-opts="{reload: true}" class="margin-out">
                <div class="icono-menu">
                    <img ng-src="{{ iconoUsuarios }}" ng-mouseover="iconoUsuarios = iconosUsuarios[1]" ng-mouseleave="iconoUsuarios = cambiarIcono(seleccionado, 1, iconosUsuarios)">
                </div>
                <div class="label-menu" ng-class="{'selected-menu-item' : seleccionado == 1}">
                    Usuarios
                </div>
            </div>
            <div class="menu-item" ui-sref="admin.generar" ui-sref-opts="{reload: true}">
                <div class="icono-menu">
                    <img ng-src="{{ iconoGenerar }}" ng-mouseover="iconoGenerar = iconosGenerar[1]" ng-mouseleave="iconoGenerar = cambiarIcono(seleccionado, 2, iconosGenerar)">
                </div>
                <div class="label-menu" ng-class="{'selected-menu-item' : seleccionado == 2}">
                    Generar placas
                </div>
            </div>

            <div class="menu-item last" ui-sref="admin.placas" ui-sref-opts="{reload: true}">
                <div class="icono-menu">
                    <img ng-src="{{ iconoPlacas }}" ng-mouseover="iconoPlacas = iconosPlacas[1]" ng-mouseleave="iconoPlacas = cambiarIcono(seleccionado, 3, iconosPlacas)">
                </div>
                <div class="label-menu" ng-class="{'selected-menu-item' : seleccionado == 3}">
                    Placas
                </div>
            </div>


        </div><!--
        --><div  class="col s10 m11 l11 lx11 contenedor-admin-interno" id="contenedor-admin-interno" style="min-height: 100%; padding: 0">
            
            <div ui-view>


            </div>
            
        </div>
    
    </div>

</section>