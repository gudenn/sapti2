<?php
try {
  define ("MODULO", "ADMIN-CARTAS");
  require('../_start.php');
  if(!isUserSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Carta para SAPTI');
  $smarty->assign('description','Gesti&oacute;n Carta para SAPTI');
  $smarty->assign('keywords','Gesti&oacute;n de Carta para SAPTI');

  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

 /**
  * Clases
  */
  leerClase('Administrador');

  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Administrador::URL,'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'carta/','name'=>'Gesti&oacute;n de Cartas');
  $smarty->assign("menuList", $menuList);

  if (!isset($_SESSION['editor_online']))
    $_SESSION['editor_online'] = false;
  if (isset($_GET['activarEditor']))
  {
    $EXITO = true;
    $_SESSION['editor_online'] = true;
  }
  if (isset($_GET['desactivarEditor']))
  {
    $EXITO = false;
    $_SESSION['editor_online'] = false;
  }
  

  /**
   * Menu central
   */
  //----------------------------------//
  leerClase('Menu');
  $menu = new Menu('Gesti&oacute;n de Cartas');
  $link = Administrador::URL."carta/carta.gestion.php?todos";
  $menu->agregarItem('Gesti&oacute;n de Cartas','Gesti&oacute;n de las cartas para el sistema SAPTI.','basicset/message-archived.png',$link);
  $link = Administrador::URL."carta/carta.gestion.php?estado_impresion=PE";
  $menu->agregarItem('Cartas Pendientes','Gesti&oacute;n de las cartas para el Sistema SAPTI.','basicset/message-archived.png',$link);

  $menus[] = $menu;

  //----------------------------------//

  
  $smarty->assign("menus", $menus);

  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje'=>'La Herramienta <b>Editor Directo de Tooltips</b> fue <b style="color:green;">activada</b> correctamente','titulo'=>'Editor Directo de Tooltips' ,'icono'=> 'edit_48.png');
    else
      $mensaje = array('mensaje'=>'La Herramienta <b>Editor Directo de Tooltips</b> fue <b style="color:red;">desactivada</b> correctamente','titulo'=>'Editor Directo de Tooltips' ,'icono'=> 'editno_48.png');
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