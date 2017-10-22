<?php
	$slog = dbq("SELECT `login` FROM `users` WHERE `login` = '".$_GET['login']."' LIMIT 1");
?>