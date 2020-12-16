<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include_once("./includes/db_config.php");
    include_once("./includes/History_6.php");

        if(isset($_GET['person_id']) && $_GET['person_id'] != ''){
            $texts = Text::($_GET['person_id']);
        } else {
        $texts = Text::load();
        }
    

        //&&=
        //need to know what is in the database
        //static method: like the object, but doesn't get called on an album
        //way of organizng code wihtout creaitng or substantiaitng with a tect concept, but not a specific one
     //can assume it will load all albumns/texts in database

        for($i=0; $i<count($texts); $i++){
            $texts_entry = $texts[$i];
            print_r("<p>");
            $texts_entry->getData();
            print_r('</p>');
        }
    ?>
