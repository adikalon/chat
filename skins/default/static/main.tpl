<!-- Окно сообщений и юзеров -->
<div class="content" onclick="closeBBcodes()">
	<div class="messages">
		<div id="mescont">
			<div class="button_div relativ"><button onclick="premes()" id="prevmes"><i class="fa fa-arrow-up"></i> Показать предыдущие сообщения</button></div>
			<div id="premes"></div>
			<div id="messages"></div>
		</div>
	</div>
	<div class="users_block">
		<div id="users"></div>
	</div>
</div>

<!-- Разворачиваемые окна -->
<div class="relativ">
	<div id="smiles">
		<table cellspacing="0" cellpadding="0">
			<?php $i = 10; foreach(Smile::smiles() as $smile) { if ($i % 10 == 0) { echo '<tr>'; } ?>
				<td onclick="smile('<?php echo $smile ?>')"><img src="skins/<?php echo Core::$SKIN ?>/img/smiles/<?php echo $smile ?>" alt="<?php echo $smile ?>"></td>
			<?php $i++; if ($i % 10 == 0) { echo '</tr>'; } } ?>
		</table>
	</div>
	
	
	<div id="colors">
		<button onclick="bbcode('<font color=&quot;blue&quot;>','</font>')"><font color="blue">Текст</font></button><br>
		<button onclick="bbcode('<font color=&quot;green&quot;>','</font>')"><font color="green">Текст</font></button><br>
		<button onclick="bbcode('<font color=&quot;red&quot;>','</font>')"><font color="red">Текст</font></button><br>
		<button onclick="bbcode('<font color=&quot;fuchsia&quot;>','</font>')"><font color="fuchsia">Текст</font></button><br>
		<button onclick="bbcode('<font color=&quot;aqua&quot;>','</font>')"><font color="aqua">Текст</font></button>
	</div>
	
	<div id="sizes">
		<button onclick="bbcode('<font size=&quot;1&quot;>','</font>')"><font size="1">Текст</font></button><br>
		<button onclick="bbcode('<font size=&quot;2&quot;>','</font>')"><font size="2">Текст</font></button><br>
		<button onclick="bbcode('<font size=&quot;3&quot;>','</font>')"><font size="3">Текст</font></button><br>
		<button onclick="bbcode('<font size=&quot;4&quot;>','</font>')"><font size="4">Текст</font></button><br>
		<button onclick="bbcode('<font size=&quot;5&quot;>','</font>')"><font size="5">Текст</font></button><br>
		<button onclick="bbcode('<font size=&quot;6&quot;>','</font>')"><font size="6">Текст</font></button><br>
		<button onclick="bbcode('<font size=&quot;7&quot;>','</font>')"><font size="7">Текст</font></button>
	</div>
</div>

<!-- Ввод ссобщений -->
<div class="send">
	<div class="buttons">
		<button onclick="bbcode('<b>','</b>')" <?php echo (Auth::online()) ? 'class="buttons_all buttons_left buttons_on"' : 'class="buttons_all buttons_left buttons_off" disabled'; ?> title="Жирный текст"><i class="fa fa-bold"></i></button>
		<button onclick="bbcode('<i>','</i>')" <?php echo (Auth::online()) ? 'class="buttons_all buttons_left buttons_on"' : 'class="buttons_all buttons_left buttons_off" disabled'; ?> title="Текст курсивом"><i class="fa fa-italic"></i></button>
		<button onclick="bbcode('<u>','</u>')" <?php echo (Auth::online()) ? 'class="buttons_all buttons_left buttons_on"' : 'class="buttons_all buttons_left buttons_off" disabled'; ?> title="Подчеркнутый текст"><i class="fa fa-underline"></i></button>
		<button onclick="onsmile()" <?php echo (Auth::online()) ? 'class="buttons_all buttons_left buttons_on"' : 'class="buttons_all buttons_left buttons_off" disabled'; ?> title="Смайлики"><i class="fa fa-smile-o"></i></button>
		<button onclick="oncolor()" <?php echo (Auth::online()) ? 'class="buttons_all buttons_left buttons_on"' : 'class="buttons_all buttons_left buttons_off" disabled'; ?> title="Цвет текста"><i class="fa fa-paint-brush"></i></button>
		<button onclick="onsize()" <?php echo (Auth::online()) ? 'class="buttons_all buttons_left buttons_on"' : 'class="buttons_all buttons_left buttons_off" disabled'; ?> title="Размер шрифта"><i class="fa fa-text-height"></i></button>
		<button onclick="retag()" <?php echo (Auth::online()) ? 'class="buttons_all buttons_left buttons_on"' : 'class="buttons_all buttons_left buttons_off" disabled'; ?> title="Сбросить форматирование текста"><i class="fa fa-code"></i></button>
		<button onclick="enter()" id="ent" <?php echo (Auth::online()) ? 'class="buttons_all buttons_left buttons_on"' : 'class="buttons_all buttons_left buttons_off" disabled'; ?> title="Вкл/Откл отправку по Enter"><?php echo (Key::check()) ? '<i class="fa fa-toggle-on"></i>' : '<i class="fa fa-toggle-off"></i>'; ?></button>
		<button type="submit" id="button" class="buttons_all buttons_off" disabled title="Отправить сообщение"><i class="fa fa-envelope-o"></i> Отправить</button>
	</div>
	<div id="message" oninput="warn()" onclick="closeBBcodes()" <?php echo (Key::check()) ? 'onkeydown="usl(event)"' : ''; echo (Auth::online()) ? 'class="message_on" contenteditable' : 'class="message_off"'; ?>><?php echo (Auth::online()) ? '' : 'Зарегистрируйтесь или войдите'; ?></div>
</div>