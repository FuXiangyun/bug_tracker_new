<?php

session_start();
$id = $_GET['bugid'];
echo $id;
$username = $_SESSION['UserName'];
echo $username;
if ($username) {
    require 'Bug.php';
    $dbhost = 'localhost';
    $dbuser = 'root';
    $dbpass = '1234';
    $bug = new Bug();
    echo $id;
    $bug->Init($dbhost, $dbuser, $dbpass);
    $bug->getpath($id);
    $row = mysql_fetch_array($bug->retvall);
    $file = $row['BugPicPath'];
    header('Content-Description: File Transfer');
    header('Content-Type: application/octet-stream');
    header('Content-Disposition: attachment; filename=' . basename($file));
    header('Content-Transfer-Encoding: binary');
    header('Expires: 0');
    header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
    header('Pragma: public');
    header('Content-Length: ' . filesize($file));
    ob_clean();
    flush();
    readfile($file);
    exit;
}
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
