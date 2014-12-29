<?php

/**
 * Aca seguardaran todos los objetivos especificos de un proyecto
 */
class Avance_objetivo_especifico extends Objectbase {

  /** constantes para los valores del estado de la avance en los objetivos especificos
   * estado 1 creado (CR), estado 2 aprobado (AP)
   */
  const E1_CREADO     = "CR";
  const E2_APROBADO   = "AP";

  /**
   * Codigo identificador del avance
   * @var INT(11)
   */
  var $avance_id;

  /**
   * Codigo identificador del objetivo_especifico
   * @var INT(11)
   */
  var $objetivo_especifico_id;

  /**
   * porcentaje de avance
   * @var INT(11)
   */
  var $porcentaje_avance;

  /**
   * para el estado de avance estado 1 creado (CR), estado 2 aprobado (AP)
   * @var INT(11)
   */
  var $estado_avance;

  public function getDescripcion($objetivo_especifico_id = false) {
    leerClase('Objetivo_especifico');
    if (!$objetivo_especifico_id) {$objetivo_especifico_id = $this->objetivo_especifico_id;}
    $obj_esp = new Objetivo_especifico($objetivo_especifico_id);
    return $obj_esp->descripcion;
  }
}

