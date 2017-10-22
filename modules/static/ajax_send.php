<?php
	if (isset($_POST['message'])) {
		Message::send($_POST['message']);
	}
?>