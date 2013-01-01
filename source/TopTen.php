<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of TopTen
 *
 * @author chuzhenyang
 */
class TopTen {

    //put your code here
    function connect($dbhost, $dbuser, $dbpass) {
        $this->conn = mysql_connect($dbhost, $dbuser, $dbpass);
        if (!$this->conn) {
            die('Could not connect to mysql');
        }

//    echo "connected successfully!<br>"; 
    }

    function findtopten() {
        mysql_select_db("bbs_database", $this->conn);
        $sql = 'SELECT * FROM softwarebug order by SoftwareBugNum desc';
        $this->retval = mysql_query($sql, $this->conn);
        if (!$this->retval) {
            die('Could not get data: ');
        }

        $num = mysql_num_rows($this->retval);
//   echo $num;
        if ($num >= 10) {
            $sql = 'SELECT * FROM softwarebug order by SoftwareBugNum desc limit 0,10';
            $this->retval = mysql_query($sql, $this->conn);
        }
    }

    function findtoptenforuser() {
        mysql_select_db("bbs_database", $this->conn);
        $sql = 'SELECT * FROM userinfo order by BugNum desc';
        $this->retval1 = mysql_query($sql, $this->conn);
        if (!$this->retval1) {
            die('Could not get data: ');
        }

        $num = mysql_num_rows($this->retval1);
//   echo $num;
        if ($num >= 10) {
            $sql = 'SELECT * FROM softwarebug order by SoftwareBugNum desc limit 0,10';
            $this->retval1 = mysql_query($sql, $this->conn);
        }
    }
    function updatebugnum($software) {
         mysql_select_db("bbs_database", $this->conn);
        $sql = "SELECT * FROM softwarebug where SoftwareName like '$software'";
        echo $sql;
        $retra = mysql_query($sql, $this->conn);
        if (!$retra) {
            die('Could not get data: ');
        }
        if(mysql_num_rows($retra)==0)
        {
               $sql="INSERT INTO softwarebug(SoftwareName,SoftwareBugNum) VALUES('$software','0')";
               mysql_query($sql, $this->conn);
        }
        else
        {
        while ($row = mysql_fetch_array($retra)) {
            $num=$row['SoftwareBugNum']+1;
            $id=$row['Sid'];
            $sql="UPDATE softwarebug SET SoftwareBugNum = '$num' WHERE Sid='$id'";
             mysql_query($sql, $this->conn);
        }
        }
       
    }
    function close() {
        mysql_close($this->conn);
    }

}

?>
