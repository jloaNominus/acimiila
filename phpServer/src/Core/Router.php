<?php

namespace AciMiila\Core;

class Router {
    public function resolve() {
        $uri = $_SERVER['REQUEST_URI'];
        $path = parse_url($uri, PHP_URL_PATH);
        
        // Limpiamos el path si el proyecto no está en la raíz
        // Esto asume que el acceso es vía /phpServer/public/index.php o similar
        $scriptName = dirname($_SERVER['SCRIPT_NAME']);
        $path = str_replace($scriptName, '', $path);
        $path = trim($path, '/');

        return $path;
    }
}
