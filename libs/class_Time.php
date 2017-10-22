<?php
	class Time {
		static $time_move=0; //Часовой пояс +- часы
		
		public static function setTimeMovie($t){
			self::$time_move = $t;
		}
		
		public static function getTimeMovie(){
			return self::$time_move;
		}
		
		public static function getTime(){
			return time()+self::$time_move*3600;
		}
	}
	
// Time::setTimeMovie(x) - устанавливаешь время,
// Time::getTimeMovie() - получаешь time_movie,
// Time::getTime() - получаешь time