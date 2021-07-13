<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Max-Age: 86400');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
header('Access-Control-Expose-Headers: Content-Length, X-JSON');

include "../flutter-api/db.php";

$name = $_POST['name'];
$age = (int) $_POST['age'];
$email = (int) $_POST['email'];
$phone = (int) $_POST['phone'];
$stmt = $db->prepare("INSERT INTO tb_student (name, age, email, phone) VALUES (?, ?, ?, ?)");
$result = $stmt->execute([$name, $age, $email, $phone]);
echo json_encode([
    'success' => $result
]);
