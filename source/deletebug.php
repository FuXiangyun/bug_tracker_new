<?php

$id = $_GET['bugid'];
require 'Bug.php';
$dbhost = 'localhost';
$dbuser = 'root';
$dbpass = '1234';
$bug = new Bug();
$bug->Init($dbhost, $dbuser, $dbpass);
$bug->deletebug($id);
$bug->close();
echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=../person.html\">";
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
