
<?php
include("../DBO/DBO.php");
//echo "search start!";
DBO::initDB();

$content = $_POST['searchbar'];
$conn = mysql_connect(DBO::$dbserver,DBO::$dbuser,DBO::$dbpassword);
if($conn)
  {
    mysql_select_db("bbs_database",$conn) or die ("cant select database");
    mysql_query("SET NAMES gb2312");
    $sql = "select BugUploadedTime,UserName,BugProgName,BugName,BugDes 
FROM bbs_database\.bugdetail 
where BugProgName='"+$content+
"'  or BugDes='"+$content+
"' or UserName='"+$content+"';";
    mysql_query($sql);
    $result = mysql_query('select @result');
    $array = mysql_fetch_array($result);
    $i = 0;
    $j = 0;
    $line ="";
    echo "<html lang=\"en\" dir=\"ltr\">";
    echo "<head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><title>搜索结果</title></head><body> ";
    /*<script language=\"javascript\">
function next()
{
document.write(
\"<a href='javascript:history.go(-1)'>����</a>   &nbsp;&nbsp;
<a href='javascript:history.go(0)'>ˢ��</a>&nbsp;&nbsp;
<a href='javascript:history.go(1)'>ǰ��</a>  
<form>  
<input name='ht' type='button' onclick='javascript:history.go(-1)' value='����' />   
<input name='sx' type='button' onclick='javascript:history.go(0)' value='ˢ��' />   
<input name='qj' type='button' onclick='javascript:history.go(1)' value='ǰ��' />   
</form> \");
}
</script>*/

    
    while($array[$i])
      {
	$line += $array[$i];
	$line += "    \t";
	$i++;$j++;
	if($j == 5)
	  {
	    echo $line;
	    $line = "";
	    $j = 0;
	  }
      }
    echo "<form><input value=\"后退\ onclick='javascript:history.go(-1)'/></form>";
    echo "</body>";
    mysql_close($conn);
  }
?>