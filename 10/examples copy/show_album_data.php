<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include_once('./includes/db_config.php');
    include_once('./includes/Historical_Text.php');


    if(isset($_GET['genre']) && $_GET['genre'] !- ''){
        $albums = Album::load($_GET['genre']);
    } else {
        $albums = Album::load();
    }
    $albums = Album::load();
    //want to show albums, want alternative path that does have git-variable show up
    //isset= does this actually exist?, way of sayig I want to look at something, but not sure if it exists or not
    //needs content
    //&&= has to be true

    
    //QUESTION!!!
    for($i=0 $i<count($albums); $i++){
        print_r("<p>");
        $albums[$i]->getData();
        print_r('</p>');
    }

?>