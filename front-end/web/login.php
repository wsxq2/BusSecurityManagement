<?php
// Start the session
session_start();
?>

<?php 
$username=$_POST['username'];
$password=$_POST['password'];
try {
    $conn = new PDO("mysql:host=localhost;dbname=bus", 'wsxq', '658231');
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$conn->exec("set names utf8;");
	$rows=($conn->query("SELECT username,password FROM user_info WHERE username = '$username'"));
	$row= $rows->fetch();
    if($row['username']==$username &&$row['password']==$password){
        setcookie('uname',$username,time()+7200);
		$_SESSION['uname']=$username;
        echo "<script>window.location.href = 'main.php';</script>";
    }
    else echo "<script>alert('failed');</script>";

}
catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}
$conn =null;
?>


