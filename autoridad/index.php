<?php
try {
  define ("MODULO", "ADMIN-INDEX");
  require('_start.php');
  if(!isUserSession())
    header("Location: login.php");  

  /** HEADER */
  $smarty->assign('title','Administraci&oacute;n');
  $smarty->assign('description','Panel de Administraci&oacute;n del Sistema SAPTI');
  $smarty->assign('keywords','Proyecto Final');

  //CSS
  $CSS[]  = URL_CSS . "dashboard.css";
  $CSS[]  = URL_CSS . "academic/3_column.css";

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
 
  //BOX
  $CSS[] = URL_JS . "box/box.css";
  $JS[]  = URL_JS . "box/jquery.box.js";

  
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);
 /**
  * Clases
  */
  leerClase('Administrador');

  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Administrador::URL,'name'=>'Administraci&oacute;n');
  $smarty->assign("menuList", $menuList);

  /**
   * Menu central
   */
  leerClase('Menu');
  $menu = new Menu('');
  $menus = $menu->getAdminIndex();
  $smarty->assign("menus", $menus);
  
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

$TEMPLATE_TOSHOW = 'admin/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>