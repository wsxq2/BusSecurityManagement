<?php
$servername = "localhost";
$username = "wsxq";
$password = "658231";
$dbname = "bus";
try {
	$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
	$conn->exec('set names utf8;');
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	if (isset($_POST["table_name"])) {
		$insert_statement='';
		switch ($_POST["table_name"]) {
		case 'renyuan':
			$insert_statement="insert into RenYuan(gonghao,xingming,xingbie,zhiwei) values(".$_POST['gonghao'].",'".$_POST['xingming']."','".$_POST['xingbie']."','".$_POST['zhiwei']."')";
			break;
		case 'siji':
			$insert_statement="insert into SiJi(gonghao,suoshuxianlu) values(".$_POST['gonghao'].",'".$_POST['suoshuxianlu']."')";
			break;
		case 'cheliang':
			echo $_POST;
			$insert_statement="insert into CheLiang(chepaihao,suoshuxianlu,zuoshu,beizhuxinxi) values('".$_POST['chepaihao']."',".$_POST['suoshuxianlu'].",".$_POST['zuoshu'].",'".$_POST['beizhuxinxi']."')";
			break;
		case 'weizhang':
			$insert_statement="insert into WeiZhang(siji,cheliang,weizhangleixin,shijian,zhandian) values(".$_POST['siji'].",'".$_POST['cheliang']."','".$_POST['weizhangleixin']."','".$_POST['shijian']."','".$_POST['zhandian']."')";
			break;
		default:

			break;
		}
		echo $insert_statement.'<br />';
		$affected_rows=$conn->exec($insert_statement);
		echo '<p class="w3-large">'.($affected_rows==1?"插入数据成功 ^_^":"插入数据失败 -_-").'</p>';
	}
}
catch(PDOException $e){
	echo "Error: " . $e->getMessage();
}
$conn = null;
?>

