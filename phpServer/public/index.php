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
use AciMiila\Core\Router;
use AciMiila\Repositories\PerRepository;

// 1. Inicializar Core
$database = new Database();
$db = $database->getConnection();
$router = new Router();

// 2. Resolver Ruta
$path = $router->resolve();
$perRepo = new PerRepository($db);
$data = null;

/** 
 * Enrutamiento basado en contrato:
 * GET /persona/byEmail?email=abcd
 */
switch ($path) {
    case 'persona/byEmail':
        $email = $_GET['email'] ?? null;
        if ($email) {
            $data = $perRepo->searchByEmail($email);
        }
        break;

    case 'persona':
        $id = $_GET['id'] ?? null;
        if ($id) {
            $data = $perRepo->getById($id);
        } else {
            $data = $perRepo->getAll();
        }
        break;

    default:
        $data = ["error" => "Ruta no encontrada", "path" => $path];
        http_response_code(404);
        break;
}

echo json_encode([
    "status" => "success",
    "path" => $path,
    "data" => $data
]);
