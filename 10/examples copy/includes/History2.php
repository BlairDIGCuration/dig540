<?php
  class Text{
    private $language;
    private $text_title;
    private $translation;
    private $text_cache;
    private $person_id;
    private $role;
    private $id;
    private $texts;

    
    public function setLanguage($languageName){ $this->language = $languageName; }
    public function getLanguage(){ print_r( 'Language: '.$this->language . '<br>'); }
    public function setText_title($text_titleName){ $this->text_title = $text_titleName; }
    public function getText_title(){ print_r('Text_Title: '.$this->text_title . '<br>'); }
    public function setTranslation($translationSays){ $this->translation = $translationSays; }
    public function getTranslation(){ print_r('Translation: '.$this->translation . '<br>'); }
    public function setText_cache($text_cacheLocation){ $this->text_cache = $text_cacheLocation; }
    public function getText_cache(){ print_r('Text_cache: '.$this->text_cache . '<br>'); }
    public function setTexts($texts) { $this->texts = $texts; }
    public function getTexts(){ print_r( 'texts: '. $this->texts . '<br>'); }
    public function setID($dbID){ $this->id = $dbID; }
    public function getID(){ print_r ( 'id: '. $this->id . '<br>'); }

    public function setPerson_id($person_id){ 
        $this->person_id = str_getcsv($person_id); 
    }
    public function getPerson_id(){ 
        for($j=0; $j<count($this->person_id); $j++){
            if($j%2==0) print_r("<span style='color:blue'>Genre #".($j+1)." is ".$this->person_id[$j]."</span><br>");
            else print_r("<span style='color:red'>Genre #".($j+1)." is ".$this->person_id[$j]."</span><br>");
        }
    }

    public function setRole($roles){
         $this->role = str_getcsv($roles);
         }
    public function getRole(){ 
        for($j=0; $j<count($this->role); $j++){
            if($j%2==0) print_r("<span style='color:blue'>Subgenre #".($j+1)." is ".$this->role[$j]."</span><br>");
            else print_r("<span style='color:red'>Subgenre #".($j+1)." is ".$this->role[$j]."</span><br>");
        }
    }
    

    }
        //for($j=0; $j<count($this->subgenres); $j++){
            //if($j%2==0) print_r("<span style='color:blue'>Translation #".($j+1)." is ".$this->subgenres[$j]."</span><br>");
           // else print_r("<span style='color:red'>Translation #".($j+1)." is ".$this->subgenres[$j]."</span><br>");
//}
    

    public function setData($text_data){
        $this->setLanguage($text_data[3]);
        $this->setText_title($text_data[2]);
        $this->setTranslation($text_data[0]);
        $this->setText_cache($text_data[1]);
        $this->setPerson_id($text_data[4]);
        $this->setRole($text_data[5]);
        $this->setTexts($text_data[7]);
        $this->setID($text_data[6]);
        }
        


    public function getData(){
        $this->getLanguage();
        $this->getText_title();
        $this->getTranslation();
        $this->getText_cache();
        $this->getPerson_id();
        $this->getRole();
        $this->getTexts();
        $this->getID();
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

            

            $select_person = $pdo->prepare("SELECT * FROM person WHERE person_id= ?");
            $person_insert = $pdo->prepare("INSERT INTO person (person_id) VALUES (?)");
            $person_link = $pdo->prepare("INSERT into person (person_id, role) VALUES (?,?)");
    
            for($i=0; $i<count($this->person_id);$i++){
                $select_person_text->execute([$this->texts[$i]]);
                $existing_person_text = $select_person->fetch();
                //if result
                if(!$existing_person_text){
                    //if no result
                    $db_person_text = $person_text_insert->execute([$this->texts[$i]]);
                    $texts = $pdo->lastInsertRole();
                } else {
                    $texts = $existing_id['id'];
                }
                $person_text_link->execute([$this->$texts]);
                print_r("Connected ".$this_text[$i]." to $this->person_text<br>\n");
            }           
            flush();
            ob_flush();
            //allows to see in real time how it is executing               
        } catch (PDOException $e){
            print_r("Error saving text to database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    
    }

}
?>