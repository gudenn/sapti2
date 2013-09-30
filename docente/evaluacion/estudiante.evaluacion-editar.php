<?php
try {
  require('../_start.php');
    if(!isDocenteSession())
    header("Location: login.php"); 
    
  leerClase("Docente");
  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gestion de Observaciones');
  $smarty->assign('description','Pagina de gestion de Observaciones');
  $smarty->assign('keywords','Gestion,Observaciones');

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_CSS . "editablegrid.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "tablaeditable/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "tablaeditable/tabla.editable.evaluacion.js";
  $smarty->assign('JS',$JS);

   /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Docente');
  $menuList[]     = array('url'=>URL.Docente::URL.basename(__FILE__),'name'=>'Evaluacion');
  $smarty->assign("menuList", $menuList);

  if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) )
  {
     $iddicta = $_GET['iddicta'];
  }
  $smarty->assign("iddicta", $iddicta);
  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
$TEMPLATE_TOSHOW = 'docente/evaluacion/full-width.lista.evaluacion-editar.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>