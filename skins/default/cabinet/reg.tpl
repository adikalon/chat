<div class="reg_page">
	
	<div class="reg_info_pole">
		<div class="reg_text_top">Иформация</div>
		<div class="reg_text_down">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</div>
	</div>
	
	<div class="reg_input_pole">
		<div class="reg_text_top">Регистрация</div>
		<div class="reg_text_down">Придумайте себе логин и пароль</div>
		<form action="" method="post">
			<div class="login_block">
				<div id="<?php echo (isset($_POST['login'])) ? 'reg_login_relative_php' : 'reg_login_relative'; ?>">
					<div class="reg_login_rotate"></div>
					<div id="reg_login_warning">
						<?php echo Reg::errorl($_POST['login']); ?>
					</div>
				</div>
				<input type="text" name="login" id="reg_login" placeholder="Логин" oninput="warn()" value="<?php echo (isset($_POST['login'])) ? $_POST['login'] : ''; ?>">
			</div>
			<div class="pass_block">
				<div id="<?php echo (isset($_POST['pass'])) ? 'reg_pass_relative_php' : 'reg_pass_relative'; ?>">
					<div class="reg_pass_rotate"></div>
					<div id="reg_pass_warning">
						<?php echo Reg::errorp($_POST['pass']); ?>
					</div>
				</div>
				<input type="password" name="pass" id="reg_pass" placeholder="Пароль" oninput="warn()" value="<?php echo (isset($_POST['pass'])) ? $_POST['pass'] : ''; ?>">
			</div>
			<input type="submit" name="ok" id="reg_button" value="Регистрация" class="reg_button_off" disabled>
		</form>
	</div>
</div>