<?php

try {
    $db = new PDO("mysql:host=localhost; dbname=hastane; charest=utf8", 'root', '6378BMaü!!!');
    //echo 'veritabanı bağlantısı başarılı';
} catch (Exception $e) {
    echo $e->getMessage();
}


?>