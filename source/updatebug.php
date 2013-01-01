<?php
header("Content-type:text/html;charset=utf-8");
session_start();
$id = $_GET['bugid'];
$type = $_POST['dropdown'];
$bugproname = $_POST['soft'];
$bugtag = $_POST['tag'];
$bugdes = $_POST['textfield'];
$bugname = $_POST['name'];
$username = $_SESSION['UserName'];
if ($type == 1)
    $bugos = "Windows";
if ($type == 2)
    $bugos = "Linux";
if ($type == 3)
    $bugos = "Android";
if ($type == 4)
    $bugos = "IOS";
if ($type == 5)
    $bugos = "其他";

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
if ($username) {
    require 'Bug.php';
    $dbhost = 'localhost';
    $dbuser = 'root';
    $dbpass = '1234';
    $bug = new Bug();
    $bug->Init($dbhost, $dbuser, $dbpass);
    if ($_FILES["file4"]["name"] != null)
    $bug->updatebug($id, $bugos, $bugproname, $bugtag, $bugdes, $bugname,"../upload/" . $_FILES["file4"]["name"]);
    else
        $bug->updatebug($id, $bugos, $bugproname, $bugtag, $bugdes, $bugname,$_FILES["file4"]["name"]);
    $bug->close();
    echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=../person.html?username=$username\">";
}
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
