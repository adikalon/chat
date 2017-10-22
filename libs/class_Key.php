<?php
	class Key {
		
		// Проверить включена ли отправка по Enter
		public static function check() {
			return mysqli_fetch_assoc(dbq("SELECT `key_enter` FROM `users` WHERE `login` = '".Auth::login()."' LIMIT 1"))['key_enter'];
		}
		
		// Включить отправку по Enter
		public static function on() {
			dbq("UPDATE `users` SET `key_enter` = 1 WHERE `login` = '".Auth::login()."'");
		}
		
		// Отключить отправку по Enter
		public static function off() {
			dbq("UPDATE `users` SET `key_enter` = 0 WHERE `login` = '".Auth::login()."'");
		}
	}	