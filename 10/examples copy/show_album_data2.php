<?php
           error_reporting(E_ALL); 
           ini_set("display_errors", 1); 
       
            include_once('./includes/db_config.php');
            include_once('./includes/History_4.php');
    
       
           $texts = array();
           
           while($data_row = fgetcsv($file_handle)){
               $text = new Text();
               $text->setLanguage($data_row[3]);
               $text->setText_title($data_row[2]);
               $text->setTranslation($data_row[0]);
               $text->setText_cache($data_row[1]);
               $text->setPerson_id($data_row[4]);
               $text->setRole($data_row[5]);
               $text->setPerson_name($data_row[6]);
               array_push($texts, $text;
           }
           for($i=count($texts)-1; $i>=0; $i--){
               print_r("<p>This is the #$i Text:<br>");
       
               $texts[$i]->getData();
               print_r('</p>');
           }
       
           fclose($file_handle);
    ?>