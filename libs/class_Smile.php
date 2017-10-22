<?php
	class Smile {
		static $link;
		static $files;
		static $name;
		static $smiles;
		static $resmile;
		static $rrr;
		
		// Возвращает массив имен смайлов
		public static function smiles() {
			self::$files = scandir('skins/'.Core::$SKIN.'/img/smiles');
			foreach(self::$files as $file) {
				self::$name = substr($file, -3, 3);
				if (self::$name == 'gif' || self::$name == 'png') {
					self::$smiles[] = $file;
				}
			}
			return self::$smiles;
		}	
	}	