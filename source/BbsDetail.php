<?php

class BbsDetail {

    function Init($dbhost, $dbuser, $dbpass) {
        $this->conn = mysql_connect($dbhost, $dbuser, $dbpass);
        if (!$this->conn) {
            die('Could not connect to mysql');
        }
    }

    function getdetail($id) {
        mysql_select_db("bbs_database", $this->conn);
        $sql = "SELECT * FROM bbs_article where ArticleID='$id'";
        $this->retval1 = mysql_query($sql, $this->conn);
        if (!$this->retval1) {
            die('Could not get data: ');
        }
        $sql = "SELECT * FROM reply where ArticleID='$id'";
        $this->retval2 = mysql_query($sql, $this->conn);
        if (!$this->retval2) {
            die('Could not get data: ');
        }
    }

    function addrenum($id) {
        mysql_select_db("bbs_database", $this->conn);
        $sql = "SELECT * FROM bbs_article where ArticleID='$id'";
        $re = mysql_query($sql, $this->conn);
        if (!$re) {
            die('Could not get data: ');
        }
        $row = mysql_fetch_array($re);
        $this->renum = $row["ReNum"];
        $this->clicknum = $row["ClickNum"];
        $newclicknum = $this->clicknum + 1;
        $sql = "UPDATE bbs_article SET ClickNum = '$newclicknum' WHERE ArticleID='$id'";
        mysql_query($sql, $this->conn);
    }

    function addcomment($username, $time, $detail, $id) {
        mysql_select_db("bbs_database", $this->conn);
        $sql = "INSERT INTO reply(UserName,ReplyTime,ReplyDetail,ArticleID) VALUES('$username','$time','$detail','$id')";
        $check = mysql_query($sql, $this->conn);
        if (!$check) {
            die('Could not get data: ');
        } else {
            $sql = "SELECT * FROM bbs_article where ArticleID='$id'";
            $re = mysql_query($sql, $this->conn);
            if (!$re) {
                die('Could not get data: ');
            }
            $row = mysql_fetch_array($re);
            $this->renum = $row["ReNum"];
            $newrenum = $this->renum + 1;
            $sql = "UPDATE bbs_article SET ReNum = '$newrenum' WHERE ArticleID='$id'";
            mysql_query($sql, $this->conn);
            $sql = "UPDATE bbs_article SET PostTime = '$time' WHERE ArticleID='$id'";
            mysql_query($sql, $this->conn);
        }
    }

    function deletecomment($id, $idd) {
        mysql_select_db("bbs_database", $this->conn);
        $sql = "DELETE FROM reply where Rid=$id";
        $check = mysql_query($sql, $this->conn);
        $sql = "SELECT * FROM bbs_article where ArticleID='$idd'";
        $re = mysql_query($sql, $this->conn);
        if (!$re) {
            die('Could not get data: ');
        }
        $row = mysql_fetch_array($re);
        $this->renum = $row["ReNum"];
        $newrenum = $this->renum - 1;
        $sql = "UPDATE bbs_article SET ReNum = '$newrenum' WHERE ArticleID='$idd'";
        mysql_query($sql, $this->conn);
        if (!$check) {
            die('Could not get data: ');
        }
    }

    function close() {
        mysql_close($this->conn);
    }

}

//$id=$_GET['articleid'];
//$name=$_GET['username'];
//echo $id;
//echo $name;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
?>
