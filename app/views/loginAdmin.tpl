<section class="login">
	
	<div class="container">
		
		<div class="row">
			
			<div class="col s12 m10 offset-m1 l6 offset-l3 center-align iniciar-sesion" ng-form="loginForm">
				<p class="titulo-inicios">INICIAR SESIÓN</p>
				<div class="col s10 offset-s1">
					<input ng-model="loginAdmin.usuario.usuario" type="text" name="usuario" placeholder="Usuario" ng-class="{'margin-bottom-30': ((loginForm.usuario.$pristine && !loginForm.$submitted) || (loginForm.usuario.$valid)),'error': loginAdmin.error}" required>
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
				<div class="col s10 offset-s1 text-left">
					<input type="checkbox" class="filled-in" id="recuerdame" name="recuerdame" />
					<label class="label" for="recuerdame">Recuérdame</label>
				</div>
				<button class="boton-verde margin-out landing" type="submit" ng-click="loginAdmin.iniciarSesion(loginAdmin.usuario, loginForm.$valid)" >ACCEDER</button>
				<p class="pointer" style="color: #afb2b6;" ui-sref="cambiarContrasena">¿Has olvidado tu contraseña?</p>
				<p class="pointer" style="color: #afb2b6;" ui-sref="recordarUsuario">¿Has olvidado tu usuario?</p>
			</div>

		</div>

	</div>

</section>