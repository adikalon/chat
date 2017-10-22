<?php
	if (Auth::online()) {
		//Удаляем хэш для автовхода из БД
		dbq("UPDATE `users` SET `hash` = '' WHERE `id` = ".(int)$_SESSION['user']['id']."");
		
		//Если находим логин в таблице "онлайн" - удаляем его
		if (mysqli_num_rows(dbq("SELECT `login` FROM `online` WHERE login='".$_SESSION['user']['login']."' LIMIT 1"))) {
			dbq("DELETE FROM online WHERE login='".$_SESSION['user']['login']."'");
		}
		
		//Отправляем в чат уведомление о выходе
		$mes = '<span class="info_message"><i class="fa fa-angle-double-left"></i> Покинул чат</span>';
		dbq("INSERT INTO `messages` SET `login` = '".mres($_SESSION['user']['login'])."', `date` = ".Time::getTime().", `message` = '".$mes."'");
		
		//Удаляем сессию авторизованного юзера
		session_unset();
		session_destroy();
		
		//Устанавливаем куки автовхода с отрицательным значением
		setcookie('hash', $_COOKIE['hash'], time()-10, '/');
		setcookie('id', $_COOKIE['id'], time()-10, '/');
		
		//Удаляем значения кук и массива
		unset ($_COOKIE['hash']);
		unset ($_COOKIE['id']);
	}
	
	//Перекидываем на главную страницу
	header('Location: /');
	exit();
?>