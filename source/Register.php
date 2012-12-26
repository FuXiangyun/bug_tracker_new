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

echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=../login.html;\">";
?>
