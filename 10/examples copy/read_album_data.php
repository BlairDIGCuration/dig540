<?php
error_reporting(E_ALL); 
ini_set("display_errors", 1); 
include_once('./includes/db_config.php');
include_once('./includes/History2.php');

$file_handle = fopen('./historytext.csv', 'r');

$first_line = fgetcsv($file_handle);

for($i=0; $i<count($first_line); $i++){
    print_r('Column header found: '.$first_line[$i].'<br>');
}

$albums = array();

while($data_row = fgetcsv($file_handle)){
    $album = new Album();
    $album->setData($data_row);
    $album->save();
    array_push($albums, $album);
}

fclose($file_handle);
?>