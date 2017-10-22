<?php
	
	function wtf($array, $stop = false) {
		echo '<pre>'.print_r($array,1).'</pre>';
		if(!$stop) {
			exit();
		}
	}
	
	function dbq($query) {
		global $db;
		$res = mysqli_query($db,$query);
		if ($res === false) {
			$inf = debug_backtrace();
			$error = date("Y-m-d H:i:s")."<br>\nQUERY: ".$query."<br>\n".mysqli_error($db)."<br>\nFILE: ".$inf[0]['file']."<br>\nLINE: ".$inf[0]['line'];
			file_put_contents('./log/mysql.log',strip_tags($error)."\n\n",FILE_APPEND);
			echo $error;
			exit();
			} else {
			return $res;
		}
	}
	
	function trimAll($el) {
		if (!is_array($el)) {
			$el = trim($el);
			} else {
			$el = array_map('trimAll',$el);
		}
		return $el;
	}
	
	function intAll($el) {
		if (!is_array($el)) {
			$el = (int)$el;
			} else {
			$el = array_map('intAll',$el);
		}
		return $el;
	}
	
	function floatAll($el) {
		if (!is_array($el)) {
			$el = (float)$el;
			} else {
			$el = array_map('floatAll',$el);
		}
		return $el;
	}
	
	function hsc($el) {
		if (!is_array($el)) {
			$el = htmlspecialchars($el);
			} else {
			$el = array_map('hsc',$el);
		}
		return $el;
	}
	
	function mres($el) {
		global $db;
		if (!is_array($el)) {
			$el = mysqli_real_escape_string($db,$el);
			} else {
			$el = array_map('mres',$el);
		}
		return $el;
	}
	
	function __autoload($class) {
		include './libs/class_'.$class.'.php';
	}
	
	function myHash($var) {
		$salt = 'a1b2c3d4e5f6g7h8i9k0';
		$salt2 = 'l0m9n8o7p6q5r4s3t2v1wxyz';
		$var = crypt(md5($var.$salt),$salt2);
		return $var;
	}
	
	// Обработка отправленного сообщения
	/* function remes($m) {
		$m = trim(str_replace(['<div>', '</div>', '<br>', '<br/>', '<br />', '&nbsp;'], ['', '', "\n", "\n", "\n", ' '], $m));
		$m = str_replace(["\n"], ['<br>'], $m);
		$m = strip_tags($m, '<b><i><u><img><font><br>');
		return $m;
	} */
	
	function remes($m) {
		$m = strip_tags($m, '<b><i><u><img><font><br>');
		$m = trim(str_replace(['<br>', '&nbsp;'], ["\n", ' '], $m));
		$m = str_replace(["\n"], ['<br>'], $m);
		return $m;
	}