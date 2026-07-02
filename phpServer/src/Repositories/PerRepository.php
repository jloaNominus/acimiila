<?php

namespace AciMiila\Repositories;

use AciMiila\Core\Database;
use AciMiila\Models\Persona;
use PDO;

/**
 * Repositorio para la gestión de datos de Personas.
 * Aquí es donde vive tu experiencia en SQL.
 */
class PerRepository {
    private $db;

    public function __construct($database_connection) {
        $this->db = $database_connection;
    }

    public function searchByName($name) {
        $stmt = $this->db->prepare("SELECT iPersona, xApellidos, xNombres FROM PerPersona WHERE xNombres LIKE ? OR xApellidos LIKE ?");
        $stmt->execute(["%$name%", "%$name%"]);
        return $stmt->fetchAll();
    }

    public function searchByEmail($email) {
        $stmt = $this->db->prepare("SELECT p.iPersona, p.xApellidos, p.xNombres 
                                    FROM PerPersona p 
                                    JOIN PerEmail e ON p.iPersona = e.iPersona 
                                    WHERE e.xEmail LIKE ?");
        $stmt->execute(["%$email%"]);
        return $stmt->fetchAll();
    }

    /**
     * Obtiene una persona completa con sus satélites
     */
    public function getById($id) {
        // 1. Obtener datos base
        $stmt = $this->db->prepare("SELECT iPersona, xApellidos, xNombres FROM PerPersona WHERE iPersona = ?");
        $stmt->execute([$id]);
        $data = $stmt->fetch();

        if (!$data) return null;

        $persona = new Persona($data);

        // 2. Cargar Emails (SQL experiencia)
        $stmt = $this->db->prepare("SELECT iPersona, bConsecutivo, xEmail, lMoodle FROM PerEmail WHERE iPersona = ?");
        $stmt->execute([$id]);
        $persona->emails = $stmt->fetchAll();

        // 3. Cargar Teléfonos
        $stmt = $this->db->prepare("SELECT iPersona, bConsecutivo, cPais, xTelefono, lMoodle, lFireAuth FROM PerTelefono WHERE iPersona = ?");
        $stmt->execute([$id]);
        $persona->telefonos = $stmt->fetchAll();

        // 4. Cargar Identidades
        $stmt = $this->db->prepare("SELECT iPersona, bConsecutivo, sTipoDocumento, cDocumento FROM PerIdentidad WHERE iPersona = ?");
        $stmt->execute([$id]);
        $persona->identidades = $stmt->fetchAll();

        return $persona;
    }

    public function getAll() {
        $stmt = $this->db->prepare("SELECT iPersona, xApellidos, xNombres FROM PerPersona");
        $stmt->execute();
        return $stmt->fetchAll();
    }
}
