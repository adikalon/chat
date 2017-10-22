<?php
	Core::$META['title'] = 'Главная';
	Core::$CSS[] = '<link href="/skins/'.Core::$SKIN.'/css/main.css" rel="stylesheet">';
	Core::$JS[] = '<script src="/skins/'.Core::$SKIN.'/js/mes.js"></script>';
	Message::premesdel();
?>

<script>
	var legmes = <?php echo Message::$legmes; ?>;
	var legmesm = <?php echo Message::$legmesm; ?>;
	var skin = '<?php echo Core::$SKIN; ?>';
</script>