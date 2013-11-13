<?php
  define ("MODULO", "NOTIFICACION");
  require('../_start.php');
  if(!isUserSession())
    header("Location: ../login.php");  
  
  leerClase('Administrador');
  leerClase('Estudiante');
  
  $menuList[]     = array('url'=>URL . Estudiante::URL , 'name'=>'Estudiante');
  $menuList[]     = array('url'=>URL . Estudiante::URL . 'notificacion/','name'=>'Notificaciones');
  $menuList[]     = array('url'=>URL . Estudiante::URL . 'notificacion/notificacion.gestion.php','name'=>'Archivo de Notificaciones');
  $url_base       = Estudiante::URL;
  include '../../' . Administrador::URL . "notificacion/notificacion.gestion.php";

?>