<section class="login">
	
	<div class="container">
		
		<div class="row">
			
			<div class="col s12 m10 offset-m1 l6 offset-l3 center-align iniciar-sesion" ng-form="loginForm">
				<p class="titulo-inicios">INICIAR SESIÓN</p>
				<div class="col s10 offset-s1">
					<input ng-model="loginAdmin.usuario.usuario" type="text" name="usuario" placeholder="Usuario" ng-class="{'margin-bottom-30': ((loginForm.usuario.$pristine && !loginForm.$submitted) || (loginForm.usuario.usuario.$valid)),'error': loginAdmin.error}" required>
                    <div ng-messages="loginForm.usuario.$error" ng-show="loginForm.$submitted || loginForm.usuario.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                    </div>
				</div>
				<div class="col s10 offset-s1">
					<input ng-model="loginAdmin.usuario.pass" type="password" name="pass" placeholder="Contraseña" ng-class="{'margin-bottom-30': ((loginForm.pass.$pristine && !loginForm.$submitted) || (loginForm.pass.$valid)), 'error': loginAdmin.error}" required>
                    <div ng-messages="loginForm.pass.$error" ng-show="loginForm.$submitted || loginForm.pass.$dirty">
                        <div ng-message="required">Este campo es requerido.</div>
                    </div>
				</div>
				
				<button class="boton-verde margin-out landing" type="submit" ng-click="loginAdmin.iniciarSesion(loginAdmin.usuario, loginForm.$valid)" >ACCEDER</button>
			</div>

		</div>

	</div>

</section>