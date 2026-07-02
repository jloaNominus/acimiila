<?php

/**
 * Autoloader manual simple para empezar (reemplazable por Composer después)
 */
spl_autoload_register(function ($class_name) {
    // Convierte Namespace\Clase a path/to/Clase.php
    $class_name = str_replace('AciMiila\\', '', $class_name);
    $path = __DIR__ . '/../src/' . str_replace('\\', '/', $class_name) . '.php';
    if (file_exists($path)) {
        require_once $path;
    }
});

header("Content-Type: application/json; charset=UTF-8");

use AciMiila\Core\Database;
use AciMiila\Repositories\PerRepository;

// 1. Inicializar conexión
$database = new Database();
$db = $database->getConnection();

// 2. Instanciar Repositorio
$perRepo = new PerRepository($db);

/** 
 * Endpoints: 
 * 1. GET /index.php?id=17          -> Persona completa (Detalle)
 * 2. GET /index.php?email=gmail    -> Lista por búsqueda de email
 * 3. GET /index.php                -> Lista general
 */
$id = $_GET['id'] ?? null;
$emailSearch = $_GET['email'] ?? null;

if ($id) {
    // Caso 1: Detalle individual
    $data = $perRepo->getById($id);
} elseif ($emailSearch) {
    // Caso 2: Búsqueda por email
    $data = $perRepo->searchByEmail($emailSearch);
} else {
    // Caso 3: Listado general
    $data = $perRepo->getAll();
}

$response = [
    "status" => "success",
    "modulo" => "Per",
    "query" => [
        "id" => $id,
        "email" => $emailSearch
    ],
    "data" => $data
];

echo json_encode($response);
