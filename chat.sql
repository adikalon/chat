-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 11 2017 г., 15:33
-- Версия сервера: 5.7.16-log
-- Версия PHP: 7.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `chat`
--

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `login`, `date`, `message`) VALUES
(1, 'qwerty', '1497090319', '<span class=\"info_message\"><i class=\"fa fa-angle-double-left\"></i> Покинул чат</span>'),
(2, 'qwerty', '1497090378', '<span class=\"info_message\"><i class=\"fa fa-angle-double-left\"></i> Покинул чат</span>'),
(3, 'qwerty', '1497090548', '<span class=\"info_message\"><i class=\"fa fa-angle-double-right\"></i> Присоединился</span>'),
(4, 'qwerty', '1497090553', 'fsdfsd'),
(5, 'qwerty', '1497090556', '<img src=\"skins/default/img/smiles/D83DDE21.png\" alt=\"D83DDE21.png\">'),
(6, 'qwerty', '1497090563', 'sdsdgsdg'),
(7, 'qwerty', '1497090617', '<span class=\"info_message\"><i class=\"fa fa-angle-double-left\"></i> Покинул чат</span>'),
(8, 'qwerty', '1497090617', '<span class=\"info_message\"><i class=\"fa fa-angle-double-right\"></i> Присоединился</span>'),
(9, 'qwerty', '1497090624', 'sdf'),
(10, 'qwerty', '1497090629', '<span class=\"info_message\"><i class=\"fa fa-angle-double-left\"></i> Покинул чат</span>'),
(11, 'qwerty', '1497090643', '<span class=\"info_message\"><i class=\"fa fa-angle-double-right\"></i> Присоединился</span>'),
(12, 'qwerty', '1497090672', 'dfsdfsdf  <img src=\"skins/default/img/smiles/D83DDE22.png\" alt=\"D83DDE22.png\">'),
(13, 'qwerty', '1497090678', 'wefwefwef'),
(14, 'qwerty', '1497090678', 'wef'),
(15, 'qwerty', '1497090678', 'we'),
(16, 'qwerty', '1497090678', 'f'),
(17, 'qwerty', '1497090678', 'we'),
(18, 'qwerty', '1497090679', 'f'),
(19, 'qwerty', '1497090679', 'we'),
(20, 'qwerty', '1497090679', 'w'),
(21, 'qwerty', '1497090679', 'ef'),
(22, 'qwerty', '1497090679', 'we'),
(23, 'qwerty', '1497090679', 'f'),
(24, 'qwerty', '1497090681', 'ewefwef'),
(25, 'qwerty', '1497090687', 'ewgegwegwegwegweg'),
(26, 'qwerty', '1497090704', '<b>qwerty,</b> fghfgh'),
(27, 'qwerty', '1497090728', 'fgdfg<font size=\"5\">dfg</font>dfgd'),
(28, 'qwerty', '1497090752', '<span class=\"info_message\"><i class=\"fa fa-angle-double-left\"></i> Покинул чат</span>'),
(29, 'admin', '1497090835', '<span class=\"info_message\"><i class=\"fa fa-angle-double-right\"></i> Присоединился</span>'),
(30, 'admin', '1497091345', 'ап<font color=\"red\">апва</font>'),
(31, 'admin', '1497098536', '<span class=\"info_message\"><i class=\"fa fa-angle-double-left\"></i> Покинул чат</span>'),
(32, 'admin', '1497098539', '<span class=\"info_message\"><i class=\"fa fa-angle-double-right\"></i> Присоединился</span>'),
(33, 'admin', '1497098539', '<span class=\"info_message\"><i class=\"fa fa-angle-double-left\"></i> Покинул чат</span>'),
(34, 'qwerty', '1497098589', '<span class=\"info_message\"><i class=\"fa fa-angle-double-right\"></i> Присоединился</span>');

-- --------------------------------------------------------

--
-- Структура таблицы `online`
--

CREATE TABLE `online` (
  `id` int(11) NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `online`
--

INSERT INTO `online` (`id`, `login`, `last`, `date`) VALUES
(6, 'qwerty', '1497177490', '1497098589');

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `static` tinyint(1) NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `module`, `static`, `meta_description`, `meta_keywords`, `meta_title`, `text`) VALUES
(1, '404', 1, '404', '404', '404', 'Ошибка: данная страница отсутствует'),
(2, 'cabinet', 0, 'cabinet', 'cabinet', 'cabinet', 'cabinet'),
(3, 'static', 0, 'static', 'static', 'static', 'static');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_enter` tinyint(1) NOT NULL,
  `rights` tinyint(1) NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `pass`, `hash`, `key_enter`, `rights`, `date`) VALUES
(1, 'qwerty', 'l0owokYqoX6HI', '', 1, 0, '1497089211'),
(2, 'admin', 'l0PuwDOA8KZ6U', '', 0, 0, '1497090817');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `online`
--
ALTER TABLE `online`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT для таблицы `online`
--
ALTER TABLE `online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
