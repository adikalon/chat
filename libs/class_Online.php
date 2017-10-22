<?php
	class Online {
		static $on_time=1; // Через сколько минут удалять юзера из онлайн, если неактивен
		static $login=0; // Логин заносимый в БД
		static $time=0; // Текущее время
		static $user;
		static $users;
		static $last;
		static $result;
		static $res;
		static $row;
		
		// Обновление списка юзеров онлайн
		public static function actions() {
			if (self::$login) {
				if (!self::$time) {
					self::$time=time();
				}
				self::$last=self::$time+self::$on_time*60;
				self::$result=dbq("SELECT last FROM online WHERE login='".self::$login."'");
				if (mysqli_num_rows(self::$result)>0) {
					dbq("UPDATE online SET last=".self::$last." WHERE login='".self::$login."' LIMIT 1");
					} else {
					dbq("INSERT INTO online (login,last,date) VALUES ('".self::$login."',".self::$last.",".self::$time.")");
					$mes = '<span class="info_message"><i class="fa fa-angle-double-right"></i> Присоединился</span>';
					dbq("INSERT INTO `messages` SET `login` = '".self::$login."', `date` = ".Time::getTime().", `message` = '".$mes."'");
				}
			}
			self::$res = dbq('SELECT login FROM online WHERE last<'.self::$time.' LIMIT 1');
			if (mysqli_num_rows(self::$res)>0) {
				self::$user = mysqli_fetch_assoc(self::$res);
				$mes = '<span class="info_message"><i class="fa fa-angle-double-left"></i> Покинул чат</span>';
				dbq("INSERT INTO `messages` SET `login` = '".self::$user['login']."', `date` = ".Time::getTime().", `message` = '".$mes."'");
				dbq("DELETE FROM online WHERE login ='".self::$user['login']."'");
			}
		}
		
		// Массив онлайн юзеров из БД
		public static function users() {
			self::$res = dbq('SELECT login FROM online ORDER BY login');
			while(self::$row = mysqli_fetch_assoc(self::$res)) {
				self::$users[] = self::$row['login'];
			}
			return self::$users;
		}
		
		// Количество юзеров онлайн
		public static function count() {
			return mysqli_num_rows(dbq('SELECT login FROM online ORDER BY login LIMIT 1'));
		}
		
		// Код состоящий из наименьше и наибольшего времени юзера онлайн
		public static function lastUsersDate() {
			return mysqli_fetch_assoc(dbq("SELECT `date` FROM `online` ORDER BY `date` ASC LIMIT 1"))['date'].mysqli_fetch_assoc(dbq("SELECT `date` FROM `online` ORDER BY `date` DESC LIMIT 1"))['date'];
		}
	}	