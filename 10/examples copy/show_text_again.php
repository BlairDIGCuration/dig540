<?php
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
    include_once("./includes/db_config.php");
    include_once("./includes/History_7.php"); 




    if(isset($_GET['person_id']) && $_GET['person_id'] != ''){
      $texts_array = Text::load($_GET['person_id']);
  } else {
      if(isset($_GET['text_id']) && $_GET['text_id'] != ''){
        $texts_array = Text::load_texts($_GET['text_id']);
      } else { 
        //$texts_array = false;
         $texts_array = Text::load();
         print_r("What do I do? :(");
      }
  } 

        //if(isset($_GET['person_id']) && $_GET['person_id'] != ''){
           // $texts_array = Text::load($_GET['person_id']);
        //} else {
           // if(isset($_GET['text_id']) && $_GET['text_id'] != ''){
             // $texts_array = Text::load_texts($_GET['text_id']);
           // } else { 
            //  $texts_array = Text::load();
              //print_r("What do I do? I've been given no instructions :(");

          //  }
        //} 

       // if(isset($_GET['text_id']) && $_GET['text_id'] != ''){
         // $texts = Text::load_texts($_GET['text_id']);
       // } else {
       //   $texts = Text::load_texts();
       // }
        
        //if(isset($_GET['person_id']) && $_GET['person_id'] != ''){
           // $text = Text::load_by_person_id($_GET['text_id']);
       // } else {
         //   $text = Text::load(getData);
      //  }

      
         //&&=
        //need to know what is in the database
        //static method: like the object, but doesn't get called on an album
        //way of organizng code wihtout creaitng or substantiaitng with a tect concept, but not a specific one
     //can assume it will load all albumns/texts in database
     
?> 
       
<!doctype html>
<html lang="en">
  <head>
    <title>Ancient Writings</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
  </head>
  <body>
    <h1>Middle Eastern Letters and Treaties!</h1>
    <?php
        //for($i=0; $i<count($texts_array); $i++){
          //$texts_array = $texts_array[$i];
        for($i=0; $i<count($texts_array); $i++){
         $texts_array[$i]->getData();
           if(!$texts_array){
            print_r('There was a disturbance in the force. Either you did not specify an ancient texts or it has been lost to the sands of the internet.');
            } //else {
              //print_r("<p>");
              //$texts_array[$i]->getData();
              //print_r('</p>');
           // }
          }
        //or is it $text_entry?
            // print_r('</p>');
    //}
        //$texts_entry = $texts[$i];
        
    ?>

<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
  </body>
</html>
