<?php
try {
  require('../_start.php');
  if(!isAdminSession())
    header("Location: login.php");  

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Estudiantes');
  $smarty->assign('description','Gesti&oacute;n de Estudiantes');
  $smarty->assign('keywords','Gesti&oacute;n de Estudiantes');

  //CSS
  $CSS[]  = URL_CSS . "dashboard.css";
  $CSS[]  = URL_CSS . "academic/3_column.css";

  //JS
  $JS[]  = "js/jquery.min.js";
  $smarty->assign('JS','');
  $smarty->assign('CSS',$CSS);

 /**
  * Clases
  */
  leerClase('Administrador');

  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Administrador::URL,'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL.Administrador::URL.'estudiante/','name'=>'Gesti&oacute;n Estudiantes');
  $smarty->assign("menuList", $menuList);

  $smarty->assign("columnacentro", 'admin/estudiante/columna.centro.tpl');


  
  $smarty->assign("ERROR", $ERROR);
  

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'admin/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>