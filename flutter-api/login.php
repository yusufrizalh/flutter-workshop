<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Max-Age: 86400');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
header('Access-Control-Expose-Headers: Content-Length, X-JSON');

// include "../flutter-api/db.php";

$db_name = "db_android";
$db_server = "localhost";
$db_user = "root";
$db_pass = "";
$conn = mysqli_connect($db_server, $db_user, $db_pass, $db_name);

$json = file_get_contents('php://input');

$obj = json_decode($json, true);

$email = $obj['email'];
$password = $obj['password'];

$loginQuery = "SELECT * FROM tb_users WHERE email = '$email' AND password = '$password'";
$result = mysqli_query($conn, $loginQuery);
$check = mysqli_fetch_array($result);

if (isset($check)) {
    $onLoginSuccess = 'Login matched!';
    $successMsg = json_encode($onLoginSuccess);
    echo $successMsg;
} else {
    $invalidMsg = 'Invalid username or password!';
    $invalidMsgJson = json_encode($invalidMsg);
    echo $invalidMsgJson;
}

mysqli_close($conn);
