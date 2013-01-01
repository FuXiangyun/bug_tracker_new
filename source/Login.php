
<?php
header("Content-type:text/html;charset=utf-8");
include("../DBO/DBO.php");
$username = $_POST['username'];
$password = $_POST['password'];
echo $username;
DBO::InitDB();
$result = DBO::LoginCheck($username, $password);
echo $result;
if ($result == "ok") {
    session_start();
    $_SESSION['UserName'] = $username;
    echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=../index.html\">";
    exit();
} else if ($result == "密码错误" || $result == "用户不存在") {
    echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=../login.html\">";
}
?>
