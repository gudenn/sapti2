<?php
try {
  require('../_start.php');

  /** HEADER */
  $smarty->assign('title','Proyecto Final - Ayuda');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

  //CSS
  $CSS[]  = URL_CSS . "ayuda.css";
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS','');

  leerClase('Helpdesk');

  $helpdesk = new Helpdesk(1);
  if ( isset($_GET['codigo']) )
    $helpdesk->getByCodigo ($_GET['codigo']);
          
  $template = TEMPLATES_DIR."helpdesk/archivo/{$helpdesk->codigo}.tpl";
  if (!file_exists($template))
    $template = TEMPLATES_DIR."helpdesk/archivo/defecto.tpl";

  $smarty->assign('template' , $template);

  $smarty->assign('listadefensas'  , "");
  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'helpdesk/full-width.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>