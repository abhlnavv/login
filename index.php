<?php

$servername = "localhost";
$username = "root";
$password = "";


$con = mysqli_connect($servername, $username, $password);
//echo "Connection is succesfull";


$name =$_POST['name'];
$email =$_POST['email'];
$phone =$_POST['phone'];
$date =$_POST['date'];


$sql= "INSERT INTO `p1`.`p1` (`name`, `email`, `phone`, `date`, `dt`) VALUES
 ('$name', '$email', '$phone', '$date', current_timestamp());";
     //echo $sql;

  if($con->query($sql) == true){
    echo $name;
    echo '<br>';
    echo "WELCOME TO OUR COMMUNITY";
}

  $con->close();
?>













