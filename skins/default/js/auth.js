function but() {
	if (document.getElementById('login').value.length > 0 && document.getElementById('pass').value.length > 0) {
		document.getElementById('ok').disabled = false;
		} else {
		document.getElementById('ok').setAttribute("disabled", true);
	}
}