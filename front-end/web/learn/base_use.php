<?php

$x=12;
$str='hello the world!';
$flo=12.3241;
$b=true;
$arr=Array(1,2,3,4,5);
$nu=NULL;

class Car
{
	function Car()
	{
		$this->model='VW';
	}
	
}

$cla=new Car();
echo $cla->model;

echo '<br><br>';
var_dump($x);
echo '<br>';
var_dump($str);
echo '<br>';
var_dump($flo);
echo '<br>';
var_dump($b);
echo '<br>';
var_dump($nu);
echo '<br>';
var_dump($arr);
echo '<br>';
var_dump($cla);
echo '<br><br>';

echo 'strlen($str): '.strlen($str);
echo '<br>';
echo 'strrev($str): '.strrev($str);
echo '<br>';
echo 'strpos("Hello world!", "world"): '.strpos("Hello world!", "world"); // outputs 6
echo '<br>';
echo 'str_replace("world", "Dolly", "Hello world!"): '.str_replace("world", "Dolly", "Hello world!"); // outputs Hello Dolly!
echo '<br><br>';

define("GREETING", "Welcome to W3Schools.com!", true);
echo greeting.'<br><br>';

echo 'Operators: <br>';
echo 'Arithmetic: +, -, *, /, %, **<br>';
echo 'Assignment: =, +=, -=, *=, /=, %=, .=<br>';
echo 'Comparison: ==, ===, !=, !==, >, <, >=, <=<br>';
echo 'In/Decrement: ++$x, $x++, --$x, $x--<br>';
echo 'Logical: &&, ||, !, xor<br>';
echo 'String: .<br>';
echo 'Array: +, ==, ===, !=, !==<br><br>';

$t = date("H");

if ($t < "10") {
    echo "Have a good morning!";
} elseif ($t < "20") {
    echo "Have a good day!";
} else {
    echo "Have a good night!";
}

echo '<br><br>';
$favcolor = "red";

switch ($favcolor) {
    case "red":
        echo "Your favorite color is red!";
        break;
    case "blue":
        echo "Your favorite color is blue!";
        break;
    case "green":
        echo "Your favorite color is green!";
        break;
    default:
        echo "Your favorite color is neither red, blue, nor green!";
}
echo '<br><br>';

$x = 1;

while($x <= 5) {
    echo "The number is: $x <br>";
    $x++;
}
echo '<br><br>';

do {
    echo "The number is: $x <br>";
    $x++;
} while ($x <= 10);

$x=1;
echo '<br><br>';

for ($x = 0; $x <= 10; $x++) {
    echo "The number is: $x <br>";
}
echo '<br><br>';

$colors = array("red", "green", "blue", "yellow");
foreach ($colors as $value) {
    echo "$value <br>";
}
echo '<br><br>';

function writeMsg($a,$name='world') {
    echo "$a: Hello $name!";
	return $name;
}
writeMsg(1); // call the function
echo '<br><br>';

$cars = array("Volvo", "BMW", "Toyota");
$arrlength = count($cars);
for($x = 0; $x < $arrlength; $x++) {
    echo $cars[$x];
    echo "<br>";
}
echo '<br><br>';

$age = array("Peter"=>"35", "Ben"=>"37", "Joe"=>"43");

foreach($age as $x => $x_value) {
    echo "Key=" . $x . ", Value=" . $x_value;
    echo "<br>";
}
echo '<br><br>';

?>

sort() - sort arrays in ascending order<br>
rsort() - sort arrays in descending order<br>
asort() - sort associative arrays in ascending order, according to the value<br>
ksort() - sort associative arrays in ascending order, according to the key<br>
arsort() - sort associative arrays in descending order, according to the value<br>
krsort() - sort associative arrays in descending order, according to the key<br>

<br>
The PHP superglobal variables are:<br>

$GLOBALS<br>
$_SERVER<br>
$_REQUEST<br>
$_POST<br>
$_GET<br>
$_FILES<br>
$_ENV<br>
$_COOKIE<br>
$_SESSION<br>
