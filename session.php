<?php

session_start();
$sessName = $_SESSION["uname"];
//echo $sessName;                 //sent data back to requested page( simple.php)


if($sessName==true) {

    $connect = new PDO('mysql:host=localhost;dbname=project', 'root', '');

// query to insert new time slots
    $name_query = "Select fname,lname from users where username= '$sessName'";

    $statement1 = $connect->prepare($name_query);
    $statement1->execute();
    $result = $statement1->fetch();

    echo ucfirst($result["fname"]) . " " . ucfirst($result["lname"]);

}

else
{
    session_destroy();
    header('location:session.php');
}


?>
