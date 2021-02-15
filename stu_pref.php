<?php

    session_start();
    $sessName = $_SESSION["uname"];
    $unamePhp= "Hey Misba!";
    $name=$_POST['userName'];
    echo $sessName;                 //sent data back to requested page( simple.php)



?>

