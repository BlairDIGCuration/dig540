<?php
class Text{
  private $language;
  private $text_title;
  private $translation;
  private $text_cache;
  private $person_id;
  private $role;
  private $id;
  private $text;
  private $person_text;

  public function setTexts($text) { $this->text = $text; }
  public function getTexts(){print_r( 'texts: '. $this->text . '<br>'); }
  public function setID($dbID){ $this->id = $dbID; }
  public function getID(){ print_r ( 'id: '. $this->id . '<br>'); }
  public function setLanguage($languageName){ $this->language = $languageName; }
  public function getLanguage(){ print_r( 'Language: '.$this->language . '<br>'); }
  public function setText_title($text_titleName){ $this->text_title = $text_titleName; }
  public function getText_title(){ print_r('Text_Title: '.$this->text_title . '<br>'); }
  public function setTranslation($translationSays){ $this->translation = $translationSays; }
  public function getTranslation(){ print_r('Translation: '.$this->translation . '<br>'); }
  public function setText_cache($text_cacheLocation){ $this->text_cache = $text_cacheLocation; }
  public function getText_cache(){ print_r('Text_cache: '.$this->text_cache . '<br>'); }
  public function setPerson_text($person_text){ $this->person_text = $person_text; }
  public function getPerson_text(){print_r('Person_text: '.$this->person_text . '<br>'); }


  public function setPerson_id($person_id){ 
      print_r("person id follows");
      print_r($person_id);
      $this->person_id = str_getcsv(trim($person_id)); 
    }
  public function getPerson_id(){
    print_r($this->person_id);
    for($j=0; $j<count($this->person_id); $j++){
        if($j%2==0) print_r("<span style='color:blue'>Person_id #".($j+1)." is ".$this->person_id[$j]."</span><br>");
        else print_r("<span style='color:red'>Person_id #".($j+1)." is ".$this->person_id[$j]."</span><br>");
    }
  }

  public function setRole($role){
       $this->role = str_getcsv($role); 
    }
  public function getRole(){
    print_r($this->role);
      for($j=0; $j<count($this->role); $j++){
        if($j%2==0) print_r("<span style='color:blue'>Role #".($j+1)." is ".$this->role[$j]."</span><br>");
        else print_r("<span style='color:red'>Role #".($j+1)." is ".$this->role[$j]."</span><br>");
  }
}
       //print_r('Role: '.$this->role.'<br>'); }
      //for($j=0; $j<count($this->subgenres); $j++){
          //if($j%2==0) print_r("<span style='color:blue'>Translation #".($j+1)." is ".$this->subgenres[$j]."</span><br>");
         // else print_r("<span style='color:red'>Translation #".($j+1)." is ".$this->subgenres[$j]."</span><br>");
//}
  
    //use csv  numbers
    //ONLY csv
  public function setData($text_data){
          $this->setLanguage($text_data[3]);
          $this->setText_title($text_data[2]);
          $this->setTranslation($text_data[5]);
          $this->setText_cache($text_data[4]);
          $this->setPerson_id($text_data[0]);
          $this->setRole($text_data[1]);
      }

//taking avalible data and makes it avalible on webpage
  public function getData(){
      $this->getTexts();
      $this->getID();
      $this->getLanguage();
      $this->getText_title();
      $this->getTranslation();
      $this->getText_cache();
      $this->getPerson_id();
      $this->getRole();
  }

