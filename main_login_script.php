<?php
ob_start();// output is stored in this internal buffer
session_start();// staring session according to the current user
$data     = array();//passing the data to the success function
$redirect = array();// passing redirect url to correct page
$message  = array();// stores all the messages

$con = mysqli_connect('localhost', 'root', '', 'project');// establishing the connection with database

$username3 = $_POST['username2'];// storing the user name password from the ajax page to these variables
$password3 = $_POST['password2'];
//$type3     = $_POST['type2'];

//$area='mysore';

$login_date=date('Y-m-d h:i:s');// tracking users last login date and time into database


$query = "SELECT * from users WHERE  username= '$username3'";// selecting all the user names whose value matches with username stored in database
//and  password='$password3' and type='$type3'";

$time_query="UPDATE users SET lastlogin='$login_date' WHERE username='$username3'"; // updating the user last login in database

//$message['info'] = $q;

$run = mysqli_query($con, $query);// executing the query

$check_entry = mysqli_num_rows($run);// extracting number of rows




//$time_query = "UPDATE users SET lastlogin='$login_date' where username=$username3";



$row=mysqli_fetch_array($run);// fetching each row in array


// trial part

//$addressuser=$run;



// trial end above



if($check_entry ==0){ // condition to check if there are no matching username and password in the ddatabase

    //$message['error']= $row;
   $message['error'] = 'Username or password is incorrect'; // mesaage displayed using ajax



}

elseif ( $row['password'] == md5($password3) && $row['type'] == 'Student') // if there is a row which matches the username then here checking if the password and type matches
{ // if matched then

    $login_date=date('Y-m-d h:i:s'); //track last login
    $q =  mysqli_query($con, $time_query); // run time_query for updating the last login
    //$message['info'] = $q;
    $_SESSION["uname"] = $username3;// session for the current logged in user
    $redirect['redirect']  = "./student.html"; //redirect to this page if type=student
    $message['success']    = "ok";// pass this message to succes function in ajax



}
elseif ($row['password'] == md5($password3) && $row['type'] == 'Marker') {
// if user name and password is matched

   $q= mysqli_query($con, $time_query);//run time_query for updating the last login
    $_SESSION["uname"] = $username3;//session for the current logged in user
    $redirect['redirect']  = "./marker.html"; //redirect to this page if type=marker
    $message['success']    = "ok";// pass this message to succes function in ajax
}

else{

   
    $message['error'] = 'Password is incorrect. Please try again!';// error message password is incorrect
}






$data['message']   = $message;// passing the message to $data to be displayed in the ajax page
$data['redirects'] = $redirect;// passing the url for redirection

ob_end_clean();// discard the buffer contents

echo json_encode($data);// displaying the data
?>