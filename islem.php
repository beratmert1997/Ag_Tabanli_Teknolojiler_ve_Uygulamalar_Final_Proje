<?php 
ob_start();
session_start();
include 'baglan.php';

if(isset($_POST['kullanicikaydet'])) {
    $kullanici_tc = isset($_POST['kullanici_tc']) ? $_POST['kullanici_tc'] : null;
    $kullanici_adsoyad = isset($_POST['kullanici_adsoyad']) ? $_POST['kullanici_adsoyad'] : null;
    $kullanici_password = isset($_POST['kullanici_password']) ? $_POST['kullanici_password'] : null;

    //veritabanı ekleme İşlemi
    $sorgu = $db->prepare('INSERT INTO kullanici SET
        kullanici_tc = ?,
        kullanici_adsoyad = ?,
        kullanici_password = ?');

        $ekle = $sorgu->execute([
            $kullanici_tc, $kullanici_adsoyad, $kullanici_password
        ]);
        if($ekle) {
            header('location: index.php?durum=basarili');
        } else{
           $hata = $sorgu->errorInfo();
           echo 'mysql hatası' .$hata[2];
        }
}



if(isset($_POST['giris_yap'])) {
    $kullanici_tc = $_POST['kullanici_tc'];
    $kullanici_password = $_POST['kullanici_password'];

    $kullanicisor = $db->prepare("SELECT * FROM kullanici WHERE kullanici_tc=:kullanici_tc and 
    kullanici_password=:kullanici_password");
    $kullanicisor->execute([
        'kullanici_tc' => $kullanici_tc,
        'kullanici_password' => $kullanici_password
    ]);

    $say = $kullanicisor->rowCount();

    if ($say==1) {
        $_SESSION['userkullanici_tc']=$kullanici_tc;
        header('location: anasayfa.php?durum=girisbasarili');
        exit;
    } else{
        header('location: index.php?durum=basarisizgiriş');
        exit;
    }
}

if(isset($_POST['doktor_giris_yap'])) {
    $doktor_tc = $_POST['doktor_tc'];
    $doktor_password = $_POST['doktor_password'];

    $doktorsor = $db->prepare("SELECT * FROM doktor WHERE doktor_tc=:doktor_tc and 
    doktor_password=:doktor_password");
    $doktorsor->execute([
        'doktor_tc' => $doktor_tc,
        'doktor_password' => $doktor_password
    ]);

    $say2 = $doktorsor->rowCount();

    if ($say2==1) {
        $_SESSION['userdoktor_tc']=$doktor_tc;
        header('location: doktor2.php?durum=girisbasarili');
        exit;
    } else{
        header('location: index.php?durum=basarisizgiriş');
        exit;
    }
}








if(isset($_POST['randevu_kaydet'])) {
    $sehir = isset($_POST['sehir']) ? $_POST['sehir'] : null;
    $hastane = isset($_POST['hastane']) ? $_POST['hastane'] : null;
    $doktor = isset($_POST['doktor']) ? $_POST['doktor'] : null;
    $tarih = isset($_POST['tarih']) ? $_POST['tarih'] : null;
    $klinik = isset($_POST['klinik']) ? $_POST['klinik'] : null;
    $hasta_id = isset($_POST['kullanici_id']) ? $_POST['kullanici_id'] : null;
    $saat = isset($_POST['saat']) ? $_POST['saat'] : null;

    $kaydet=$db->prepare("INSERT INTO randevu SET
        randevu_sehir = ?,
        randevu_hastane = ?,
        randevu_doktor = ?,
        randevu_tarih = ?,
        randevu_klinik = ?,
        randevu_hasta_id = ?,
        randevu_saat = ?
    ");

    $insert=$kaydet->execute([
        $sehir, $hastane, $doktor, $tarih, $klinik, $hasta_id, $saat
    ]);
    if($insert) {
        header("location:anasayfa.php?kayıt_basarili");
    } else{
        header("location:anasayfa.php?kayıt_basarisiz");
    }

}


?>