  public function save(){
      global $pdo;
     
      try{
          $text_insert = $pdo->prepare("INSERT INTO text(translation, text_cache, text_title, language)
                                      VALUES(?,?,?,?)");
          $text_insert = $pdo->prepare("INSERT INTO text(translation, text_cache, text_title, language)
                                      VALUES(?,?,?,?)");
          $db_text = $text_insert->execute([$this->translation, $this->text_cache, $this->text_title, $this->language]);
          $this->id = $pdo->lastInsertID();
          print_r("--Saved $this->translation to the database.--<br>\n");

          

          $select_person_text = $pdo->prepare("SELECT * FROM person WHERE person_id= ?");
          $person_insert = $pdo->prepare("INSERT INTO person (person_id) VALUES (?)");
          $person_text_link = $pdo->prepare("INSERT into person_text (person_id, role, text_id) VALUES (?,?,?)");
  
        print_r($this->person_id);

          for($i=0; $i<count($this->person_id); $i++){
              if(empty($this->person_id[$i])){ continue; }

//Order of operation:
//- figure out if each person_id is already in the person table
//- if that person doesn't exist, write a new person record
//- get the person_id
//- write into person_text a row connecting person_id, text_id, and role

                $select_person_text->execute([$this->person_id[$i]]);
              
              $existing_person_text = $select_person_text->fetch();
              //if result
              if(!$existing_person_text){
                  //if no result
                  //THAT'S BAD
                  $db_person_text = $person_insert->execute([$this->person_id[$i]]);
                  $person_id = $pdo->lastInsertid();
                  print_r("Tried to add a person id, oops");
              } else {
                  $person_id = $this->person_id[$i];
              }
              print_r("person_id: ".$this->person_id[$i]."<br>");
              print_r("text_id: ".$this->id."<br>");
              print_r("role: ".$this->role[$i]."<br>");
              $person_text_link->execute([$this->person_id[$i], $this->role[$i], $this->id]);
              print_r("Connected ".$this->id." to ".$this->person_id[$i]."<br>\n");
          }           
          flush();
          ob_flush();
          //allows to see in real time how it is executing               
      } catch (PDOException $e){
          print_r("Error saving text to database: ".$e->getMessage() . "<br>\n");
          exit;
      
      
    }
  }

  static public function load_all(){
    global $pdo;

    $texts = array();
    try{

      $select_texts = $pdo->prepare("SELECT * FROM text ORDER BY text_title ASC ");
      $select_person_text = $pdo->prepare("SELECT person_id AS person_id, role AS role
                                          FROM person_text
                                          WHERE person_text.text_id = ?");

      //$select_person_text = $pdo->prepare("SELECT person_text.role AS role
                                          //FROM person_text
                                          //WHERE person_text.role = ?");

      //print_r("tried to get it to work. why not?");
      $select_texts->execute();
      $select_person_text = $pdo->execute()
      

      $db_texts_array = $select_texts->fetchAll();

      $db_texts_array_count = count($db_texts_array); //4

      for($i=0; $i<count($db_texts_array); $i++){
        $text = new Text();

        $text->setLanguage($db_texts_array[$i]['language']);
        $text->setText_title($db_texts_array[$i]['text_title']);
        $text->setTranslation($db_texts_array[$i]['translation']);
        $text->setText_cache($db_texts_array[$i]['text_cache']);
        $text->setID($db_texts_array[$i]['text_id']);

        $select_person_text->execute([$text->id]);
        $db_person_text_array = $select_person_text->fetchALL();

        $person_texts_array = array();
        $person_roles_array = array();

        //print_r($db_person_text_array);

        for($j=0; $j<count($db_person_text_array); $j++) {

          array_push($person_texts_array, $db_person_text_array[$j]['person_id']);
          array_push($person_roles_array, $db_person_text_array[$j]['role']);
          //array= a group of things in a line
          //array_push= pushing something else into an already established array
          //specify an array and an entry or I'll get confused.

        }

        

        $text->setPerson_text(implode(',', $person_texts_array));
        $text->setRole(implode(',', $person_roles_array));
        array_push($texts, $text);
       // print_r("Tell me why you won't work!!!!");
      }
      return $texts;
      //takes data out of function and lets it into the function itself

    } catch (PDOException $e){
          print_r("Error reading text from database: ".$e->getMessage() . "<br>\n");
          exit;
      
    }
  

  }

}