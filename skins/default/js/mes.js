// Обработка отправленного сообщения
function rems(m) {
	m = m.replace(/&nbsp;/gi, ' ');
	m = m.replace(/<(?!img)[^>]+>/gi, '');
	m = m.trim();
	return m;
}

function warn() {
	if (rems(document.getElementById('message').innerHTML).length >= legmes && rems(document.getElementById('message').innerHTML).length < legmesm) {
		document.getElementById('button').disabled = false;
		document.getElementById('button').setAttribute("onclick", "send(); return false");
		document.getElementById('button').setAttribute("class", "buttons_all buttons_on");
	}
	else {
		document.getElementById('button').setAttribute("disabled", true);
		document.getElementById('button').setAttribute("class", "buttons_all buttons_off");
		document.getElementById('button').removeAttribute('onclick')
	}
	closeBBcodes();
	document.getElementById('message').focus();
}

// Включить/Отключить отправку по Enter
function enter() {
	$.ajax({
		url: "/static/ajax_enter?ajax",
		cache: false,
		success: function(val){
			if (val) {
				$("#ent").html('<i class="fa fa-toggle-off"></i>');
				$("#message").removeAttr("onkeydown");
			}
			else {
				$("#ent").html('<i class="fa fa-toggle-on"></i>');
				$("#message").attr("onkeydown", "usl(event)");
			}
		}
	});
}

function clilog(log) {
	if (document.getElementById('message').contains(window.getSelection().focusNode) && rems(document.getElementById('message').innerHTML) !== "") {
		var range = document.getSelection().getRangeAt(0);
		range.insertNode(range.createContextualFragment('<b>'+log+'</b>'));
	}
	else if (rems(document.getElementById('message').innerHTML) === "") {
		document.getElementById('message').innerHTML = '<b>'+log+',</b>&nbsp;'+document.getElementById('message').innerHTML;
	}
	else {
		document.getElementById('message').innerHTML = '<b>'+log+',</b>&nbsp;'+document.getElementById('message').innerHTML;
	}
	warn();
}

function smile(sml) {
	if (document.getElementById('message').contains(window.getSelection().focusNode)) {
		var newNode = '<img src="skins/'+skin+'/img/smiles/'+sml+'" alt="'+sml+'">';
		var range = document.getSelection().getRangeAt(0);
		range.collapse(false);
		range.insertNode(range.createContextualFragment(newNode));
	}
	else {
		document.getElementById('message').innerHTML = document.getElementById('message').innerHTML+'<img src="skins/'+skin+'/img/smiles/'+sml+'" alt="'+sml+'">';
	}
	warn();
}

/* function bbcode(tag,atr=0,val=0) {
	if (document.getElementById('message').contains(window.getSelection().focusNode)) {
	
	if (window.getSelection().focusNode.parentElement.tagName.toLowerCase() == tag.toLowerCase()) {
	
	// Код удаления тегов
	
	} else {
	
	var newNode = document.createElement(tag);
	
	if (atr && val) {
	newNode.setAttribute(atr, val);
	}
	
	var range = document.getSelection().getRangeAt(0);
	range.surroundContents(newNode);
	}
	
	}
	warn();
} */

function bbcode(one,two) {
	var ie = false;
	if (document.getElementById('message').contains(window.getSelection().focusNode)) {
		var selectedText = window.getSelection();
	}
	else if (document.getSelection()) {
		var selectedText = document.getSelection();
	}
	else if ( document.selection ) {
		ie = true;
		var selectedText = document.selection.createRange();
	}
	
	if(!ie) {
		var range = selectedText.getRangeAt(0);
		var obj = document.createElement("span");
		obj.innerHTML = one + range + two;
		range.deleteContents();
		range.insertNode(obj);
	}
	else {
		selectedText.text = one + selected.text + two;
	}
	warn();
}

function retag() {
	document.getElementById('message').innerHTML = document.getElementById('message').innerHTML.replace(/<(?!img)[^>]+>/gi, '');
	warn();
}

