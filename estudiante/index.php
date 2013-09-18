<?php
try {
  require('_start.php');
  if(!isEstudianteSession())
    header("Location: login.php");  

  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  //Calendar
  $CSS[]  = URL_JS . "calendar/css/eventCalendar.css";
  $CSS[]  = URL_JS . "calendar/css/eventCalendar_theme.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS ."jquery.min.js";
  //Calendar
  $JS[]  = URL_JS . "calendar/js/jquery.eventCalendar.js";
  $smarty->assign('JS',$JS);

  // Escritorio del estuddinate
  leerClase('Usuario');
  leerClase('Proyecto');
  leerClase('Estudiante');
  
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Estudiante::URL,'name'=>'Estudiante');
  $smarty->assign("menuList", $menuList);

  
  $estudiante_aux = getSessionEstudiante();
  $estudiante     = new Estudiante($estudiante_aux->estudiante_id);
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();
  
  $smarty->assign("estudiante", $estudiante);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("proyecto", $proyecto);
  $smarty->assign("ERROR", $ERROR);
  

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'estudiante/estudiante.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>