<?php

    $db= mysqli_connect('localhost','root','','localconnect');

    if(!$db){
        echo "Database Connection Failed";
    }

    $name = $_POST['name'];
    $email = $_POST['email'];
    $mobilenumber = $_POST['mobilenumber'];
    $address = $_POST['address'];
    $item = $_POST['item'];

    $sql = "INSERT INTO donator(name,email,mobilenumber,address,item) VALUES ('".$name."','".$email."','".$mobilenumber."','".$address."','".$item."')";

    $query = mysqli_query($db,$sql);

    if($query){
        echo json_encode("success");
    }
    else{
        echo json_encode("error");
    }


?>