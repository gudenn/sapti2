<?php
try {
  require('../_start.php');
  global $PAISBOX;

  /** HEADER */
  $smarty->assign('title','Cronograma SAPTI');
  $smarty->assign('description','Proyecto Final - Perfil');
  $smarty->assign('keywords','Proyecto Final');

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  //Calendar
  $CSS[]  = URL_JS . "calendar/css/eventCalendar.css";
  $CSS[]  = URL_JS . "calendar/css/eventCalendar_theme.css";
  $smarty->assign('CSS',$CSS);


  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  //Calendar
  $JS[]  = URL_JS . "calendar/js/jquery.eventCalendar.js";
  $smarty->assign('JS',$JS);

  leerClase("Semestre");
  $semestre = new Semestre();
  $semestre->getActivo();
  $smarty->assign('semestre'  , $semestre);
  
  $smarty->assign('con_cronograma'  , 'cronograma/cronograma.tpl');
  
  $smarty->assign('listadefensas'  , "");
  
  
  $smarty->assign("ERROR", $ERROR);
  

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'cronograma/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>