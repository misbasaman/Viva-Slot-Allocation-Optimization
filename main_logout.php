<?php
session_start(); // start session
session_destroy(); // destroying session
header("Location:main_login.html");// after logging out redirecting to login1.html



?>