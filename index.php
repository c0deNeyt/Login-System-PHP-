<?php
   include('php/process.php');
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title> Authentication | WEB</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./image/favicon.png">
    <link rel="stylesheet" href="./css/normalize.css">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="js/jquery-ui-1.13.2/jquery-ui.min.css">
    <link rel="stylesheet" href="css/sweetalert2.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery.min.js" defer></script>
    <script src="js/bootstrap.bundle.min.js" defer></script>
    <script src="js/jquery.min.js" defer></script>
    <script src="js/jquery-ui-1.13.2/jquery-ui.min.js" defer></script>
    <script src="js/sweetalert2.all.min.js" defer></script>
    <script src="js/index.js" defer></script>
  </head>
  <body>
    <div class="wrapper">
        <h5 class="card-title">SIGN IN</h5>
<?= validationMsg();?>
        <form enctype="multipart/form-data"  autocomplete="off" class="form" action="php/process.php" method="post">
          <input type="hidden" name="signEin" value="signIn">
          <label>Contact Number:
            <input value="<?= isset($_POST['cn']) ? htmlspecialchars($_POST['cn'], ENT_QUOTES) : ''; ?>" type="text" name="cn" placeholder="Contact Number">
          </label>
          <label class="password">Password:
            <input value="<?= isset($_POST['pw']) ? htmlspecialchars($_POST['pw'], ENT_QUOTES) : ''; ?>" type="password" name="pw" placeholder="Password">
          </label>
          <a class="resetPass signUp" href="#">Forgot Password</a>
          <a class="signUp" href="php/signup.php">Sign up</a>
          <input type="submit" class="registerBtn" value="Login">
        </form>
    </div>
  </body>
</html>
