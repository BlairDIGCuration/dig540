<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 

  include_once('./includes/db_config.php');
  include_once('./includes/History2.php');


    $file_handle = fopen('./historytext.csv', 'r');

    $first_line = fgetcsv($file_handle);

    //QUESTION!
    for($i=0; $i<count($first_line); $i++){
        print_r('Column header found: '.$first_line[$i].'<br>');
    }

    $albums = array();
    
    while($data_row = fgetcsv($file_handle)){
        $album = new Album();
        $album->setArtist($data_row[3]);
        $album->setTitle($data_row[2]);
        $album->setRank($data_row[0]);
        $album->setYear($data_row[1]);
        $album->setGenres($data_row[4]);
        $album->setSubgenres($data_row[5]);
        array_push($albums, $album);
    }
    //QUESTION!!!
    for($i=count($albums)-1; $i>=0; $i--){
        print_r("<p>This is the #$i Text:<br>");

        $albums[$i]->getData();

        // $albums[$i]->getTitle();
        // $albums[$i]->getYear();
        // $albums[$i]->getRank();
        // $albums[$i]->getArtist();
        // $albums[$i]->getGenres();
        // $albums[$i]->getSubgenres();
        print_r('</p>');
    }

    fclose($file_handle);
?>
