<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Bug
 *
 * @author chuzhenyang
 */
class Bug {

    function Init($dbhost, $dbuser, $dbpass) {
        $this->conn = mysql_connect($dbhost, $dbuser, $dbpass);
        if (!$this->conn) {
            die('Could not connect to mysql');
        }
    }

    function getallbugbyuser($username) {
        mysql_select_db("bbs_database", $this->conn);
        $sql = "SELECT * FROM bugdetail where UserName='$username'";
        $this->retval1 = mysql_query($sql, $this->conn);
        if (!$this->retval1) {
            die('Could not get data: ');
        }
    }

    function getallbug() {
        mysql_select_db("bbs_database", $this->conn);
        $sql = "SELECT * FROM bugdetail";
        $this->retval = mysql_query($sql, $this->conn);
        if (!$this->retval) {
            die('Could not get data: ');
        }
    }

    function getbugbyid($id) {
        mysql_select_db("bbs_database", $this->conn);
        $sql = "SELECT * FROM bugdetail where BugID='$id'";
        $this->retval4 = mysql_query($sql, $this->conn);
        if (!$this->retval4) {
            die('Could not get data: ');
        }
    }

    function getbugbynum($page, $kind) {
        mysql_select_db("bbs_database", $this->conn);
        if ($kind == 1) {
            $pp = ($page - 1) * 10;
            $sql = "SELECT * FROM bugdetail order by BugName limit $pp,10";
        }
        if ($kind == 2) {
            $pp = ($page - 1) * 10;
            $sql = "SELECT * FROM bugdetail order by BugProgName limit $pp,10";
        }
        if ($kind == 3) {
            $pp = ($page - 1) * 10;
            $sql = "SELECT * FROM bugdetail order by BugUploadedTime desc limit $pp,10";
        }
        if ($kind == 4) {
            $pp = ($page - 1) * 10;
            $sql = "SELECT * FROM bugdetail order by UserName desc limit $pp,10";
        }
        $this->retval2 = mysql_query($sql, $this->conn);
        if (!$this->retval2) {
            die('Could not get data: ');
        }
    }
    function getusernum($page,$username) {
        mysql_select_db("bbs_database", $this->conn);
        $pp = ($page - 1) * 10;
            $sql = "SELECT * FROM bugdetail where UserName='$username' order by BugUploadedTime desc limit $pp,10 ";
             $this->retval2 = mysql_query($sql, $this->conn);
        if (!$this->retval2) {
            die('Could not get data: ');
        }
    }
    function getpath($id) {
         mysql_select_db("bbs_database", $this->conn);
         $sql = "SELECT * FROM bugdetail where BugID='$id'";
         $this->retvall = mysql_query($sql, $this->conn);
        if (!$this->retvall) {
            die('Could not get data: ');
        }
    }
    function addbug($username, $date, $path, $bugos, $bugproname, $bugtag, $bugdes, $bugname) {
        mysql_select_db("bbs_database", $this->conn);

        $sql = "INSERT INTO bugdetail(BugUploadedTime,UserName,BugPicPath,BugOS,BugProgname,BugTag,BugDes,BugName) VALUES('$date','$username','$path','$bugos','$bugproname','$bugtag','$bugdes','$bugname')";
        $check = mysql_query($sql, $this->conn);
        if (!$check) {
            die('Could not get data: ');
        }
    }

    function updatebug($id, $bugos, $bugproname, $bugtag, $bugdes, $bugname) {
        mysql_select_db("bbs_database", $this->conn);
        $sql = "UPDATE bugdetail SET BugOS='$bugos',BugProgname='$bugproname',BugTag='$bugtag',BugDes='$bugdes',BugName='$bugname' WHERE BugID='$id'";
        $check = mysql_query($sql, $this->conn);
        if (!$check) {
            die('Could not get data: ');
        }
    }

    function deletebug($bugid) {
        mysql_select_db("bbs_database", $this->conn);
        $sql = "DELETE FROM bugdetail where BugID=$bugid";
        echo $sql;
        $check = mysql_query($sql, $this->conn);
        if (!$check) {
            die("Couldn't get data");
        }
    }

    function close() {
        mysql_close($this->conn);
    }

    //put your code here
}

?>
