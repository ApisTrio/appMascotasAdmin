<section>
	
    <div class="row contenedor-admin">

        <div class="col s1 m1 l1 lx1 menu no-padding">

        	<div class="contenedor-logo">
        		<div class="logo">
        			<a href="http://www.dinbeat.com/">
                        <img src="assets/images/logo/logo_dinbeat.svg">
                    </a>
        		</div>
        	</div>

            <div class="menu-item" ui-sref="admin.usuarios" ui-sref-opts="{reload: true}" class="margin-out">
                <div class="icono-menu">
                    <img ng-src="assets/images/menu-admin-iconos/usuarios.svg" >
                </div>
                <div class="label-menu">
                    Usuarios
                </div>
            </div>
            <div class="menu-item last" ui-sref="admin.generar" ui-sref-opts="{reload: true}">
                <div class="icono-menu">
                    <img  ng-src="assets/images/menu-admin-iconos/generar.svg">
                </div>
                <div class="label-menu" class="margin-out">
                    Generar placas
                </div>
            </div>

            <div class="menu-item-bottom" ui-sref="admin.salir" ui-sref-opts="{reload: true}">
                <div class="icono-menu">
                    <img  ng-src="assets/images/menu-admin-iconos/logout_selected.svg">
                </div>
            </div>

        </div><!--
        --><div  class="col s11 m11 l11 lx11 contenedor-admin-interno" id="contenedor-admin-interno" style="min-height: 100%;">
            
            <div ui-view>


            </div>
            
        </div>
    
    </div>

</section>