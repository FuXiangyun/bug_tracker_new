<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ArticleView
 *
 * @author chuzhenyang
 */
class ArticleView {

    //put your code here
    function Init($dbhost, $dbuser, $dbpass) {
        $this->conn = mysql_connect($dbhost, $dbuser, $dbpass);
        if (!$this->conn) {
            die('Could not connect to mysql');
        }
    }

    function getallbbs($bugid) {
        mysql_select_db("bbs_database", $this->conn);
        $sql = "SELECT * FROM bbs_article where IsTop='1' AND BugID='$bugid' order by PostTime desc";
        $this->retval1 = mysql_query($sql, $this->conn);
        if (!$this->retval1) {
            die('Could not get data: ');
        }
        $num1 = mysql_num_rows($this->retval1);
        $this->first = $num1;
        $sql = "SELECT * FROM bbs_article where IsTop!='1' AND BugID='$bugid' order by PostTime desc";
        $this->retval3 = mysql_query($sql, $this->conn);
        if (!$this->retval3) {
            die('Could not get data: ');
        }
    }

    function getbbsbynum($page,$bugid) {
        mysql_select_db("bbs_database", $this->conn);
        if ($page == 1) {

            $size = 10 - $this->first;
            $sql = "SELECT * FROM bbs_article where IsTop!='1' AND BugID='$bugid' order by PostTime desc limit 0,$size";
            $this->retval2 = mysql_query($sql, $this->conn);
            if (!$this->retval2) {
                die('Could not get data: ');
            }
        }
        if ($page > 1) {
            $pp = ($page - 1) * 10 - $this->first;
            $sql = "SELECT * FROM bbs_article where IsTop!='1' AND BugID='$bugid' order by PostTime desc limit $pp,10";
            $this->retval2 = mysql_query($sql, $this->conn);
            if (!$this->retval2) {
                die('Could not get data: ');
            }
        }
    }

    function addbbs($username, $title, $detail, $time,$bugid) {
        mysql_select_db("bbs_database", $this->conn);
        $num = 0;
        $sql = "INSERT INTO bbs_article(ReNum,ClickNum,UserName,Title,Detail,PostTime,IsTop,BugID) VALUES('$num','$num','$username','$title','$detail','$time','$num','$bugid')";
        $check = mysql_query($sql, $this->conn);

        if (!$check) {
            die('Could not get data: ');
        }
    }

    function deletebbs($id) {

        mysql_select_db("bbs_database", $this->conn);
        $sql = "DELETE FROM reply where ArticleID=$id";
        echo $sql;
        $check1 = mysql_query($sql, $this->conn);
        $sql = "DELETE FROM bbs_article where ArticleID=$id";
        echo $sql;
        $check = mysql_query($sql, $this->conn);

        if (!$check1) {
            die('Could not get data: ');
        }
        if (!$check1) {
            die('Could not get data: ');
        }
    }

    function close() {
        mysql_close($this->conn);
    }

}

?>
