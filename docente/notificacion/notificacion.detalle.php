<?php
  define ("MODULO", "NOTIFICACION");
  require('../_start.php');
  if(!isUserSession())
    header("Location: ../login.php");  
  
  leerClase('Administrador');
  leerClase('Docente');
  leerClase('Html');
  
  $menuList[]     = array('url'=>URL . Docente::URL , 'name'=>'Asignaturas');
  $menuList[]     = array('url'=>URL . Docente::URL . 'notificacion/','name'=>'Notificaciones');
  $menuList[]     = array('url'=>URL . Docente::URL . 'notificacion/notificacion.gestion.php','name'=>'Archivo de Notificaiones');
  $menuList[]     = array('url'=>URL . Docente::URL . 'notificacion/notificacion.detalle.php','name'=>'Detalle de Notificaciones');
  $url_base       = Docente::URL;
  include '../../' . Administrador::URL . "notificacion/notificacion.detalle.php";

?>