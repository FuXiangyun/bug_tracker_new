<?php

session_start();
$id = $_GET['bugid'];
$bugos = $_POST['dropdown'];
$bugproname = $_POST['soft'];
$bugtag = $_POST['tag'];
$bugdes = $_POST['textfield'];
$bugname = $_POST['name'];
$username = $_SESSION['UserName'];
if ($username) {
    require 'Bug.php';
    $dbhost = 'localhost';
    $dbuser = 'root';
    $dbpass = '1234';
    $bug = new Bug();
    $bug->Init($dbhost, $dbuser, $dbpass);
    $bug->updatebug($id, $bugos, $bugproname, $bugtag, $bugdes, $bugname);
    $bug->close();
    echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=../person.html?username=$username\">";
}
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
