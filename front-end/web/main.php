<!--
main.php
登陆后进入的页面，即主页面
-->

<?php
session_start();
if( !isset($_SESSION['uname']) ){
	echo "<script>window.location.href = 'index.php';</script>";
}
?>
<!DOCTYPE html>
<html>
<title>公交安全管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/w3.css">
<style>

body {font-family: "Roboto", sans-serif}
.w3-bar-block .w3-bar-item{padding:16px;font-weight:bold}
</style>
<body>

<nav class="w3-sidebar w3-bar-block w3-collapse w3-animate-left w3-card" style="z-index:3;width:250px;" id="mySidebar">
  <a class="w3-button w3-teal" style="width:50%" href="/main.php">Home</a> <a style="width:120px" class="w3-button" href="index.php?out=1">退出登陆</a>
  <div>
    <a class="w3-bar-item w3-button w3-light-green" href="javascript:void(0)" onclick="myAccordion('useful-query')">常用查询 &darr;</a>
      <div id="useful-query" class="w3-show">
        <a class="w3-bar-item w3-button" href="javascript:void(0)" onclick="uq('1')">查询某个车队下的司机基本信息</a>
        <a class="w3-bar-item w3-button" href="javascript:void(0)" onclick="uq('2')">查询某名司机在某个时间段的违章详细信息</a>
        <a class="w3-bar-item w3-button" href="javascript:void(0)" onclick="uq('3')">查询某个车队在某个时间段的违章统计信息</a>
      </div>
  </div>
  <div>
    <a class="w3-bar-item w3-button w3-light-green" onclick="myAccordion('all-table')" href="javascript:void(0)">录入数据 &darr;</a>
    <div id="all-table" class="w3-show">
      <a class="w3-bar-item w3-button" href="javascript:void(0)" onclick="insert_data('人员')">人员</a>
      <a class="w3-bar-item w3-button" href="javascript:void(0)" onclick="insert_data('队长')">队长</a>
      <a class="w3-bar-item w3-button" href="javascript:void(0)" onclick="insert_data('路队长')">路队长</a>
      <a class="w3-bar-item w3-button" href="javascript:void(0)" onclick="insert_data('车队')">车队</a>
      <a class="w3-bar-item w3-button" href="javascript:void(0)" onclick="insert_data('线路')">线路</a>
      <a class="w3-bar-item w3-button" href="javascript:void(0)" onclick="insert_data('车辆')">车辆</a>
      <a class="w3-bar-item w3-button" href="javascript:void(0)" onclick="insert_data('司机')">司机</a>
      <a class="w3-bar-item w3-button" href="javascript:void(0)" onclick="insert_data('违章')">违章</a>
    </div>
  </div>
</nav>


<div class="w3-main" style="margin-left:250px;">


<header class="w3-container w3-theme w3-teal" >
  <h1 class="w3-xxlarge">公交安全管理系统</h1>
</header>
<br /> <br />

<div id="table" class='w3-container'></div>

<br/>
<br/>

<footer class="w3-container w3-theme w3-teal" style="padding:32px">
  <p style="text-align:center">© 2018 wsxq2. All rights reserved. Contact: wsxq2@qq.com</p>
</footer>
     
</div>

<script>

// Accordions
function myAccordion(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
		x.className=x.className.replace("w3-hide","w3-show");
    } else { 
        x.className = x.className.replace("w3-show", "w3-hide");
    }
}
</script>

<script src="js/my.js"></script>


</body>
</html> 

