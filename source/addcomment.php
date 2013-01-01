<?php

header("Content-type:text/html;charset=utf-8");
session_start();
$bugid=$_GET['bugid'];
$detail = $_POST['comment'];
$now = getdate(time());
$cur_wday = $now['wday'];
$date = date("Y-m-d H:i:s $cweekday[$cur_wday]");
$username = $_SESSION['UserName'];
$id = $_SESSION['ArticleID'];
if ($username) {
    require 'BbsDetail.php';
    $dbhost = 'localhost';
    $dbuser = 'root';
    $dbpass = '1234';
    $articles = new BbsDetail();
    $articles->Init($dbhost, $dbuser, $dbpass);
    $articles->addcomment($username, $date, $detail, $id);
    $articles->close();
    echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=../bbs2.html?articleid=$id&bugid=$bugid\">";
} else {
    echo 'Please first login';
}
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
