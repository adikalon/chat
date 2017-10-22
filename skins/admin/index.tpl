<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title><?php echo hsc(Core::$META['title']); ?></title>
		<meta name="description" content="<?php echo hsc(Core::$META['description']); ?>">
		<meta name="keywords" content="<?php echo hsc(Core::$META['keywords']); ?>">
		<link href="/css/reset.css" rel="stylesheet" type="text/css">
		<?php if (count(Core::$CSS)) { echo implode("\n",Core::$CSS); } ?>
		<?php if (count(Core::$JS)) { echo implode("\n",Core::$JS); } ?>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	</head>
	
	<body>
		<header>
			<div>LOGO</div>
			<nav>
					<a href="/">Главная</a>
					<a href="/cabinet/reg">Регистрация</a>
					<a href="/?module=cabinet&page=auth">Вход</a>
					<a href="/?module=cabinet&page=exit">Выход</a>
			</nav>
		</header>
		<div id="content">
			<?php echo $content; ?>
		</div>
		<footer>Копирайты &copy; 2013</footer>
	</body>
</html>