<?php
	Online::$login=Auth::login();
	Online::$time=Time::getTime();
	Online::actions();
	
	if (!isset($_SESSION['last_user']) || isset($_SESSION['last_user']) && $_SESSION['last_user'] != Online::lastUsersDate()) {
		$_SESSION['last_user'] = Online::lastUsersDate();
		$val = true;
	}
	else {
		$val = false;
	}
?>