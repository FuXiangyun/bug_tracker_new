<?php

include("..DBO/DBO.php");
echo "register start!";
$username = $_POST['username'];
$password = $_POST['password'];
$usernickname = $_POST['usernickname'];
$email = $_POST['email'];
$question = "";
$answer = "";
$signdetail = "";
$havepic = "";
$picname = "";
DBO::InitDB();
$result = DBO::register($username,$password,$usernickname,$email,$question,$answer,$signdetail,$havepic,$picname);
echo "result is:";
echo $result;
if($result == "success")
  echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=../login.html;\">";
else 
  {
    echo "已有的用户名";
    echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"3;URL=../registe.html;\">";
  }
?>
