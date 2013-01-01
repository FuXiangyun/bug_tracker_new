<?php
session_start();
unset($_SESSION['UserName']);
echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=../index.html\">";
exit();
?>