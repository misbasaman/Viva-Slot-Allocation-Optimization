<?php


session_start();
$sessName = $_SESSION["uname"];
//echo $sessName;                 //sent data back to requested page( simple.php)

// variables to save choices in databse
$recevied_choices =array();
$success = false;


// if the data sent by ajax is getMarkers then call getMarkers() function
if(isset($_POST['allMarkers'])){
    $markers = getMarkers();
    echo json_encode($markers);
}

if(isset($_POST['selectedMarker'])){
   // $markers = getMarkers();
    $selected = $_POST['selectedMarker'];

    // separate first name and lastname of the marker
    // to query his userid to get his availibility
    $arr=preg_split("/\s+(?=\S*+$)/",$selected);

    $fname = $arr[0];
    $lname = $arr[1];


    $connect=new PDO('mysql:host=localhost;dbname=project','root','');

    // query to get all markers

    $usertid_query="SELECT username FROM users WHERE type='marker' and fname='$fname' and lname = '$lname'";

    /*$marker_query = "select fname,lname from users where username='thomas1'";*/

    $statement1=$connect->prepare($usertid_query);
    $statement1->execute();
    $result = $statement1->fetch();

    $id = $result['username'];

    // send the userid back to front end
    echo json_encode($id);

}


// function to ger markers of the user (from session) and send back to front end
function getMarkers(){

    global $sessName;

    $data = array();

    $connect=new PDO('mysql:host=localhost;dbname=project','root','');

    // query to get all markers

    $marker1_query="SELECT fname,lname FROM users WHERE type='marker' and username!='$sessName' ORDER BY fname";

    /*$marker_query = "select fname,lname from users where username='thomas1'";*/

    $statement1=$connect->prepare($marker1_query);
    $statement1->execute();
    $result = $statement1->fetchAll(PDO::FETCH_ASSOC);

    foreach($result as $row) {


        $data[] = ucfirst($row['fname']) . " " . ucfirst($row['lname']);// show the first letter of the name in capital letters

    }

    return $data;

}