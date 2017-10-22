<?php
	if (!isset($_SESSION['last_msg']) || isset($_SESSION['last_msg']) && $_SESSION['last_msg'] != Message::last()) {
		$_SESSION['last_msg'] = Message::last();
		$val = true;
	}
	else {
		$val = false;
	}
?>