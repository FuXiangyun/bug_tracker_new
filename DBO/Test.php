<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta http-equiv="Content-T%ype" content="text/html; charset=utf-8" />
<title>捉虫——The Bug Tracker</title>

<link rel="stylesheet" href="styles/layout.css" type="text/css">
</head>

<body>
<?php
include_once("DBO.php");




//InitDB_FILE();

 
//DBO::InitDBO("localhost","root","");

DBO::InitDB();
echo DBO::LoginCheck("fuxiangyun","fuxiangyun");


echo "</br>".section2."</br>";
echo DBO::upload_bug("傅相云2号" ,"BugPicPath", "BugOS", "BugProgName", "BugTag", "BugDes","BugName");
echo DBO::register('傅相云2号','1','1','450306159@qq.com','question','answer','a','1','picname');


?>



</body>
</html>
