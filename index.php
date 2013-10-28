<?php
try {
  define ("MODULO", "VISITA");
  require('_start.php');

  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Bienvenido a SAPTI');
  $smarty->assign('keywords','Proyecto Final');
 $CSS[]  = URL_CSS . "dashboard.css";
 $CSS[]  = URL_CSS . "acordion.css";
  //CSS
  $CSS[]  = "css/style.css";

  //JS
  $JS[]  = "js/jquery.js";

  //BOX
  $CSS[] = URL_JS . "box/box.css";
  $JS[]  = URL_JS . "box/jquery.box.js";
  
  
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);
  leerClase('Menu');
  
  $menus  = array();
  $menu = new Menu('Defensas');
  $link = "";
  $menu->agregarItem('Fechas de Defensa',' Lista de Defensas ','tribunal.png',$link);
   
    $menus[] = $menu;
    $smarty->assign("menus", $menus);

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

$TEMPLATE_TOSHOW = 'index.academic.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>