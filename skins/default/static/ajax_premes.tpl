<?php
	if (Message::count()) {
		foreach(Message::premes() as $mess) {
			echo '<div class="user_pole">';
			if (Auth::online()) {
				echo '<span class="login" onclick="clilog(&#39;'.$mess['login'].'&#39;)"><i class="fa fa-user"></i>  '.$mess['login'].'</span>';
			}
			else {
				echo '<span class="login_off"><i class="fa fa-user"></i>  '.$mess['login'].'</span>';
			}
			echo ' <span class="date"><i class="fa fa-clock-o "></i> '.date("M-d H:i", $mess['date']).'</span>';
			echo '</div>';
			echo '<div class="mes_pole">';
			echo $mess['message'];
			echo '</div>';
		}
	}
	else {
		echo '<div class="mes_pole">Сообщений нет</div>';
	}	