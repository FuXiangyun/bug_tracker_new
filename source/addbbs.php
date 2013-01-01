<?php

header("Content-type:text/html;charset=utf-8");
session_start();
$bugid=$_GET['bugid'];
$tittle = $_POST['name'];
$detail = $_POST['comment'];
$now = getdate(time());
$cur_wday = $now['wday'];
$date = date("Y-m-d H:i:s $cweekday[$cur_wday]");
$username = $_SESSION['UserName'];
if ($username) {
    require 'ArticleView.php';
    $dbhost = 'localhost';
    $dbuser = 'root';
    $dbpass = '1234';
    $articles = new ArticleView();
    $articles->Init($dbhost, $dbuser, $dbpass);
    $articles->addbbs($username, $tittle, $detail, $date,$bugid);
    $articles->close();
    echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=../bbs.html?bugid=$bugid\">";
} else {
    echo 'Please first login';
}
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
