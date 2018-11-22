<?php 
$username=$_POST['username'];
$password=$_POST['pass'];
$realname=$_POST['realname'];
$phonenumber=$_POST['phonenumber'];
$link = mysqli_connect('localhost','root','liqiyao123','test');
if($_POST['submit']){
    if(mysqli_query($link,"insert into info (username,password,realname,phonenumber) values('$username','$password','$realname','$phonenumber')")){
        setcookie("uname",$username,time()+7200);
       echo "<script>alert('successfully');window.location= 'index.php';</script>";
    }else {
        echo "<script>alert('failed');history.go(-1)</script>";
    }
}
include('register.html');?>
