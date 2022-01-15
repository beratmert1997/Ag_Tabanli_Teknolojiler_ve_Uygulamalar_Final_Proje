<?php

ob_start();
session_start();
include 'baglan.php';

$doktorsor=$db->prepare("SELECT * FROM doktor WHERE doktor_tc=:doktor_tc");
$doktorsor->execute([
    'doktor_tc' => $_SESSION['userdoktor_tc']
]);
$say2=$doktorsor->rowCount();
$doktorcek=$doktorsor->fetch(PDO::FETCH_ASSOC);

if ($say2==0) {
    header("location:index.php?durum=izinsiz");
    exit;
}



?>


<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Hastane Otomasyon</title>
</head>
<body>

<div class="ust_bar">
    <a href="doktor2.php"><h1>Hastane Otomasyon</h1></a>
    <div class="menu">
        <a href="randevu2.php"><h5>Randevularım</h5></a>
     </div>   
</div>
<a href="logout.php"><div class="cikis">
    Çıkış Yap
</div></a>

</body>
</html>