
<?php
include("../DBO/DBO.php");
echo "login.php start!";
$username = $_POST['username'];
$password = $_POST['password'];
DBO::InitDB();
$result = DBO::LoginCheck($username,$password);

if($result == "正确")
  {
    echo "correct";
    session_start();
    $_SESSION['UserName'] = $username;
    echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=../index.html;\">";
    exit();
  }
else if($result == "密码错误" || $result == "用户不存在")
  {
    echo "wrong";
    echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=../login.html;\">";
  }



?>
