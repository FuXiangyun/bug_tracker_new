<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>捉虫——The Bug Tracker</title>

<link rel="stylesheet" href="styles/layout.css" type="text/css">
</head>

<body>
<?php
include_once("DBO.php");
include_once("fileop.php");
$object = new DBO();


//InitDB_FILE();


DBO::InitDBO("localhost","root","");
//$array  = $object->LoginCheck("fuxiangyun","fuxiangyun");
echo $array[0];

echo "</br>".section2."</br>";


echo DBO::LoginCheck("傅相云2号","1");

echo DBO::register('傅相云2号','1','1','450306159@qq.com','question','answer','a','1','picname');


?>



</body>
</html>
