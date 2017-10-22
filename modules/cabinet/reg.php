<?php
	Auth::main();
	Core::$META['title'] = 'Регистрация';
	Core::$CSS[] = '<link href="/skins/'.Core::$SKIN.'/css/reg.css" rel="stylesheet">';
	Core::$JS[] = '<script src="/skins/'.Core::$SKIN.'/js/reg.js"></script>';
?>

<script>
	var leglog = <?php echo Reg::$leglog; ?>;
	var leglogm = <?php echo Reg::$leglogm; ?>;
	var legpas = <?php echo Reg::$legpas; ?>;
	var legpasm = <?php echo Reg::$legpasm; ?>;
</script>

<?php
	if (isset($_POST['login'],$_POST['pass'])) {
		Reg::send($_POST['login'],$_POST['pass']);
	}
?>