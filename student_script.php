<?php

session_start();
$sessName = $_SESSION["uname"];
//echo $sessName;                 //sent data back to requested page( simple.php)

// variables to save choices in databse
$recevied_choices =array();
$success = false;


// if the data sent by ajax is getMarkers then call getMarkers() function
if(isset($_POST['getMarkers'])){
   $markers = getMarkers();
   echo json_encode($markers);
}

if(isset($_POST['available'])){

    // array to send available common slots and selcted pref (from databse) to front end
    $data =array();

    $selected = load_preferences();
    $available =  loadAvailableSlots();


    $data['available'] = $available;
    $data['selected'] = $selected;

    //echo json_encode("Hi Faizan! Misba was very rude today!");
    echo json_encode($data);

    }

if(isset($_POST['submit'])){

   // echo json_encode($_POST['choices']);

    global $recevied_choices;
    $recevied_choices =$_POST['choices'];

    global $success;
    $success = save_prefrences($recevied_choices);

    if($success)
        echo json_encode("success");
    else
        echo json_encode("failed");


}

// function to ger markers of the user (from session) and send back to front end
function getMarkers(){

    global $sessName;

    $data = array();

    $connect=new PDO('mysql:host=localhost;dbname=project','root','');

    // query to get marker 1

    $marker1_query="select users.fname, users.lname from relation,users where relation.susername='$sessName' 
                        and users.username = relation.marker1";

    /*$marker_query = "select fname,lname from users where username='thomas1'";*/

    $statement1=$connect->prepare($marker1_query);
    $statement1->execute();
    $result = $statement1->fetch();

    $data['marker1'] = ucfirst($result['fname'])." ". ucfirst($result['lname']);// show the first letter of the name in capital letters

    //query to get marker 2
    $marker2_query="select users.fname, users.lname from relation,users where relation.susername='$sessName' 
                        and users.username = relation.marker2";

    /*$marker_query = "select fname,lname from users where username='thomas1'";*/

    $statement1=$connect->prepare($marker2_query);
    $statement1->execute();
    $result2 = $statement1->fetch();

    $data['marker2'] = ucfirst($result2['fname'])." ". ucfirst($result2['lname']);// show the first letter of the name in capital letters



    $name = array("fname" => 'misba', "lname"=> 'saman');
   // $names = "misba";

    return $data;

}

// Show available marker's common available time slots to user
function loadAvailableSlots()
{
    global $sessName;

    // get user's both markers' ids

    $markers = array();

    $connect=new PDO('mysql:host=localhost;dbname=project','root','');

    $marker_query="SELECT marker1,marker2 from relation where susername='$sessName'";

    $statement1=$connect->prepare($marker_query);
    $statement1->execute();
    $result = $statement1->fetch();

    $markers[] = $result["marker1"];
    $markers[] = $result["marker2"];

    // get their common time slots
    $common_hour_start_time = getCommonHourSlots($markers[0], $markers[1]);


    // remove slots which users have already slected (if any)
    $user_choices = get_preferences_start();

    foreach ($user_choices as $selected){
       //remove entry in an array by its value
        if (($key = array_search($selected, $common_hour_start_time)) !== false)
        {
            unset($common_hour_start_time[$key]);
        }
    }


    // Show the time slots to the table list
    $output = '';
    $id = 1;                        //variable used as div id example at 1 item1 , 2 item 2
    foreach ($common_hour_start_time as $slot) {

        $start_slot = strtotime($slot);

        $end_slot = strtotime($slot) ;// convert start time

        $end_slot += 60 * 60;// getting the end time

        $full_slot = date('Y-m-d h:i a',$start_slot). " To ". date('h:i a',$end_slot);// full slot is being displayed in date format
        //from the above i have removed Y-m-d for not showing the date in end slot

        $output .= "<li id='" . $id . "'>" . $full_slot . "</li>";// displaying the slot in li
        $id++;
    }
    return $output;

}


//calculate common 1 hour time slots (begin time) of two markers
function getCommonHourSlots($marker1, $marker2 ){

    $slot_duration =30*60; // minimum split duration in secs

    // half hour time slots of marker1
    $array_of_time1 = splitIntoHalfSlots($marker1);
    $count1=count($array_of_time1);// count number of slots, -1 coz array starts from 0

    // half hour time slots of marker2
    $array_of_time2  = splitIntoHalfSlots($marker2);
    $count2=count($array_of_time2);// count number of slots, -1 coz array starts from 0

    $common_slots =array();

// calculate half an hour common slots
    foreach($array_of_time1 as $marker1_slot){

        foreach($array_of_time2 as $marker2_slot){

            if ($marker1_slot === $marker2_slot)
                $common_slots[] = $marker1_slot;

        }

    }

    $common_hour_slots_count = 0;
    $common_hour_start_time=array();

//index variable for common slots array
    $index= 0;

    while($index < count($common_slots)-1 ){

        $current_slot = strtotime($common_slots[$index]);
        $next_slot = strtotime($common_slots[$index+1]);

        if($current_slot+$slot_duration == $next_slot) {
            $common_hour_slots_count += 1;
            $common_hour_start_time[] = date("Y-m-d H:i",$current_slot);
            $index +=2;
        }

        // if common not found then increment
        else
            $index++;

    }

   return $common_hour_start_time;

}

