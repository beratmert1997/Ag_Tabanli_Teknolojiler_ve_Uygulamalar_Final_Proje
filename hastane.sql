-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 16 Oca 2022, 00:53:34
-- Sunucu sürümü: 8.0.23
-- PHP Sürümü: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `hastane`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `doktor`
--

CREATE TABLE `doktor` (
  `doktor_id` int NOT NULL,
  `doktor_adsoyad` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `doktor_tc` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  `doktor_password` varchar(25) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `doktor`
--

INSERT INTO `doktor` (`doktor_id`, `doktor_adsoyad`, `doktor_tc`, `doktor_password`) VALUES
(1, 'Doktor Kutsi', '11111111111', '1111'),
(2, 'Fahrettin Cüreklibatur', '22222222222', '2222'),
(3, 'Ferhat Göçer', '33333333333', '3333'),
(4, 'Ercan Kesal', '44444444444', '4444');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici`
--

CREATE TABLE `kullanici` (
  `kullanici_id` int NOT NULL,
  `kullanici_adsoyad` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_tc` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_password` varchar(25) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kullanici`
--

INSERT INTO `kullanici` (`kullanici_id`, `kullanici_adsoyad`, `kullanici_tc`, `kullanici_password`) VALUES
(6, 'Berat Mert', '16262536720', '123456'),
(7, 'Ahmet Mehmet', '99999999999', '9999'),
(8, 'Murat Mert Güngör', '11111111111', '111111');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `randevu`
--

CREATE TABLE `randevu` (
  `randevu_id` int NOT NULL,
  `randevu_sehir` varchar(20) COLLATE utf8_turkish_ci NOT NULL,
  `randevu_tarih` date NOT NULL,
  `randevu_hastane` varchar(50) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `randevu_klinik` varchar(20) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `randevu_doktor` varchar(25) COLLATE utf8_turkish_ci NOT NULL,
  `randevu_hasta_id` int NOT NULL,
  `randevu_saat` varchar(20) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `randevu`
--

INSERT INTO `randevu` (`randevu_id`, `randevu_sehir`, `randevu_tarih`, `randevu_hastane`, `randevu_klinik`, `randevu_doktor`, `randevu_hasta_id`, `randevu_saat`) VALUES
(9, 'Afyonkarahisar', '2021-12-12', 'Atatürk Eğitim Ve Araştırma Hastanesi', 'Göz Hastalıkları', 'Fahrettin Cüreklibatur', 6, '10:00'),
(10, 'Erzurum', '2021-12-18', 'Gülhane Eğitim ve Araştırma Hastanesi', 'Göz Hastalıkları', 'Fahrettin Cüreklibatur', 6, '10:30'),
(11, 'Aydın', '2021-12-26', 'Şehir Hastanesi', 'Kulak Burun Boğaz', 'Fahrettin Cüreklibatur', 7, '13:30'),
(12, 'Adıyaman', '2021-12-26', 'Şehir Hastanesi', 'Dahiliye', 'Fahrettin Cüreklibatur', 6, '14:30'),
(13, 'Afyonkarahisar', '2021-12-17', 'Acıbadem Hastanesi', 'Kulak Burun Boğaz', 'Fahrettin Cüreklibatur', 6, '15:00'),
(14, 'Ankara', '2022-01-30', 'Atatürk Eğitim Ve Araştırma Hastanesi', 'Göz Hastalıkları', 'Doktor Kutsi', 6, '14:30'),
(15, 'Ankara', '2022-01-27', 'Şehir Hastanesi', 'Ortopedi', 'Ferhat Göçer', 8, '12:00');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `doktor`
--
ALTER TABLE `doktor`
  ADD PRIMARY KEY (`doktor_id`);

--
-- Tablo için indeksler `kullanici`
--
ALTER TABLE `kullanici`
  ADD PRIMARY KEY (`kullanici_id`);

--
-- Tablo için indeksler `randevu`
--
ALTER TABLE `randevu`
  ADD PRIMARY KEY (`randevu_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `doktor`
--
ALTER TABLE `doktor`
  MODIFY `doktor_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `kullanici`
--
ALTER TABLE `kullanici`
  MODIFY `kullanici_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `randevu`
--
ALTER TABLE `randevu`
  MODIFY `randevu_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
