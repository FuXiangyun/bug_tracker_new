<?php

include_once("DBO.php");
function InitDB_FILE()
{               
	$i = 0;
	$file_handle = fopen("dbconfig.ini", "r");
	while (!feof($file_handle)) {
	   $line = fgets($file_handle);
	   $begin = strpos($line, '=');
	   $line = substr($line,$begin+1);
	   $array[$i] = $line;
	   $i = $i+1;
 	   //echo $i;
	   //echo $line."</br>";
	}
	//print_r($array);
	fclose($file_handle);

}

//InitDB_FILE();
//echo $object->register('������2��','1','1','450306159@qq.com','question','answer','a','1','picname');
?>
