<?php

session_start();
$userName= $_SESSION["uname"];
//print $userName;
$otherMarker ="";

if(isset($_POST['markerName'])){
    global $otherMarker;
    $otherMarker = $_POST['markerName'];

}




    $connect = new PDO('mysql:host=localhost;dbname=project', 'root', '');

    $data = array();//store events table data
    $query = "select * from insertdatetime WHERE markerUsername='$userName'";//WHERE markerUserName = :user ORDER BY id" ;//fetch data
    $statement = $connect->prepare($query);
//$statement->bindParam(':user', $userName, PDO::PARAM_STR);
    $statement->execute();
    $result = $statement->fetchAll();

    foreach ($result as $row)// foreach works onlyon array $row is value,fetch data from $result
    {
        $data[] = array(
            'id' => $row["id"],
            'title' => $row["title"],
            'start' => $row["start_event"],// [here comes database name] and start is a variable name
            'end' => $row["end_event"],
            'color' =>'steelblue',
            'borderColor' => 'Black',
            'textColor' => 'Snow',
            'overlap' => false
        );
    }


$connect = new PDO('mysql:host=localhost;dbname=project', 'root', '');

$query = "select * from insertdatetime WHERE markerUsername='$otherMarker'";//WHERE markerUserName = :user ORDER BY id" ;//fetch data
$statement = $connect->prepare($query);
//$statement->bindParam(':user', $userName, PDO::PARAM_STR);
$statement->execute();
$result = $statement->fetchAll();

foreach ($result as $row)// foreach works onlyon array $row is value,fetch data from $result
{
    $data[] = array(
        'id' => $row["id"],
        'title' => $row["title"],
        'start' => $row["start_event"],// [here comes database name] and start is a variable name
        'end' => $row["end_event"],
        'color' =>'Chocolate',
        'textColor' => 'Snow',
        'borderColor' => 'Black'

    );
}

echo json_encode($data);



?>