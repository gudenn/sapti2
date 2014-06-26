<?php
try {
  define ("MODULO", "CONSEJO");
  require('_start.php');
  if(!isConsejoSession())
  header("Location: login.php"); 
  leerClase('Docente');
  leerClase('Consejo');
  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Lista de Estudiantes');
  $smarty->assign('description','P&aacute;gina de Lista de Incritos');
  $smarty->assign('keywords','Gestion,Estudiantes');

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_CSS . "editablegrid.css";
 // $CSS[] = '../css/editablegrid.css';
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
   $JS[]  = URL_JS . 'tablaeditable/editablegrid-2.0.1.js';
  $JS[]  =URL_JS . 'consejo/lista.estudiante.js';
  $smarty->assign('JS',$JS);
  
   /**
   * Menu superior
   */
   $menuList[]     = array('url'=>URL.Consejo::URL,'name'=>'Consejo');
   $menuList[]     = array('url'=>URL . Consejo::URL.'lista.estudiante.php' ,'name'=>'Asignación');
   $smarty->assign("menuList", $menuList);
 

  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('tribunal/lista.estudiante.tpl');
?>