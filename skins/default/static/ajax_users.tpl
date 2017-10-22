<?php
	if (Online::count()) {
		foreach(Online::users() as $user) {
			if (Auth::online()) {
				echo '<div class="users_pole" onclick="clilog(&#39;'.$user.'&#39;)" title="Обратиться по нику"><i class="fa fa-user"></i> '.$user.'</div>';
			}
			else {
				echo '<div class="users_pole_off"><i class="fa fa-user"></i> '.$user.'</div>';
			}
		}
	}
	else {
		echo '<span class="no_online">Никого нет онлайн</span>';
	}	