<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>׽�桪��The Bug Tracker</title>

<link rel="stylesheet" href="styles/layout.css" type="text/css">
</head>

<body>
<?php
include_once("DBO.php");




//InitDB_FILE();

 
//DBO::InitDBO("localhost","root","");

DBO::InitDB();
echo DBO::LoginCheck("������2��","1");
//echo "������";


echo "</br>".section2."</br>";
echo DBO::upload_bug("������2��" ,"BugPicPath", "BugOS", "BugProgName", "BugTag", "BugDes","BugName");
echo DBO::register('������2��','1','1','450306159@qq.com','question','answer','a','1','picname');


?>



</body>
</html>
