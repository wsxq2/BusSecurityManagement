<?php 
$flag=0;
//var_dump($_GET);
if(isset($_GET["out"])){
    if($_GET["out"]){
        setcookie('uname','',time()-1);
        $flag=1;//防止服务器接收到getout操作时已经认为该用户有cookie，然后下面的COOKIE[NAME]已经有了，服务器返回给他的才是空的
    }
}
if($flag!=1){
    $link=mysqli_connect('localhost','root','liqiyao123','test');
    if(isset($_COOKIE['uname'])){
        $name=$_COOKIE['uname'];
        $query=mysqli_query($link,"SELECT username FROM info WHERE username = '$name'");
        $row=mysqli_num_rows($query);
        if($row==1){
            echo "Welcome ".$_COOKIE['uname']."";
            echo '    ';
            echo '<a href="index.php?out=1">logout</a>';//用户logout
        }
    }else{
        echo  '<a href="login.html">login</a>';
        echo  '    ';
        echo  '<a href="register.html">register</a>';
    }
}
else{
    echo  '<a href="login.html">login</a>';
    echo  '    ';
    echo  '<a href="register.html">register</a>';
}?>
