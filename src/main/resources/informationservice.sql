-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 14 Kwi 2018, 12:38
-- Wersja serwera: 10.1.30-MariaDB
-- Wersja PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `informationservice`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `article`
--

CREATE TABLE `article` (
  `id_article` bigint(20) NOT NULL,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `priority` int(11) NOT NULL,
  `publication_date` date DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `id_user` bigint(20) DEFAULT NULL,
  `mark` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `article`
--

INSERT INTO `article` (`id_article`, `category`, `content`, `priority`, `publication_date`, `status`, `title`, `id_user`, `mark`) VALUES
(5, 'Business', 'Szef MON Mariusz Błaszczak podpisał 28 marca 2018 roku umowę o dostawie amerykańskich zestawów obrony powietrznej Patriot dla Polski. Za system wraz z systemem zarządzania polem walki zapłacimy 4,75 miliarda dolarów. Jak wygląda i działa MIM-104 Patriot?', 2, '2018-04-02', 'to display', 'Spojrzenie z bliska na system rakiet ', 5, 0),
(6, 'Business', 'Na GPW ogłoszono wezwanie do zapisywania się na sprzedaż akcji spółki Colian. Wzywającymi byli: AllumaInvest, Ziołopex, Barbara Kolańska, Jan Kolański, Colian Holding oraz Ipopema 21 FIZAN, którzy przekroczyli łącznie 66 proc. ogólnej liczby głosów w Colian Holding, w wyniku zawarcia przez wzywających porozumienia.', 1, '2018-04-01', 'to display', 'Kolejna spółka wycofa się z warszawskiej giełdy?', 3, 3),
(7, 'News', 'W ramach środków odwetowych wydalimy z Rosji analogiczną liczbę amerykańskich dyplomatów - zapowiedział Siegiej Ławrow. Minister Spraw Zagranicznych Rosji zapowiedział też, że \"Moskwa odpowie symetrycznie wszystkim krajom, które wydaliły rosyjskich dyplomatów\".', 1, '2018-03-13', 'to display', 'Rosja reaguje na wydalenie dyplomatów', 3, 5),
(8, 'Sport', 'Szefowie klubu z ulicy Cichej przy pomocy podmiotu zewnętrznego spłacili zobowiązania, dzięki czemu odzyskają zabrane wcześniej punkty.', 3, '2018-03-29', 'to display', 'Zasłużony klub odzyska utracone punkty', 4, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `article_rating`
--

CREATE TABLE `article_rating` (
  `id_rating` bigint(20) NOT NULL,
  `value` int(11) NOT NULL,
  `id_article` bigint(20) DEFAULT NULL,
  `id_user` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `article_rating`
--

INSERT INTO `article_rating` (`id_rating`, `value`, `id_article`, `id_user`) VALUES
(3, 3, 6, 1),
(4, 5, 7, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comment`
--

CREATE TABLE `comment` (
  `id_comment` bigint(20) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `date` datetime DEFAULT NULL,
  `mark` int(11) NOT NULL,
  `id_article` bigint(20) DEFAULT NULL,
  `id_user` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(7);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `picture`
--

CREATE TABLE `picture` (
  `id_picture` bigint(20) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `id_article` bigint(20) DEFAULT NULL,
  `priority` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `picture`
--

INSERT INTO `picture` (`id_picture`, `description`, `path`, `id_article`, `priority`) VALUES
(1, NULL, '/resources/images/image1.jpg', 5, 1),
(2, NULL, '/resources/images/image2.jpg', 6, 1),
(3, NULL, '/resources/images/image3.jpg', 7, 1),
(4, NULL, '/resources/images/image4.jpg', 8, 1),
(6, NULL, '/resources/images/image4.jpg', 5, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `role`
--

CREATE TABLE `role` (
  `id_role` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `role`
--

INSERT INTO `role` (`id_role`, `name`) VALUES
(1, 'USER'),
(2, 'ADMIN'),
(3, 'JOURNALIST'),
(4, 'MODERATOR'),
(5, 'EDITOR_IN_CHIEF');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id_user` bigint(20) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `blocked` bit(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id_user`, `password`, `username`, `blocked`) VALUES
(4, '$2a$10$VZ4vY/oMRpGYaqSqHuhEmuP67P2F68oTdzV1BTNensbJlT2kMfNLe', 'moderator', b'0'),
(3, '$2a$10$lKZSDJinRQW3CT122clVweBf7xfTZlF3sgcxXciWhAscgk3fwzyby', 'journalist', b'0'),
(2, '$2a$10$Q8TxpoSbgrmoylrh.thGGOwwFDiBf4qu/HDB6KBC6y0Z9TegZACdW', 'admin123', b'0'),
(1, '$2a$10$n7LMVZBo3s/sorId/d2ba.3FqK9sPI18k5OszHZ6rauxrx7gGEg36', 'user12345', b'0'),
(5, '$2a$10$XiTIx7sW.1mlsZZHCiD5DuGu6zioHymix88XLnIsQzW1YPYuP3ps2', 'EditorInChief', b'0'),
(6, '$2a$10$pN2I/g4Ko8ZUJX54SbtMg.0TZzGL1XDLkQFRnVAdcLRqOrL.cjB3e', 'user54321', b'0');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `FKe3j1tbmi0sgg7xqans6yjuxo4` (`id_user`);

--
-- Indexes for table `article_rating`
--
ALTER TABLE `article_rating`
  ADD PRIMARY KEY (`id_rating`),
  ADD KEY `FK6u2dsulxtbmuw0ghd7diuie3p` (`id_article`),
  ADD KEY `FK4w896m0kx1n9csgxphhsjklqn` (`id_user`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `FK3xl9c4qhiqfaqybv4pb94tevv` (`id_user`),
  ADD KEY `FKony1tk62ys35o1mrtalwrrthy` (`id_article`);

--
-- Indexes for table `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`id_picture`),
  ADD KEY `FKjkrwlwovg4k8dmjtvw1fi2bfx` (`id_article`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKrhfovtciq1l558cw6udg0h0d3` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `article`
--
ALTER TABLE `article`
  MODIFY `id_article` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `article_rating`
--
ALTER TABLE `article_rating`
  MODIFY `id_rating` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `picture`
--
ALTER TABLE `picture`
  MODIFY `id_picture` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `role`
--
ALTER TABLE `role`
  MODIFY `id_role` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id_user` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
