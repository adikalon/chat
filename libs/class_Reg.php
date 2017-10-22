<?php
	class Reg {
		static $leglog=3;
		static $ltmin='<i class="fa fa-times red"></i> Не менее 3 символов';
		static $legpas=5;
		static $ptmin='<i class="fa fa-times red"></i> Не менее 5 символов';
		static $leglogm=15;
		static $ltmax='<i class="fa fa-times red"></i> Не более 15 символов';
		static $legpasm=20;
		static $ptmax='<i class="fa fa-times red"></i> Не более 20 символов';
		static $lreg='/^[a-z0-9_-]+$/i';
		static $ltreg='<i class="fa fa-times red"></i> Только латинские буквы и цифры';
		static $preg='/[^\s]+?/iu';
		static $ptreg='<i class="fa fa-times red"></i> Пробел запрещен';
		static $ltsea='<i class="fa fa-times red"></i> Этот логин занят';
		static $success='<i class="fa fa-check green"></i> Регистрация прошла успешно';
		static $login;
		static $clogin;
		static $pass;
		static $cpass;
		
		// Заносим пользователя в БД
		public static function send($log,$pas) {
			self::$login = trim($log);
			self::$pass = trim($pas);
			if (mb_strlen(self::$login) >= self::$leglog && mb_strlen(self::$login) <= self::$leglogm && mb_strlen(self::$pass) >= self::$legpas && mb_strlen(self::$pass) <= self::$legpasm && preg_match(self::$lreg, self::$login) && preg_match(self::$preg, self::$pass) && !mysqli_num_rows(dbq("SELECT `login` FROM `users` WHERE `login` = '".mres(self::$login)."' LIMIT 1"))) {
				dbq("INSERT INTO `users` SET `login` = '".mres(self::$login)."', `pass` = '".myHash(mres(self::$pass))."', `rights` = 0, `date` = ".Time::getTime().", `key_enter` = 0");
				$_SESSION['info'] = self::$success;
				header('Location: /cabinet/auth');
				exit();
			}
		}
		
		// Ошибки логина
		public static function errorl($log) {
			self::$login = trim($log);
			self::$clogin = mb_strlen(self::$login);
			if (self::$clogin < self::$leglog) {
				return self::$ltmin;
			}
			elseif (self::$clogin > self::$leglogm) {
				return self::$ltmax;
			}
			elseif (!preg_match(self::$lreg, self::$login)) {
				return self::$ltreg;
			}
			elseif (mysqli_num_rows(dbq("SELECT `login` FROM `users` WHERE `login` = '".mres(self::$login)."' LIMIT 1"))) {
				return self::$ltsea;
			}
			else {
				return '<i class="fa fa-check green"></i> Верно';
			}
		}
		
		// Ошибки пароля
		public static function errorp($pas) {
			self::$pass = trim($pas);
			self::$cpass = mb_strlen(self::$pass);
			if (self::$cpass < self::$legpas) {
				return self::$ptmin;
			}
			elseif (self::$cpass > self::$legpasm) {
				return self::$ptmax;
			}
			elseif (!preg_match(self::$preg, self::$pass)) {
				return self::$ptreg;
			}
			else {
				return '<i class="fa fa-check green"></i> Верно';
			}
		}
		
		// Сообщение удачной регистрации
/* 		public static function success($log,$pas) {
			self::$login = trim($log);
			self::$pass = trim($pas);
			if (mb_strlen(self::$login) >= self::$leglog && mb_strlen(self::$login) <= self::$leglogm && mb_strlen(self::$pass) >= self::$legpas && mb_strlen(self::$pass) <= self::$legpasm && preg_match(self::$lreg, self::$login) && preg_match(self::$preg, self::$pass) && !mysqli_num_rows(dbq("SELECT `login` FROM `users` WHERE `login` = '".mres(self::$login)."' LIMIT 1"))) {
				return self::$success;
			}
		} */
	}	