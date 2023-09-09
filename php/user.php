<?php
   include('process.php');
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title> Authentication I | WEB</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./image/favicon.png">
    <link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../js/jquery-ui-1.13.2/jquery-ui.min.css">
    <link rel="stylesheet" href="../css/sweetalert2.css">
    <link rel="stylesheet" href="../css/style.css">
  </head>
  <body>
    <div class="wrapper">
    <h5 class="card-title">WELCOME TO THE TRAINING</h5>
    <h5 class="card-title"><?= $_SESSION['smile'];?></h5>
    <img src="../image/smile-slow.gif" alt="Smile">
    <iframe width="612" height="313" src="https://www.youtube.com/embed/o7qsDqGkia0" title="Joma" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <form action="process.php" method="post">
    <input type="hidden" name="logoutAction" value="logout">
      <input type="submit" class="logoutBtn" value="Logout">
    </form>
    </div>
  </body>
</html>