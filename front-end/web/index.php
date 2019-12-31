<!--
index.php
默认页面，用于登陆的页面
-->

<?php
session_start();
?>

<!DOCTYPE html>
<html>
<title>欢迎访问公交安全管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/w3.css">
<body>

<header class="w3-container w3-center w3-teal">
  <h1>欢迎访问公交安全管理系统</h1>
</header>

<div class="w3-container w3-margin-top" style="margin:auto;width:25%">

<form name="login-form" method="post" action="/login.php" class="w3-container w3-card-4 ">

<p>
<label>用户名:</label>
<input name="username" class="w3-input w3-round w3-border" type="text" required>
</p>

<p>
<label>密码:</label>
<input name="password" class="w3-input w3-border" type="password" required>
</p>

<p>
<button name="submit" type="submit" class="w3-button w3-section w3-teal" style="margin:auto;width:30%;display:block"> 登陆 </button>
</p>

</form>

</div>
<?php 
$flag=0;
if(isset($_GET["out"])){
    if($_GET["out"]){
        setcookie('uname','',time()-1);
		session_unset();
		session_destroy();
        $flag=1;//防止服务器接收到getout操作时已经认为该用户有cookie，然后下面的COOKIE[NAME]已经有了，服务器返回给他的才是空的
    }
}
if($flag!=1 && isset($_COOKIE['uname'])){
	if ($_SESSION['uname']==$_COOKIE['uname']) {
		echo "<script>window.location.href = 'main.php';</script>";
	}
}
?>



</body>
</html> 
