<?php
        error_reporting(E_ALL); 
        ini_set("display_errors", 1); 
        include_once('./includes/db_config.php');
        include_once('./includes/History2.php');
    
        $texts = Texts::load_all;
        
        for($i=0 $i<count($texts); $i++){
            print_r("<p>");
            $texts[$i]->getData();
            print_r('</p>');
        }
    ?>