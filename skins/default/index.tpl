<!DOCTYPE html>
<html lang="ru">
	<head>
		<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="<?php echo hsc(Core::$META['description']); ?>">
		<meta name="keywords" content="<?php echo hsc(Core::$META['keywords']); ?>">
		<title>#Chat: <?php echo hsc(Core::$META['title']); ?></title>
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
    <link href="/skins/<?php echo Core::$SKIN; ?>/css/bootstrap.css" rel="stylesheet">
		<link href="/skins/<?php echo Core::$SKIN; ?>/css/font-awesome.css" rel="stylesheet">
    <link href="/skins/<?php echo Core::$SKIN; ?>/css/style.css" rel="stylesheet">
    <link href="/skins/<?php echo Core::$SKIN; ?>/css/header.css" rel="stylesheet">
		<?php if (count(Core::$CSS)) { echo implode("\n",Core::$CSS); } ?>
	</head>
	
	<body>
		<header>
			<a href="/"><i class="fa fa-globe logo"></i><span class="logo_text"> #chat</span></a>
			<nav>
				<!-- <a href="/">#</a><br> -->
				<?php if (!Auth::online()) { ?>
					<form action="/cabinet/auth" method="post">
						<input type="text" name="login" id="login" oninput="but()" placeholder="Логин">
						<label class="remember"><input type="checkbox" name="auto" value="auto"> Запомнить?</label>
						<input type="submit" name="ok" id="ok" value="Войти" disabled><br>
						<input type="password" name="pass" id="pass" oninput="but()" placeholder="Пароль">
						<span class="or_text">или</span>
					</form>
					<a href="/cabinet/reg" class="reg_button">Зарегистрироваться</a>
					<?php } else { ?>
					<div class="auth_pole"><span class="or_text">Вы вошли как </span><?php echo '<span>'.Auth::login().'</span>'; ?> <a href="/cabinet/exit" class="reg_button">Выход</a></div>
				<?php } ?>
			</nav>
			
			<?php if (isset($_SESSION['info'])) { ?>
			<div class="error_relative">
				<div class="header_rotate"></div>
				<div class="error_block">
				<?php echo $_SESSION['info']; unset($_SESSION['info']); ?>
				</div>
			</div>
			<?php } ?>
			
			
		</header>
		<div id="content">
			<?php echo $content; ?>
		</div>
		<footer>
			&copy; Copyright 2015. All Rights Reserved
		</footer>
		<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
		<script src="/skins/<?php echo Core::$SKIN; ?>/js/auth.js"></script>
		<?php if (count(Core::$JS)) { echo implode("\n",Core::$JS); } ?>
	</body>
</html>