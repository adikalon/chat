<?php
	if (Key::check()) {
		Key::off();
		$val = true;
	}
	else {
		Key::on();
		$val = false;
	}
?>