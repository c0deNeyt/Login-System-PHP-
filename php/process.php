<?php
    session_start();
    require ("new-connection.php");

    if(isset($_POST['request']) == 1){
        resetPass($_POST);
    }
    // LOGOUT
    if(isset($_POST['logoutAction']) == "logout"){
        logout();
    }
    if(isset($_POST['signEin']) == "signIn"){
        signInValidation($_POST);
    }
    // SIGN IN validation
    function signInValidation($post){
        $_SESSION['inputs']= array();
        foreach($post as $key => $value){
            $_SESSION['inputs'][$key] = $value;
        };
        $_SESSION['errors'] = array();
        //Contact Number Validation
        if(trim($post['cn'] == "")){
            $_SESSION['errors'][] =  "Contact number cannot be empty!.";
        }
        //password Validation
        if(trim($post['pw'] == "")){
            $_SESSION['errors'][] =  "Password cannot be empty!";
        }
        //BEGIN CHECKING DATA FROM DATABASE
        $contactNumber = escape_this_string($post['cn']);
        $password = escape_this_string($post['pw']);
        $query ="SELECT `users`.`contact_number`,
                        `users`.`password`,
                        CONCAT(`first_name`,' ', `last_name`) AS name,
                        `users`.`salt`
                FROM    `users`
                WHERE   `contact_number` = '{$contactNumber}'";
        $user = fetch_record($query);
        if(!empty($user)){
            $encryptedUserInput = md5($password . '' . $user['salt']);
            if($user['password'] == $encryptedUserInput){
                $_SESSION['smile'] = $user['name'];
                header("Location: user.php");
                die();
            }
            else{
                $_SESSION['errors'][] =  "Please provide registered password.";
            }
        }else{
            $_SESSION['errors'][] =  "Please provide registered contact number.";
        }
        header("Location: ../index.php");
        die();
    }

    if(isset($_POST['action']) == "register"){
        registerValidation($_POST);
    }
    //signup validation
    function registerValidation($post){
        $_SESSION['inputs']= array();
        foreach($post as $key => $value){
            $_SESSION['inputs'][$key] = $value;
        };
        $_SESSION['errors'] = array();
        //Name Validation
        if(trim($post['firstName'] == "") || (checkNUm($post['firstName']))){
            $_SESSION['errors'][] =  "First name cannot be empty or contain numbers.";
        }
        if(strlen($post['firstName']) < 2){
            $_SESSION['errors'][] =  "First name must have at least 2 characters.";
        }
        //Name Validation
        if(trim($post['lastName'] == "") || (checkNUm($post['lastName']))){
            $_SESSION['errors'][] =  "Last name cannot be empty or contain numbers.";
        }
        if(strlen($post['lastName']) < 2){
            $_SESSION['errors'][] =  "First name must have at least 2 characters.";
        }
        //Contact Number Validation
        if(trim($post['contactNumber'] == "") || (validateNum($post['contactNumber']) == false)){
            $_SESSION['errors'][] =  "Invalid contact number! eg.09123456789";
        }
        //password Validation
        if(trim($post['password'] == "") || (strlen($post['password']) < 8)){
            $_SESSION['errors'][] =  "Password cannot be empty && must be least 8 characters long";
        }
        //Confirm password Validation
        if($post['password'] != $post['confirmPassword']){
            $_SESSION['errors'][] =  "Password mismatch!";
        }
        if(count($_SESSION['errors']) <= 0){
            $fname = escape_this_string($post['firstName']);
            $lname = escape_this_string($post['lastName']);
            $number = escape_this_string($post['contactNumber']);
            $password = escape_this_string($post['password']);
            $salt = bin2hex(openssl_random_pseudo_bytes(22));
            $encrypted_password = md5($password . '' . $salt);

            $query = "INSERT INTO `users`
            (`first_name`,`last_name`,`contact_number`,`password`,`salt`,`update_time`)
            VALUES
            ('{$fname}','{$lname}','{$number}','{$encrypted_password}','{$salt}',now())";
            run_mysql_query($query);
            $_SESSION['successMsg'] = $post['firstName'];
        }
        header("Location: ./signup.php");
        die();
    }

    function validationMsg(){
        if(isset($_SESSION['inputs'])){
            //repopulating the input based on user input
            foreach($_SESSION['inputs'] as $key => $value){
                $_POST[$key] = $value;
            }
            unset($_SESSION['inputs']);
        }
        if(isset($_SESSION['errors']) && count($_SESSION['errors']) > 0){
            // $prevInputs  = $_SESSION['inputs'];
            $errors = $_SESSION['errors'];
            //creating error message
            $msgBox = "    <div class='errorField'>"."\r\n";
            foreach($errors as $key ){
                $msgBox .= "      <p>"."* ".$key."</p>"."\r\n";
            }
            $msgBox .= '    </div>'."\r\n";
            echo $msgBox;
            unset($_SESSION['errors']);
        }
        if(isset($_SESSION['successMsg'])){
            $msgBox = "    <div class='successMsg'>"."\r\n";
            $msgBox .= "      <p>Thanks! " .$_SESSION['successMsg']. " you are successfully signed up!</p>"."\r\n";
            $msgBox .= '    </div>'."\r\n";
            echo $msgBox;
            unset($_SESSION['successMsg']);
            unset($_POST);
        }
    }
    //reset password and set to "village88"
    function resetPass($post){
        $defaultPass = "village88";
        $number = escape_this_string($post['phoneNumber']);
        $password = escape_this_string($defaultPass);
        $salt = bin2hex(openssl_random_pseudo_bytes(22));
        $encrypted_password = md5($password . '' . $salt);

        $query ="UPDATE `users`
                SET
                `password` = '{$encrypted_password}',
                `salt` = '{$salt}',
                `update_time` = now()
                WHERE `contact_number` = '{$number}'";
        $dataState = run_mysql_query($query);
        echo json_encode($dataState);
        exit;
    }
    // destroy session and redirect to the signup page
    function logout(){
        session_destroy();
        header("location: ../index.php");
    }
    //name validator
    function checkNUm($x){
        for($c=0;$c<strlen($x);$c++){
            if(is_numeric($x[$c])){
                return true;
            }
        }
    }
    //phone number validation
    function validateNum($num){
    if((strlen($num) == 11) && is_numeric($num)){
        $prefix = '';
        for($c=0;$c<strlen($num)-9;$c++){
            $prefix .= $num[$c];
        }
        return($prefix == '09')? true : false;
        }
        else{
            return false;
        }
    }
?>