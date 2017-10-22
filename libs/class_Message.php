<?php
	class Message {
		static $limit=25; // Сколько максимум последних сообщений выводится в окне чата
		static $doplim=10; // Сколько предпоследних сообщений выводится в окне чата
		static $max=100; // Сколько максимум последних сообщений сохраняется в БД
		static $legmes=1; // Минимум символов в сообщении
		static $ptmin='Сообщение не менее 1';
		static $legmesm=500; // Максимум символов в сообщении
		static $ptmax='Сообщение не более 500';
		static $message;
		static $mess;
		static $del;
		static $res;
		static $row;
		
		// Отправка сообщения
		public static function send($m) {
			$m = remes($m);
			// $m = '<i class="fa fa-commenting-o"></i> '.$m;
			if (mb_strlen(strip_tags($m, '<img>')) >= self::$legmes && mb_strlen(strip_tags($m, '<img>')) <= self::$legmesm) {
				dbq("INSERT INTO `messages` SET `login` = '".mres(Auth::login())."', `date` = ".Time::getTime().", `message` = '".mres($m)."'");
			}
		}
		
		// Ошибки
		/* public static function error($m) {
			$m = remes($m);
			$m = strip_tags($m, '<img>');
			$m = mb_strlen($m);
			if ($m < self::$legmes) {
				return self::$ptmin;
			}
			elseif ($m > self::$legmesm) {
				return self::$ptmax;
			}
		} */
		
		// Удаление сообщений при превышении максимума
		public static function actions() {
			self::$res = mysqli_num_rows(dbq("SELECT * FROM `messages`"));
			if (self::$res > self::$max) {
				self::$del = self::$res - self::$max;
				dbq("DELETE FROM `messages` LIMIT ".self::$del."");
			}
		}
		
		// Массив сообщений из БД
		public static function mess() {
			self::$res = dbq("SELECT * FROM (SELECT * FROM `messages` AS innerT ORDER BY `date` DESC LIMIT ".self::$limit.") AS outerT ORDER BY outerT.date ASC");
			while(self::$row = mysqli_fetch_assoc(self::$res)) {
				self::$mess[] = self::$row;
			}
			return self::$mess;
		}
		
		// Массив предыдущих сообщений из БД
		public static function premes() {
			if (isset($_COOKIE['premes'])) {
				self::$doplim = $_COOKIE['premes'];
			}
			self::$res = dbq("SELECT * FROM (SELECT * FROM `messages` AS innerT ORDER BY `date` DESC LIMIT ".self::$limit.",".self::$doplim.") AS outerT ORDER BY outerT.date ASC");
			while(self::$row = mysqli_fetch_assoc(self::$res)) {
				self::$mess[] = self::$row;
			}
			return self::$mess;
		}
		
		// Обновление кук для предыдущих сообщений
		public static function precook() {
			if (!isset($_COOKIE['premes'])) {
				setcookie('premes', self::$doplim+self::$doplim, Time::getTime()+Auth::$time, '/');
			}
			else {
				setcookie('premes', $_COOKIE['premes']+self::$doplim, Time::getTime()+Auth::$time, '/');
			}
		}
		
		// Удалять куки сколько последних сообщений показывать
		public static function premesdel() {
			if (isset($_COOKIE['premes'])) {
				setcookie('premes', $_COOKIE['premes'], Time::getTime()-10000, '/');
				unset ($_COOKIE['premes']);
			}
		}
		
		// Вернет true если нужна кнопка просмотра предыдущих сообщений и если не нужна - false
		public static function prebut() {
			if (!isset($_COOKIE['premes']) && Message::count() > Message::$limit || isset($_COOKIE['premes']) && $_COOKIE['premes']+Message::$limit <= Message::count()) {
				return true;
			}
			else {
				return false;
			}
		}
		
		// Количество сообщений
		public static function count() {
			return mysqli_num_rows(dbq("SELECT * FROM `messages`"));
		}
		
		// Время последнего сообщения
		public static function last() {
			if (mysqli_fetch_assoc(dbq("SELECT `date` FROM `messages` ORDER BY `date` DESC LIMIT 1"))['date']) {
				return mysqli_fetch_assoc(dbq("SELECT `date` FROM `messages` ORDER BY `date` DESC LIMIT 1"))['date'];
			}
			else {
				return false;
			}
		}
	}	