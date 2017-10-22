<?php
	Auth::main();
	
	if (isset($_POST['login'],$_POST['pass'])) {
		if (isset($_POST['auto'])) {
			Auth::input($_POST['login'],$_POST['pass'],$_POST['auto']);
		}
		else {
			Auth::input($_POST['login'],$_POST['pass']);
		}
	}
	
	header('Location: /');
	exit();
?>