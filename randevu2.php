<?php include 'header2.php'; ?>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hastane Otomasyon</title>
</head>
<body>

<table>
    <tr>
        <th>Hasta Tc</th>
        <th>Hasta Adı</th>
        <th>Tarih</th>
        <th>Saat</th>
        
    </tr>

    <?php 
    $randevu_sor = $db->prepare("SELECT * FROM randevu
    INNER JOIN doktor INNER JOIN kullanici ON randevu.randevu_doktor = doktor.doktor_adsoyad AND randevu.randevu_hasta_id = kullanici.kullanici_id WHERE doktor_tc=:doktor_tc");
    $randevu_sor->execute([
        'doktor_tc' => $_SESSION['userdoktor_tc']
    ]);
    while ($randevu_cek = $randevu_sor->fetch(PDO::FETCH_ASSOC)) { ?>

    <tr>
        <td><?php echo $randevu_cek['kullanici_tc']; ?></td>
        <td><?php echo $randevu_cek['kullanici_adsoyad']; ?></td>
        <td><?php echo $randevu_cek['randevu_tarih']; ?></td>
        <td><?php echo $randevu_cek['randevu_saat']; ?></td>
    </tr>
    <?php } ?>
    </table>

    
</body>
</html>