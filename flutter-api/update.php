<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Max-Age: 86400');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
header('Access-Control-Expose-Headers: Content-Length, X-JSON');

include "../flutter-api/db.php";

$id = $_POST['id'];
$name = $_POST['name'];
$age = (int) $_POST['age'];
$email = $_POST['email'];
$phone = $_POST['phone'];

$stmt = $db->prepare("UPDATE tb_student SET name = ?, age = ?, email = ?, phone = ? WHERE id = ?");
$result =  $stmt->execute([$name, $age, $email, $phone, $id]);
echo json_encode([
    'success' => $result
]);
