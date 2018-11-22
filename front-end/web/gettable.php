<!DOCTYPE html>
<html>
<head>
<!--
<style>
table {
    width: 100%;
    border-collapse: collapse;
}

table, td, th {
    border: 1px solid black;
    padding: 5px;
}

th {text-align: left;}
</style>
-->
</head>
<body>

<?php

class TableRows extends RecursiveIteratorIterator {
    function __construct($it) {
        parent::__construct($it, self::LEAVES_ONLY);
    }

    function current() {
        //return "<td style='width:150px;border:1px solid black;'>" . parent::current(). "</td>";
        return "<td>" . parent::current(). "</td>";
    }

    function beginChildren() {
        echo "<tr>";
    }

    function endChildren() {
        echo "</tr>" . "\n";
    }
}

$q = intval($_GET['q']);
//echo "<table style='border: solid 1px black;'>";
echo "<table class='w3-table-all w3-hoverable'>";
$servername = "localhost";
$username = "wsxq";
$password = "658231";
$dbname = "bus";

try {
	$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
	$conn->exec('set names utf8;');
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	switch ($q) {
	case 'wzxx':
		//var_dump($table_fields);
		echo "<thead style='font-weight:bold'><tr class='w3-light-grey'><td>ID</td><td>司机工号</td><td>司机姓名</td><td>车辆</td><td>违章类型</td><td>时间</td><td>站点</td></tr></thead>";
		$stmt = $conn->prepare("SELECT ID,siji,xingming,cheliang,weizhangleixin,shijian,zhandian FROM WeiZhang,RenYuan WHERE WeiZhang.siji=RenYuan.gonghao ORDER BY shijian DESC;");
		$stmt->execute();

		// set the resulting array to associative
		$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
		foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) {
			echo $v;
		}
		break;
	case '1':
		$cd=$_GET['cd'];
		echo "<thead style='font-weight:bold'><tr class='w3-light-grey'><td>工号</td><td>姓名</td><td>性别</td></tr></thead>";
		$stmt = $conn->prepare("CALL get_siji_by_chedui($cd)");
		$stmt->execute();

		// set the resulting array to associative
		$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
		foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) {
			echo $v;
		}
		break;
	case '2':
		$sj=$_GET['sj'];
		$dt1=$_GET['dt1'];
		$dt2=$_GET['dt2'];

		echo "<thead style='font-weight:bold'><tr class='w3-light-grey'><td>ID</td><td>司机编号</td><td>司机姓名</td><td>驾驶车辆</td><td>违章类型</td><td>时间</td><td>站点</td></tr></thead>";
		$stmt = $conn->prepare("CALL get_weizhang_by_siji_and_datetime($sj,$dt1,$dt2)");
		$stmt->execute();

		// set the resulting array to associative
		$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
		foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) {
			echo $v;
		}
		break;
	case '3':
		$cd=$_GET['cd'];
		$dt1=$_GET['dt1'];
		$dt2=$_GET['dt2'];
		echo "<thead style='font-weight:bold'><tr class='w3-light-grey'><td>司机工号</td><td>司机姓名</td><td>违章类型</td><td>次数</td></tr></thead>";
		//echo "<thead style='font-weight:bold'><tr class='w3-light-grey'><td>违章类型</td><td>次数</td></tr></thead>";
		//$stmt = $conn->prepare("CALL get_weizhangtongji_by_chedui_and_datetime2($cd,$dt1,$dt2)");
		$stmt = $conn->prepare("CALL get_weizhangtongji_by_chedui_and_datetime($cd,$dt1,$dt2)");
		$stmt->execute();

		// set the resulting array to associative
		$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
		$result=$stmt->fetchAll();
		//var_dump($result);
		foreach(new TableRows(new RecursiveArrayIterator($result)) as $k=>$v) {
			echo $v;
		}
		echo "<p>（即";
		$temp='';
		$len=count($result);
		for ($i = 0; $i < $len; $i++) {
			if ($result[$i]['gonghao']!= $temp){
				$temp=$result[$i]['gonghao'];
				echo "<br />";
				echo $result[$i]['xingming'];
			}
			echo "，".$result[$i]['COUNT(*)']."次".$result[$i]['weizhangleixin'];
			
		}
		/*
		foreach ($result as $row) {
			echo "，".$row['COUNT(id)']."次".$row['weizhangleixin'];
		}
		 */
		echo "）</p><br />";
		break;
	default:

	}
}
catch(PDOException $e) {
	echo "Error: " . $e->getMessage();
}
$conn = null;

echo "</table>";
?>
</body>
</html>
