<?php
	class Auth {
		static $time=5000; // На сколько хранить куки запоминания пользователя
		static $error='<i class="fa fa-times red"></i> Логин или пароль введен не верно';
		static $res;
		static $cookie;
		static $cook;
		static $login;
		static $pass;
		static $hash;
		
		// Авторизация
		public static function input($log,$pas,$aut=0) {
			self::$login = trim($log);
			self::$pass = trim($pas);
			self::$res = dbq("SELECT * FROM `users` WHERE `login` = '".mres(self::$login)."' AND `pass` = '".myHash(mres(self::$pass))."' LIMIT 1");
			if (mysqli_num_rows(self::$res)) {
				$_SESSION['user'] = mysqli_fetch_assoc(self::$res);
				// dbq("INSERT INTO `messages` SET `login` = '".mres($_SESSION['user']['login'])."', `date` = ".Time::getTime().", `message` = 'Присоединился'");
				if ($aut) {
					self::$hash = myHash(rand(1000000000, 9999999999));
					dbq("UPDATE `users` SET `hash` = '".mres(self::$hash)."' WHERE `id` = ".(int)$_SESSION['user']['id']."");
					setcookie('id', (int)$_SESSION['user']['id'], Time::getTime()+self::$time, '/');
					setcookie('hash', mres(self::$hash), Time::getTime()+self::$time, '/');
				}
				header('Location: /');
				exit();
			}
			else {
				$_SESSION['info'] = self::$error;
			}
		}
		
		// Ошибка
		public static function error($log,$pas) {
			self::$login = trim($log);
			self::$pass = trim($pas);
			self::$res = dbq("SELECT * FROM `users` WHERE `login` = '".mres(self::$login)."' AND `pass` = '".myHash(mres(self::$pass))."' LIMIT 1");
			if (!mysqli_num_rows(self::$res)) {
				return self::$error;
			}
		}
		
		// Обновление сессии из БД и проверка кук
		public static function reSession() {
			if (isset($_SESSION['user'])) {
				self::$res = dbq("SELECT * FROM `users` WHERE `id` = ".$_SESSION['user']['id']." LIMIT 1");
				$_SESSION['user'] = mysqli_fetch_assoc(self::$res);
			}
			else {
				if (isset($_COOKIE['hash'], $_COOKIE['id'])) {
					self::$cookie = dbq("SELECT `hash` FROM `users` WHERE `id` = ".$_COOKIE['id']." LIMIT 1");
					if (mysqli_num_rows(self::$cookie)) {
						self::$cook = mysqli_fetch_assoc(self::$cookie);
						if (self::$cook['hash'] == $_COOKIE['hash']) {
							self::$res = dbq("SELECT * FROM `users` WHERE `id` = ".$_COOKIE['id']." LIMIT 1");
							$_SESSION['user'] = mysqli_fetch_assoc(self::$res);
						}
						else {
							//можно добавить удаление хеша из БД
							setcookie('hash', $_COOKIE['hash'], Time::getTime()-10000, '/');
							setcookie('id', $_COOKIE['id'], Time::getTime()-10000, '/');
							unset ($_COOKIE ['hash']);
							unset ($_COOKIE ['id']);
						}
					}
					else {
						setcookie('hash', $_COOKIE['hash'], Time::getTime()-10000, '/');
						setcookie('id', $_COOKIE['id'], Time::getTime()-10000, '/');
						unset ($_COOKIE ['hash']);
						unset ($_COOKIE ['id']);
					}
				}
			}
		}
		
		// Авторизирован или нет
		public static function online() {
			if (isset($_SESSION['user'])) {
				return true;
			}
			else {
				return false;
			}
		}
		
		// Если авторизирован возвращает логин, если нет - false
		public static function login() {
			if (isset($_SESSION['user'])) {
				return $_SESSION['user']['login'];
			}
			else {
				return false;
			}
		}
		
		// Если оналйн кидаем на главную
		public static function main() {
			if (isset($_SESSION['user'])) {
				header('Location: /');
				exit();
			}
		}
	}