// get and devide marker's all available time in half hour time slots
function splitIntoHalfSlots($marker){

    $connect=new PDO('mysql:host=localhost;dbname=project','root',''); //connecting to db

    $query="select * from insertdatetime WHERE markerUserName='$marker'";// query
    $statement=$connect->prepare($query);
    $success1 =  $statement->execute();

    $slot_duration =30*60; // minimum split duration in secs


    $result1=$statement->fetchAll(PDO::FETCH_ASSOC);
    $array_of_half_time=array();// initialise array

    //convert marker's availability into half hour slots
    foreach ($result1 as $row) {

        $start = $row['start_event'];
        $end = $row['end_event'];

// split time in 60 mins
        $start_time = strtotime($start);
        $end_time = strtotime($end);
        $duration = 30; // minimum split duration


        $duration_secs = $duration * 60;   //converting mins to secs

        $current_end = $start_time + $duration_secs;

        while ($current_end <= $end_time) {
            $array_of_half_time[] = date("Y-m-d H:i", $start_time);
            $start_time += $duration_secs;// next slot's start time and end time of this slot
            $current_end += $duration_secs;
        }
    }

    return $array_of_half_time;


}

// Save prefrences got from  front-end to the databse for respected user
function  save_prefrences($received_data){

    global $sessName;       // username of current session

    $connect= new PDO( 'mysql:host=localhost; dbname=project', 'root', '' );

    // delete user's previous prefrences if any

    $delete_pref = "DELETE FROM student_preferences WHERE student_preferences.username='$sessName'";
    $stmt1 = $connect->prepare($delete_pref);
    $success = $stmt1->execute();           // returns true if query successfully executed



    // iterrator for each entry in data
    $itr = 1;

    foreach ($received_data as $data){

        $connect= new PDO( 'mysql:host=localhost; dbname=project', 'root', '' );

        // convert it into timestamp
        $start_time = strtotime(explode("To",$data)[0]);
        $end_time = $start_time + (60 * 60) ;               // add 60 minitues to get end time stamp


        // convert timestamps to 24-hrs date formagt to save them to DB
        $start_slot = date("Y-m-d H:i",$start_time);
        $end_slot = date("Y-m-d H:i",$end_time);

        $pref_query = "INSERT INTO student_preferences(username, start_event, end_event, pref_order) VALUES ('$sessName','$start_slot','$end_slot','$itr')";
        $stmt3 = $connect->prepare($pref_query);
        $success1 = $stmt3->execute();           // returns true if query successfully executed
        $itr++;

    }

    return $success1;


}

// function to load user's selected prefrences (if any)
function load_preferences()
{
    $output1='';

    // get start slots of student's selected choices
    $start_slots = get_preferences_start();

    $id = 1;

    // calculate end slot and format full slot string to display on front-end
    foreach($start_slots as $slot){


        $start_slot = strtotime($slot);

        $end_slot = strtotime($slot) ;// convert start time

        $end_slot += 60 * 60;// getting the end time

        $full_slot = date('Y-m-d h:i a',$start_slot). " To ". date('h:i a',$end_slot);// full slot is being displayed in date format
        //from the above i have removed Y-m-d for not showing the date in end slot

        $output1 .= "<li id='" . $id . "'>" . $full_slot . "</li>";// displaying the slot in li
        $id++;
    }

    return $output1;

}


// function to get start slots of user's prefrences (from databse)
function get_preferences_start()
{

    global $sessName;
    $start_slots = array();

    $connect = new PDO('mysql:host=localhost; dbname=project', 'root', '');

    $pref_query = "SELECT start_event FROM student_preferences WHERE username='$sessName' ORDER BY pref_order";
    $stmt = $connect->prepare($pref_query);
    $stmt->execute();

    $id = 1;
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

        // convert time slot got from db into consistent format with others
        $time = strtotime($row['start_event']);
        $start_slots[] = date("Y-m-d H:i",  $time);


    }

    return $start_slots;
}

?>
