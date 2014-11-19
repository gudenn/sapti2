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

  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');
  
 /**
  * Clases 
  * Ahora Se utiliza la lectura automatica de clases
  */
  //leerClase('Administrador');

  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Administrador::URL,'name'=>'Administraci&oacute;n');
  $smarty->assign("menuList", $menuList);

  /**
   * Menu central
   */
  //leerClase('Menu');
  $menu = new Menu('');
  $menus = $menu->getAdminIndex();
  $smarty->assign("menus", $menus);
  
  $ERROR = '';
  leerClase('Html');
  $html  = new Html();
  //exit('Error');
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