<?php

namespace AciMiila\Models;

/**
 * Representa una persona en el sistema (Módulo Per)
 * Sincronizado con la tabla SQL: PerPersona
 */
class PerPersona {
    public $iPersona;
    public $xApellidos;
    public $xNombres;

    // Relaciones (Tablas satélites)
    public $identidades = [];
    public $emails = [];
    public $telefonos = [];

    public function __construct($data = null) {
        if ($data) {
            $this->iPersona = $data->iPersona ?? null;
            $this->xApellidos = $data->xApellidos ?? null;
            $this->xNombres = $data->xNombres ?? null;
        }
    }
}

/**
 * Tabla: PerIdentidad
 */
class PerIdentidad {
    public $iPersona;
    public $bConsecutivo;
    public $sTipoDocumento;
    public $cDocumento;
}

/**
 * Tabla: PerEmail
 */
class PerEmail {
    public $iPersona;
    public $bConsecutivo;
    public $xEmail;
    public $lMoodle;
}

/**
 * Tabla: PerTelefono
 */
class PerTelefono {
    public $iPersona;
    public $bConsecutivo;
    public $cPais;
    public $xTelefono;
    public $lMoodle;
    public $lFireAuth;
}

