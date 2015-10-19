<?php
try {
  define ("MODULO", "VISITA");
  require('_start.php');
  leerClase('Semestre');

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
  
  $semestre = new Semestre();
  $director = $semestre->getValor('Director carrera Sistemas');
  $smarty->assign('director'  , $director);

  $smarty->assign('listadefensas'  , "");
  
  
  if (isset($_GET['notienepermiso']))
    $smarty->assign("sinpermiso",1);
  
  $ERROR = '';
  $smarty->assign("ERROR",$ERROR);
  

  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'index.descripcion.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>