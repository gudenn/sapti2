<?php
  /**
   * Se modifico este archivo para usar una sola logica al momento de registrar los proyectos
   * @see estudiante/proyecto/proyecto.registro.php
   */
  define ("MODULO", "ADMIN-PROYECTO");
  require_once( '../_start.php');
  leerClase('Estudiante');
  require_once( PATH . Estudiante::URL . 'proyecto/proyecto.registro.php');
