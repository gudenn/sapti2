<?php

/**
 * Aca seguardaran todos los objetivos especificos de un proyecto
 */
class Objetivo_especifico extends Objectbase {

  /**
   * Codigo identificador del proyecto
   * @var INT(11)
   */
  var $proyecto_id;

  /**
   * descripcion del objetivo
   * @var TEXT
   */
  var $descripcion;

  /**
   * Validamos el objetivo
   * @param type $es_nuevo
   */
  function validar($contador = 1) {
    leerClase('Formulario');
    Formulario::validar("objetivo_especifico_{$contador}", $this->descripcion, 'texto', 'El Obejetivo Espec&iacute;fico');
  }
}

?>