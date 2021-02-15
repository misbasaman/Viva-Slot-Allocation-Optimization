
<?php

session_start();
$sessionName=$_SESSION['uname'];

//$userName1='neil123';// save username to test
//$userName2='thomas1';

if(isset($_POST['slots'])){
    getCommonSlot();
}

function getCommonSlot($userName1,$userName2)

{
    $common_hour_start_time = array();
    global $sessionName;
    $connect = new PDO('mysql:host=localhost;dbname=project', 'root', ''); //connecting to db

    $query1 = "select * from insertdatetime WHERE markerUserName='$userName1'";// query for getting details from the table
    $statement1 = $connect->prepare($query1);
    $success1 = $statement1->execute();

    $slot_duration = 30 * 60; // minimum split duration in secs i.e 30min to 30*60 sec
    $result1 = $statement1->fetchAll(PDO::FETCH_ASSOC);//returns array index by column name, array will be with column name not index numbers
    $array_of_time1 = array();// initialise array

    foreach ($result1 as $row1)//value of current element $result1 is asigned to $row on each iteration
    {
        print "<br>";
        $title1 = $row1['title'];// storing the value of columns from database into variables
        print $title1;
        print "<br>";
        $start1 = $row1['start_event'];
        print $start1;
        print "<br>";
        $end1 = $row1['end_event'];
        print $end1;
// split time in 60 mins
        $start_time1 = strtotime($start1);// convert string to datetime
        $end_time1 = strtotime($end1);
        $duration1 = '30'; // minimum split duration


        $duration_secs1 = $duration1 * 60;   //converting mins to secs

        $current_end1 = $start_time1 + $duration_secs1;//end of current slot

        while ($current_end1 <= $end_time1) // end_time= endof whole time
        {
            $array_of_time1[] = date("Y-m-d H:i", $start_time1);// storing the start event time in array
            $start_time1 += $duration_secs1;// next slot's start time and end time of previous  slot
            $current_end1 += $duration_secs1;// to take time slots until end of time
        }
    }
    print '<pre>';
    print_r($array_of_time1);// print start and end times with 30 min slots
    print '</pre>';
    $count1 = count($array_of_time1);// count number of total slots after split
    print "The time between and start and end has been split into half hour slot: {$count1}";

    print "<br>";

    print "<br>";

    print "<br>";

    print "<br>";

    print " look for thomas ";

    print "<br>";

    $query2 = "select * from insertdatetime WHERE markerUserName='$userName2'";
    $statement2 = $connect->prepare($query2);
    $success2 = $statement2->execute();


    $result2 = $statement2->fetchAll(PDO::FETCH_ASSOC);

    $array_of_time2 = array();// initialise array

    foreach ($result2 as $row2) {
        $title2 = $row2['title'];
        print $title2;
        print "<br>";
        $start2 = $row2['start_event'];
        print $start2;
        print "<br>";
        $end2 = $row2['end_event'];
        print $end2;

        $start_time2 = strtotime($start2);
        $end_time2 = strtotime($end2);
        $duration2 = '30'; // duration of viva

        $duration_secs2 = $duration2 * 60;   //converting mins to secs
        $current_end2 = $start_time2 + $duration_secs2;// initialising end time for the current 1 hour slot

        while ($current_end2 <= $end_time2) {
            $array_of_time2[] = date("Y-m-d H:i", $start_time2);
            $start_time2 += $duration_secs2;  // next slot's start time
            $current_end2 += $duration_secs2;  // nxt slot's end time
        }

    }


    print '<pre>';
    print_r($array_of_time2);// print time slots
    print '</pre>';
    $count2 = count($array_of_time2);// count number of slots, -1 coz array starts from 0
    print "The time between and start and end has been split into half hour slot: {$count2}";

    print "<br>";

    print "<br>";


    $common_slots = array();

// get half an hour common slots

    foreach ($array_of_time1 as $marker1_slot) {//here comparision is in string

        foreach ($array_of_time2 as $marker2_slot) {

            if ($marker1_slot === $marker2_slot)
                $common_slots[] = $marker1_slot;

        }

    }


//  print"<br>";
    $var = count($common_slots);
    print "common half hours time slots: {$var} <br>";// if half common found updating common start time in common_slots array

// Check for two consecutive half hour common slots

    $common_hour_slots_count = 0;// for my reference


//index variable for common slots array
    $index = 0;// to iterate every common slot

    while ($index < count($common_slots) - 1) {//-1 e.g 6 and 7 are in consecutive and it has to jump to 8 and 8 is not there so -1.
        $current_slot = strtotime($common_slots[$index]);//converting to time to perform the addition and sub
        $next_slot = strtotime($common_slots[$index + 1]);

        if ($current_slot + $slot_duration == $next_slot) {// example current-slot=10+30 min(duration)==10:30
            $common_hour_slots_count += 1;// it will become 10-11 here increase count by 1
           // $common_hour_start_time = array();
            $common_hour_start_time[] = date("Y-m-d h:i a", $current_slot);// 10 am will be saved in array
            $index += 2;//if in consecutive testing the other slot
        }


    }

//  print "<br>";
    print "Total common 1 hour slots between two markers: {$common_hour_slots_count}";

// echo "<br>";
    print_r($common_hour_start_time);

}


?>