// Открыть/Закрыть блок со смайлами
function onsmile() {
	document.getElementById('sizes').style.display='none';
	document.getElementById('colors').style.display='none';
	if (document.getElementById('smiles').style.display!='block') {
		document.getElementById('smiles').style.display='block';
	}
	else {
		document.getElementById('smiles').style.display='none';
	}
}

// Открыть/Закрыть блок с цветами текста
function oncolor() {
	document.getElementById('sizes').style.display='none';
	document.getElementById('smiles').style.display='none';
	if (document.getElementById('colors').style.display!='block') {
		document.getElementById('colors').style.display='block';
	}
	else {
		document.getElementById('colors').style.display='none';
	}
}

// Открыть/Закрыть блок с размерами текста
function onsize() {
	document.getElementById('colors').style.display='none';
	document.getElementById('smiles').style.display='none';
	if (document.getElementById('sizes').style.display!='block') {
		document.getElementById('sizes').style.display='block';
	}
	else {
		document.getElementById('sizes').style.display='none';
	}
}

// Закрыть все раскрытые окна с ББ кодами
function closeBBcodes() {
	document.getElementById('sizes').style.display='none';
	document.getElementById('colors').style.display='none';
	document.getElementById('smiles').style.display='none';
}

function premes() {
	$.ajax({
		url: "/static/ajax_premes?ajax",
		cache: false,
		success: function(suc){
			$("#premes").html(suc);
		}
	});
	prevmes();
	// document.getElementById('prebut').style.display='none';
}

function send() {
	$.ajax({
		url: "/static/ajax_send?ajax",
		type:  "POST",
		data:  { message: document.getElementById('message').innerHTML },
		cache: false,
		success: function(suc){
			lastMessageDate();
			document.getElementById('message').innerHTML = '';
			warn();
		}
	});
	document.getElementById('mescont').scrollTop = document.getElementById('mescont').scrollHeight
}

// Проверка на дату последнего сообщения
function lastMessageDate() {
	$.ajax({
		url: "/static/ajax_messages_last?ajax",
		cache: false,
		success: function(suc){
			if (suc == true) {
				insertMessages();
			}
		}
	});
}

// Вставка сообщений (простая)
function insertMessages() {
	$.ajax({
		url: "/static/ajax_messages?ajax",
		cache: false,
		success: function(suc){
			$("#messages").html(suc);
		}
	});
}

// Вставка сообщений при загрузке сайта (с прокруткой ползунка вниз)
function insertMessagesStart() {
	$.ajax({
		url: "/static/ajax_messages?ajax",
		cache: false,
		success: function(suc){
			$("#messages").html(suc);
			document.getElementById('mescont').scrollTop = document.getElementById('mescont').scrollHeight
		}
	});
}

// Проверка на изменение списка юзеров онлайн
function lastUsersDate() {
	$.ajax({
		url: "/static/ajax_users_last?ajax",
		cache: false,
		success: function(suc){
			if (suc == true) {
				insertUsers();
			}
		}
	});
}

// Вставка списка юзеров
function insertUsers() {
	$.ajax({
		url: "/static/ajax_users?ajax",
		cache: false,
		success: function(suc){
			$("#users").html(suc);
		}
	});
}

function prevmes() {
	$.ajax({
		url: "/static/ajax_prevmes?ajax",
		cache: false,
		success: function(suc){
			if (suc == true) {
				document.getElementById('prevmes').style.display='inline';
			}
			else {
				document.getElementById('prevmes').style.display='none';
			}
		}
	});
}

function usl(e) {
	if (e.keyCode == 13 && !e.shiftKey) {
		send();
	}
}

$(document).ready(function(){
	insertMessagesStart();
	prevmes();
	insertUsers();
	setInterval('lastMessageDate()',1000);
	setInterval('prevmes()',100);
	setInterval('lastUsersDate()',1000);
	document.getElementById('message').focus();
});