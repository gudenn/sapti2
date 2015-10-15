<?php
  define ("MODULO", "NOTIFICACION");
  require('../_start.php');
  if(!isUserSession())
    header("Location: ../login.php");  
  
  leerClase('Administrador');
  leerClase('Docente');
  
  $menuList[]     = array('url'=>URL . Docente::URL , 'name'=>'Asignaturas');
  $menuList[]     = array('url'=>URL . Docente::URL . 'notificacion/','name'=>'Notificaciones');
  $url_base       = Docente::URL;
  include '../../' . Administrador::URL . "notificacion/index.php";

  
?>