<?php
session_start();
$idd = $_SESSION['ArticleID'];
$id = $_GET['commentid'];
 require 'BbsDetail.php';
    $dbhost = 'localhost';
    $dbuser = 'root';
    $dbpass = '1234';
    $articles = new BbsDetail();
    $articles->Init($dbhost, $dbuser, $dbpass);
    $articles->deletecomment($id,$idd);
    $articles->close();
    echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=../bbs2.html?articleid=$idd\">";
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
