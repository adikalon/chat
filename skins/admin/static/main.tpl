<?php 
	if (!isset($_SESSION['user']) || $_SESSION['user']['rights'] != 5) {
		include './skins/default/cabinet/auth.tpl';
	}
?>