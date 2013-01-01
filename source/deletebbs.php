<?php
$id = $_GET['bbsid'];
require 'ArticleView.php';
    $dbhost = 'localhost';
    $dbuser = 'root';
    $dbpass = '1234';
    $articles = new ArticleView();
    $articles->Init($dbhost, $dbuser, $dbpass);
    $articles->deletebbs($id);
    $articles->close();
    echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=../bbs.html\">";
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
