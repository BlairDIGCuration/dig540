<?php
  class Album{
    private $artist;
    private $title;
    private $rank;
    private $year;
    private $genres;
    private $subgenres;
    private $id;

    public function setID($dbID){ $this->id = $dbID; }
    public function setArtist($artistName){ $this->artist = $artistName; }
    public function getArtist(){ print_r( 'Language: '.$this->artist . '<br>'); }
    public function setTitle($titleName){ $this->title = $titleName; }
    public function getTitle(){ print_r('Text_Title: '.$this->title . '<br>'); }
    public function setRank($rankNumber){ $this->rank = $rankNumber; }
    public function getRank(){ print_r('Person_id: '.$this->rank . '<br>'); }
    public function setYear($releaseYear){ $this->year = $releaseYear; }
    public function getYear(){ print_r('Role: '.$this->year . '<br>'); }
    public function setGenres($genres){ 
        $this->genres = str_getcsv($genres);
    }
    public function getGenres(){ 
        for($j=0; $j<count($this->genres); $j++){
            if($j%2==0) print_r("<span style='color:black'>Text_Cache #".($j+1)." ".$this->genres[$j]."</span><br>");
            else print_r("<span style='color:black'>Text_Cache #".($j+1)." ".$this->genres[$j]."</span><br>");
        }
    }
    public function setSubgenres($subs){ 
        $this->subgenres = str_getcsv($subs);
    }
    public function getSubgenres(){ 
        for($j=0; $j<count($this->subgenres); $j++){
            if($j%2==0) print_r("<span style='color:black'>Translation #".($j+1)." is ".$this->subgenres[$j]."</span><br>");
            else print_r("<span style='color:black'>Translation #".($j+1)." is ".$this->subgenres[$j]."</span><br>");
        }
    }

    public function setData($album_data){
            $this->setArtist($album_data[3]);
            $this->setTitle($album_data[2]);
            $this->setRank($album_data[0]);
            $this->setYear($album_data[1]);
            $this->setGenres($album_data[4]);
            $this->setSubgenres($album_data[5]);
        }
        


    public function getData(){
        $this->getArtist();
        $this->getTitle();
        $this->getRank();
        $this->getYear();
        $this->getGenres();
        $this->getsubgenres();
    }

    public function save(){
        global $pdo;

        try{
            $album_insert = $pdo->prepare("INSERT INTO album (number, year, title, artist, subgenre)
                                            VALUES (?,?,?,?,?,)");
            $db_album =$album_insert->execute([$this->rank, $this->year, $this->title, $this->artist, implode(',', $this->subgenres)]);
            $this->id = $pdo->lastInsertId();
            print_r("--Saved $this->title to the database.--<br>\n");

            $select_genre = $pdo->prepare("SELECT * FROM genre WHERE name = ?");
            //insert information into table
            $genre_insert = $pdo->prepare("INSERT INTO genre (name) VALUES (?)");
            //33:35
            $genre_link = $pro->prepare("INSERT INTO album_genre (album_id, genre_id) VALUES (?,?)");
            //want to insert genres and link genres 
            //have array of names
            //need to search for each individually 

            for($i=0; $i<count($this->genres); $i++) {
                $select_genre->execute([$this->genres[$i]]);
                //how to access things: below
                $existing_genre = $select_genre->fetch();
                if(!$existing_genre){
                    $db_genre = $genre_insert->execute([$this->genres[$i]]);
                    $genre_id = $pdo->lastInsertID();
                    //means we can use it when we need to execute our linking statement
                } else {
                    $genre_id = $existing_genre['id'];
                }
                $genre_link->execute([$this->id, $genre_id]);
                print_r("Connected ".$this->genres[$i]." to $this->title<br>\n");

            }
            flush();
            ob_flush();
            //say don't wait til done executing, just begin sendin the data so it appears as it's created
            // important because it could take a long time otherwise
            //will know imediately 
        } catch (PDOException $e){
            print_r("Error saving album to database: ".$e->getMessage() . "<br>\n");
            exit;
        }
    
    }

}
?>