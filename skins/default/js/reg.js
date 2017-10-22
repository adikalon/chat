function warn() {
	var numlog = document.getElementById('reg_login').value.length;
	var numpas = document.getElementById('reg_pass').value.length;
	var matlog = document.getElementById('reg_login').value;
	var matpas = document.getElementById('reg_pass').value;
	
	if (matlog.match(/^[a-z0-9_-]+$/i) && numlog > 0) {
		if (numlog < leglog) {
			document.getElementById('reg_login_warning').innerHTML = '<i class="fa fa-times red"></i> Не менее '+leglog+' символов';
			l = 0;
			button();
			} else if (numlog >= leglog && numlog <= leglogm) {
			// l = 1;
			$.ajax({
				url:  "/cabinet/ajax_search_login?ajax",
				type:  "GET",
				data:  { login: matlog },
				cache:  false,
				success:  function(response) {
					if (response  == "no") {
						document.getElementById('reg_login_warning').innerHTML = '<i class="fa fa-times red"></i> Этот логин занят';
						l = 0;
						button();
						} else {
						document.getElementById('reg_login_warning').innerHTML = '<i class="fa fa-check green"></i> Верно';
						l = 1;
						button();
					}
				}
			});
			} else if (numlog > leglogm) {
			document.getElementById('reg_login_warning').innerHTML = '<i class="fa fa-times red"></i> Не более '+leglogm+' символов';
			l = 0;
			button();
			} else {
			document.getElementById('reg_login_warning').innerHTML = '';
			l = 0;
			button();
		}
		} else {
		if (numlog < 1) {
			document.getElementById('reg_login_warning').innerHTML = '';
			l = 0;
			button();
			} else {
			document.getElementById('reg_login_warning').innerHTML = '<i class="fa fa-times red"></i> Только латинские буквы и цифры';
			l = 0;
			button();
		}
	}
	
	if (matpas.match(/[^\s]+?/iu) && numpas > 0) {
		if (numpas < legpas) {
			document.getElementById('reg_pass_warning').innerHTML = '<i class="fa fa-times red"></i> Не менее '+legpas+' символов';
			p = 0;
			button();
			} else if (numpas >= legpas && numpas <= legpasm) {
			document.getElementById('reg_pass_warning').innerHTML = '<i class="fa fa-check green"></i> Верно';
			p = 1;
			button();
			} else if (numpas > legpasm) {
			document.getElementById('reg_pass_warning').innerHTML = '<i class="fa fa-times red"></i> Не более '+legpasm+' символов';
			p = 0;
			button();
			} else {
			document.getElementById('reg_pass_warning').innerHTML = '';
			p = 0;
			button();
		}
		} else {
		if (numpas < 1) {
			document.getElementById('reg_pass_warning').innerHTML = '';
			p = 0;
			button();
			} else {
			document.getElementById('reg_pass_warning').innerHTML = '<i class="fa fa-times red"></i> Пробел запрещен';
			p = 0;
			button();
		}
	}
}

function button() {
	if (l && p) {
		document.getElementById('reg_button').disabled = false;
		document.getElementById('reg_button').setAttribute("class", "reg_button_on");
		} else {
		document.getElementById('reg_button').setAttribute("disabled", true);
		document.getElementById('reg_button').setAttribute("class", "reg_button_off");
	}
	
	if (document.getElementById('reg_login_warning').innerHTML != "") {
		document.getElementById('reg_login_relative').style.display='block';
	}
	else {
		document.getElementById('reg_login_relative').style.display='none';
	}
	
	if (document.getElementById('reg_pass_warning').innerHTML != "") {
		document.getElementById('reg_pass_relative').style.display='block';
	}
	else {
		document.getElementById('reg_pass_relative').style.display='none';
	}
}