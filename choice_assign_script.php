<?php

$choice = "";

// if chocies are submitted
if (isset($_POST['submit'])){
    //global $choice;
   $choice = $_POST['choice'];

}

?>


<html>
<body>

Your email address is: <?php echo $choice; ?>

</body>
</html>
