<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Max-Age: 86400');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
header('Access-Control-Expose-Headers: Content-Length, X-JSON');

include "../flutter-api/db.php";

$id = (int) $_POST['id'];
$stmt = $db->prepare("SELECT name, age, email, phone FROM tb_student WHERE id = ?");
$stmt->execute([$id]);
$result = $stmt->fetch(PDO::FETCH_ASSOC);
echo json_encode([
    'result' => $result
]);
