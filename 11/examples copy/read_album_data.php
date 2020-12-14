<?php
error_reporting(E_ALL); 
ini_set("display_errors", 1); 
include_once('./includes/db_config.php');
include_once('./includes/History_5.php');

$file_handle = fopen('./historytextbetter.csv', 'r');

$first_line = fgetcsv($file_handle);

for($i=0; $i<count($first_line); $i++){
    print_r('Column header found: '.$first_line[$i].'<br>');
}

$texts = array();

while($data_row = fgetcsv($file_handle)){
    $text = new Text();
    $text->setData($data_row);
    $text->save();
    array_push($texts, $text);
}

fclose($file_handle);
?>