<?php
session_start();
$sessName= $_SESSION["uname"];

// array to keep all studet's username

// To save entire student informations
$data = array();
// To save ids of all students for this marker
$student_ids = array();

// To save student emails
$student_emails = array();

// get fullname of marker 1
$marker1_name = get_full_name($sessName);

// To save ids of second markers of those students
$second_marker_ids = array();

// To save marker emails
$marker_emails = array();


// To get assigned slots (if any)
$assigned = array();

//To save assigned choices got from front end
$choice = "";



if (isset($_POST['markerName'])){



    //global $sessName;
    global $data;

    //$userName = $_POST['markerName'];

    $userName = $sessName;

    $student_names = get_All_Students($userName);
    $data['Names'] = $student_names;
    $data['Ids'] = $student_ids;
    $data['Semails'] = $student_emails;

    $marker_names = get_Second_Markers($student_ids);
    $data['Markers'] = $marker_names;
    $data['Memails'] = $marker_emails;

    $choices = get_Student_Preferences($student_ids);
    $data['Choices'] = $choices;
    $data['Assigned'] = $assigned;

    echo json_encode($data);


}


// if chocies are submitted
if (isset($_POST['submit'])){
    //global $choice;

    // convert choice value to int
    $choice = intval($_POST['choice']) ;
    $id = intval($_POST['id']);
    $s_usernames = $_POST['IDS'];         // all student usernames received from front end
    $s_emails = $_POST['Semails'];        // all student's emails received from front end

    $m_emails = $_POST['Memails'];  // all second marker's emails received from front end


    $sid = $s_usernames[$id - 1];        // assigned student's id
    $s_email = $s_emails[$id - 1];      // assigned student's email

    $m_email = $m_emails[$id - 1];       // assigned student's second marker's email

    //$second_marker_id = $second_marker_ids[$id-1];

    $return = assign_choice($sid, $choice);
    $mail_result = "default";

    //echo json_encode($s_email);


    if ($return) {
        $s_mail_result = sendMailtoStudents($sid, $s_email, $choice);
        $m_mail_result = sendMailtoMarker($sid, $m_email, $choice);
    }
    else
        echo json_encode("Sorry! slot couldn't be assigned");

    if($s_mail_result && (!$m_mail_result))
       echo json_encode("Slot has been assigned to the student and confirmation mail sent  to student.
                            Unfortunately! mail couldn't be sent to marker 2!");

    elseif ( (!$s_mail_result) && $m_mail_result)
        echo json_encode("Slot has been assigned to the student and confirmation mail sent  to marker 2.
                            Unfortunately! mail couldn't be sent to the student!");

    elseif ( (!$s_mail_result) && (!$m_mail_result) )
        echo json_encode("Slot has been assigned to the student.
                            Unfortunately! confirmation mail couldn't be sent to the student and marker 2!");
    else
        echo json_encode("Slot has been assigned to the student and
                            a confirmation mail has been sent to the student and marker 2!");

}


// function to ger all students for whom this marker is a FIRST marker
function get_All_Students($username){

    global $student_ids, $assigned, $student_emails ;
    $names = array();


    $connect=new PDO('mysql:host=localhost;dbname=project','root','');

    // query to get all students

    $students_query= "select distinct users.username, users.fname, users.lname, users.email_id from users ,relation 
                              where users.username = relation.susername AND (relation.marker1 = '$username')";


    $statement1=$connect->prepare($students_query);
    $statement1->execute();



    while ($row = $statement1->fetch(PDO::FETCH_ASSOC)) {

        $student_ids[]= $row['username'];
        $student_emails[] = $row['email_id'];

        $names[] = (ucfirst($row['fname'])." ". ucfirst($row['lname']));

        //Populate assigned to default 'Not Assigned Value'
        $assigned[] = "Not Assigned";



    }

    //$names = "misba";

    return $names;

}

// function to get studet's secomd markers
function  get_Second_Markers($student_ids){

    global $second_marker_ids,$marker_emails ;
    $names = array();


    $connect=new PDO('mysql:host=localhost;dbname=project','root','');


    foreach ($student_ids as $id) {
        // query to get marker 2

        $students_query = "select users.username, users.fname, users.lname, users.email_id from users ,relation 
                              where users.username = relation.marker2 AND (relation.susername = '$id')";


        $statement1 = $connect->prepare($students_query);
        $statement1->execute();
        $row = $statement1->fetch();

        $second_marker_ids[] = $row['username'];
        $marker_emails[] = $row['email_id'];
        $names[] = (ucfirst($row['fname']) . " " . ucfirst($row['lname']));



    }
    //$names = "misba";

    return $names;


}

// functions to get student prefrences and assigned if any
function  get_Student_Preferences($student_ids){

    global $assigned;

    $choices = array();

    $connect=new PDO('mysql:host=localhost;dbname=project','root','');

    // to keep track of current student in loop
    $index = 0;

    foreach ($student_ids as $id) {
        // query to get marker 2

        $students_query = "SELECT start_event,Assigned FROM student_preferences where username='$id' order by pref_order";

        $statement1 = $connect->prepare($students_query);
        $statement1->execute();

        $prefs = array();

        $count = 0;

        // Get all the prefs from the student
        while ($row = $statement1->fetch(PDO::FETCH_ASSOC)) {

            // check if assigned is 1 then get the preference number
            $assigned_pref = $row['Assigned'];

            if ($assigned_pref == '1'){

                $assigned[$index] = "Preference order: ".strval($count+1);

            }

            $slot = $row['start_event'];

            $start_slot = strtotime($slot);

            $end_slot = strtotime($slot) ;// convert start time

            $end_slot += 60 * 60;// getting the end time

            $full_slot = date('Y-m-d h:i a',$start_slot). " To ". date('h:i a',$end_slot);// full slot is being displayed in date format

            $prefs[] = $full_slot;

            $count+=1;

            // If choices are more than 3 (in case) then break the loop (get onl first three choices)
            if ($count > 3)
                break;


        }

        // if choices are less than 3 (in case)
        if ($count == 0) {
            $prefs[] = "Not Set";
            $prefs[] = "Not Set";
            $prefs[] = "Not Set";
        }
        else if ($count == 1) {
            $prefs[] = "Not Set";
            $prefs[] = "Not Set";
        }
        else if ($count == 2) {
            $prefs[] = "Not Set";
        }

        $choices[] = $prefs;

        $index++;

    }
    //$names = "misba";

    return $choices;


}

// function to assign choice to user
function assign_choice($sid, $choice){


    $connect=new PDO('mysql:host=localhost;dbname=project','root','');

    //set assigned to 0 if there are any for the use
    $delete_query = "UPDATE student_preferences SET Assigned = '0'
                        WHERE username ='$sid'  and Assigned= '1'";

    $statement1=$connect->prepare($delete_query);
    $result1 = $statement1->execute();


    $update_query= "UPDATE student_preferences SET Assigned = '1'
                        WHERE username = '$sid' and pref_order='$choice'";

    $statement2=$connect->prepare($update_query);
    $result12 = $statement2->execute();

    return ($result1 and $result12);

}

function sendMailtoStudents($student_id, $student_email, $choice_num){

    $slot = get_assigned_slot($student_id, $choice_num);

    // the message
    $subject = "Viva date allocation";
    $msg = "Dear Student, "."\n\n\n"."Your Viva date has been assigned on ".$slot.".";
    $headers = "From: examadmin@lecister.uni.com" . "\r\n" ;

    // use wordwrap() if lines are longer than 70 characters
    $msg = wordwrap($msg,70);

    // send email
    $result =  mail($student_email, $subject,$msg, $headers);

   return $result;


    //return "mail_default";

}

function sendMailtoMarker($student_id, $marker_email, $choice_num){

    global $marker1_name;

    // Get student's assigned choice
    $slot = get_assigned_slot($student_id, $choice_num);

    // the message
    $subject = "Viva date allocation for student ".$student_id ;
    $msg = "Dear marker,". "\n\n\n"."Prof. ". $marker1_name ." has assigned Viva date for student: ".$student_id. " on ".$slot.".";
    $headers = "From: examadmin@lecister.uni.com" . "\r\n" ;

    // use wordwrap() if lines are longer than 70 characters
    $msg = wordwrap($msg,70);

    // send email
    $result =  mail($marker_email, $subject,$msg, $headers);

    return $result;
}

function get_assigned_slot($student_id, $choice_num)
{
    // get assigned choice
    $connect = new PDO('mysql:host=localhost;dbname=project', 'root', '');
    $students_query = "SELECT start_event FROM student_preferences where username='$student_id' and pref_order='$choice_num'";

    $statement1 = $connect->prepare($students_query);
    $statement1->execute();
    $row = $statement1->fetch();


    $slot = $row['start_event'];

    $start_slot = strtotime($slot);

    $end_slot = strtotime($slot) ;// convert start time

    $end_slot += 60 * 60;// getting the end time

    $full_slot = date('d-m-Y',$start_slot). " at ".date('h:i a',$start_slot)." to ".date('h:i a',$end_slot);// full slot

    return $full_slot;

}

//Helpful to get first marker name
function get_full_name($username){

    $connect = new PDO('mysql:host=localhost;dbname=project', 'root', '');

// query to insert new time slots
    $name_query = "Select fname,lname from users where username= '$username'";

    $statement1 = $connect->prepare($name_query);
    $statement1->execute();
    $result = $statement1->fetch();

    $full_name  = ucfirst($result["fname"]) . " " . ucfirst($result["lname"]);

    return $full_name;

}

?>



