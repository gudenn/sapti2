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
  leerClase('Menu');
  
  $menus  = array();
  $menu = new Menu('Defensas');
  $link = "";
  $menu->agregarItem('Lista de Defensa De Proyecto','Revision y modificacion de Proyectos','tribunal.png',$link);
  $link ="publica.estudiante.lista.php";
  $menu->agregarItem('Lista de Defensa Publica ','Evaluaci&oacute;n de Proyecto','tribunal.png',$link);

  
    $menus[] = $menu;
    $menu = new Menu('Notificaciones');
    $menu->agregarItem('Notificaciones','Geti&oacute;n de las Notificaciones','basicset/megaphone.png',$link, 9);
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