<?php

header("Content-type:text/html;charset=utf-8");
require 'Bug.php';
require 'TopTen.php';
$now = getdate(time());
$cur_wday = $now['wday'];
$date = date("Y-m-d H:i:s $cweekday[$cur_wday]");
$bugname = $_POST['bugname'];
$sofname = $_POST['sofname'];
$type = $_POST['sysname'];
if ($type == 1)
    $sysname = "Windows";
if ($type == 2)
    $sysname = "Linux";
if ($type == 3)
    $sysname = "Android";
if ($type == 4)
    $sysname = "IOS";
if ($type == 5)
    $sysname = "其他";
$tagname = $_POST['tagname'];
$text = $_POST['text'];
if ($text == null)
    $text = "未填写";
if ($_FILES["file4"]["name"] == !null) {
    if ($_FILES["file4"]["error"] > 0) {
        echo "Return Code: " . $_FILES["file4"]["error"] . "<br />";
    } else {
        if (file_exists("../upload/" . $_FILES["file4"]["name"])) {
            echo $_FILES["file4"]["name"] . " already exists. ";
        } else {
            $path = "../upload/" . iconv("utf-8", "gbk", $_FILES["file4"]["name"]);
            move_uploaded_file($_FILES["file4"]["tmp_name"], $path);
            if (is_uploaded_file($_FILES['file4']['tmp_name'])) {
                echo "上传失败!";
            }
        }
    }
}
session_start();
$username = $_SESSION['UserName'];
if ($username) {
    $dbhost = 'localhost';
    $dbuser = 'root';
    $dbpass = '1234';
    $buginfo = new Bug();
    $top = new TopTen();
    $buginfo->Init($dbhost, $dbuser, $dbpass);
    if ($_FILES["file4"]["name"] != null)
        $buginfo->addbug($username, $date, "../upload/" . $_FILES["file4"]["name"], $sysname, $sofname, $tagname, $text, $bugname);
    else
        $buginfo->addbug($username, $date, $_FILES["file4"]["name"], $sysname, $sofname, $tagname, $text, $bugname);
    $buginfo->close();
    $top->connect($dbhost, $dbuser, $dbpass);
    $top->updatebugnum($sofname);
    $top->close();
}

echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=../person.html?username=$username\">";
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
