<?php
try {
  define ("MODULO", "VISITA");
  require('_start.php');

  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

  //CSS
  $CSS[]  = "css/style.css";

  //JS
  $JS[]  = "js/jquery.js";

  //BOX
  $CSS[] = URL_JS . "box/box.css";
  $JS[]  = URL_JS . "box/jquery.box.js";
  
  
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);
  
  

  $smarty->assign('listadefensas'  , "");
  
  
  $ERROR = '';
  leerClase('Html');
  $html  = new Html();
  if (isset($_GET['notienepermiso']))
  {
    $html = new Html();
    $mensaje = array('mensaje'=>'No tiene permiso de acceder a este M&oacute;dulo','titulo'=>'No Tiene Permiso' ,'icono'=> 'warning_48.png');
    $ERROR = $html->getMessageBox ($mensaje);
  }
  $smarty->assign("ERROR",$ERROR);
  

  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'index.academic.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>