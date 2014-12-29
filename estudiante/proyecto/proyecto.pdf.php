<?php

  require('../_start.php');
  if(!isEstudianteSession())
    header("Location: login.php");  
  leerClase('Administrador');

  $estudiante = getSessionEstudiante();

  define('START','READY');
  //forsamos a usar solo mi id
  $_GET['estudiante_id'] = $estudiante->id;
  include PATH . Administrador::URL.'detalle/proyecto.pdf.php';
