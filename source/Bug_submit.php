<?php

include("..DBO/DBO.php");
echo "bug submit start!";
$Category = $_POST['Category'];
$BugName = $_POST['BugName'];
$BugProgName = $_POST['BugProgName'];
$BugTag = $_POST['BugTag'];
$BugPicPath = $_POST['Attach'];
$BugDes = $_POST['BugDes'];
$BugTime = $_POST['BugTime'];
$BugOs = "";
$ContactTel = $_POST['ContactTel'];
$ContactQQ = $_POST['ContactQQ'];
$ContactMail = $_POST['ContactMail'];
DBO::InitDB();
if (!$BugName || !$BugProgName || !$BugDes)
  {
    echo "invalid submit";
    echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=../bug-submit.html;\">";
  }
else
  {
    session_start();
    $username = $_SESSION['username'];
    if (!$username)
      {
	echo "no log in";
	echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=../bug-submit.html;\">";
      }
    else
      {
	$result = DBO::upload_bug($username,$BugPicPath,$BugOS,$BugProgName,$BugTag,$BugDes,$BugName);
	if($result == -1)
	  {
	    echo "submit failed";
	    echo "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0;URL=../bug-submit.html;\">";
	  }
	else
	  {
	    $_SESSION['bugid'] = $result;
	  }
      }
    exit();
  }
?>