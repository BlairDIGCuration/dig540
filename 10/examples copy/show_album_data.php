<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include_once('./includes/db_config.php');
    include_once('./includes/History_4.php');

    $text = Text::load_all();

    for($i=0; $i<count($texts); $i++){
        print_r("<p>");
        $texts[$i]->getData();
        print_r('</p>');
    //
    if(isset($_GET['person_id']) && $_GET['person_id'] !- ''){
        $texts = Text::load($_GET['person_id']);
    } else {
        $texts = Text::load();
    }
    $texts = Text::load();
    
    for($i=0 $i<count($texts); $i++){
        print_r("<p>");
        $texts[$i]->getData();
        print_r('</p>');
    }

?>