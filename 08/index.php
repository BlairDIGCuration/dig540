<!doctype html>
<html lang="en">
  <head>
    <title>Hello, world!</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
  </head>
  <body>
    <h1>Hello, world!</h1>

    <?php
// This file is a PHP file. It will be executed when you load
// it on a web server. 

// The goal of this PHP is to open a .csv file, read each line in it, and then render
// those lines out to the browser. 

// First, let's open the file. It's in the same directory as this .php file and is called albumlist.csv.
// To do that, we use a function called fopen.

$file_handle = fopen('./albumlist.csv', 'r');

// $file_handle is a variable. Right now that variable is pointing at the very beginning of albumlist.csv.
// Let's read in the first line.

$first_line = fgetcsv($file_handle);

// $first_line now contians the first line of data from the file. In this case, we know that the first 
// line is a header row with column names in it. Also, because we told PHP that this is a csv file, it 
// automaticlly seperated out each item in the row into a data type called an array. Arrays are a kind
// of variable that can contain multiple pieces of data under the same variable name. You refer to
// individual items in an array with a numbered index that starts at 0. For instance, the first item
// in the $first_line array could be accessed by writing $first_line[0], the second item would be 
// $first_line[1], etc. Let's do something with those headers. 

for($i=0; $i<count($first_line); $i++){
    //We're now inside a loop. This loop will execute exactly as many times as there are items in the 
    //$first_line array and will keep track of interation we're on in the $i variable. Therefore, 
    //no matter which iteration of the loop we're on, we can access the current item in the $first_line
    //array by writing $first_line[$i]. For now, let's just print them out. 
    
    //printing, in this case, uses a function called 'print_r'. I'm going to give print_r a string of 
    //text that it will combine with the value of the $first_line variable every time it iterates through 
    //the loop. Then, I'm taking another string ('<br>') on to the end of it-that's an HTML tag that
    //indicates a line break. 
    print_r('<div>Column header found: '.$first_line[$i].'<br></div>');

}

// While we could keep going and get every line of data individually, it's faster to get each line
// in another loop. We'll use a different type of loop this time: a while loop. 
while($data_row = fgetcsv($file_handle)){
    //This loop will execute as many times as there are rows in the csv file, beginning with the
    //second row (since we already read the first row earlier). It will store each row in the 
    //$data_row variable, which is an array like $first_line was. Right now, let's just print
    //out each for with a litle bit of formatting. 

    //First, let's print out an introductory line for each album. By looking at the data file, 
    //we know that the first column is the number of the album. Let's use that here. I'll use another
    //HTML tag, in this case the paragraph tag. Unlike <br>, the <p> tag needs to wrap the text that
    //it turns into a paragraph so it begins with <p> and closes with </p>/ I'll open the paragraph
    //here and then close it at the end of the while loop below. 
    print_r("<strong><p>This is the #$data_row[0] album:<br></strong>");


    for($i=1; $i<count($data_row); $i++){
        
        if($i<4){
            
            print_r("$first_line[$i]: $data_row[$i]<br>");
        } else {
            
            $genres = str_getcsv($data_row[$i]);
            
            for($j=0; $j<count($genres); $j++){
                
                print_r("$first_line[$i] #".($j+1)." is $genres[$j]<br>");
                if($j % 2 == 0){

                  print_r("<span style='color: blue;'>'$first_line[$i] #'.($j+1).' is $genres[$j]<br></span>");
                } else {
                  print_r("<span style='color: blue;'>'$first_line[$i] #'.($j+1).' is $genres[$j]<br></span>");
                }
                
            }
        }
    }

    
    print_r('</p>');
}

//Since we opened a file at the beginning of the script, we have to close it at the end. 
fclose($file_handle);
?>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
  </body>
</html>