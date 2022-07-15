<?php

    $db = mysqli_connect('localhost', 'root', '', 'localconnect');

    if(!$db){
        echo "Database Connection Failed";
    }
    
    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM users WHERE username = '".$username."' AND password = '".$password."' ";
    // $sql="SELECT * FROM WHERE username = '$username' AND password = '$password' ";
    $result = mysqli_query($db, $sql);
    $count = mysqli_num_rows($result);

    if($count>=1){
        echo json_encode("success");
    }
    else{
        echo json_encode("error");
    }

 ?>