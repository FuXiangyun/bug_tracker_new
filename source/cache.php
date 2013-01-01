<?php

$id = $_GET['articleid'];
$bugid=$_GET['bugid'];
require 'BbsDetail.php';
$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '1234';
$details = new BbsDetail();
$details->Init($dbhost, $dbuser, $dbpass);
$details->addrenum($id,$bugid);
$details->close();
echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=../bbs2.html?articleid=$id&bugid=$bugid\">";
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
