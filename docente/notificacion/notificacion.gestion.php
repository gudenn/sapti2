<?php
  define ("MODULO", "NOTIFICACION");
  require('../_start.php');
  if(!isUserSession())
    header("Location: ../login.php");  
  
  leerClase('Administrador');
  leerClase('Docente');
  
  $menuList[]     = array('url'=>URL . Docente::URL , 'name'=>'Docente');
  $menuList[]     = array('url'=>URL . Docente::URL . 'notificacion/','name'=>'Notificaciones');
  $menuList[]     = array('url'=>URL . Docente::URL . 'notificacion/notificacion.gestion.php','name'=>'Archivo de Notificaiones');
  $url_base       = Docente::URL;
  include '../../' . Administrador::URL . "notificacion/notificacion.gestion.php";

?>