<?php
try {
  define ("MODULO", "ADMIN-HELPDESK");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Temas de ayuda para SAPTI');
  $smarty->assign('description','Gesti&oacute;n Temas de ayuda para SAPTI');
  $smarty->assign('keywords','Gesti&oacute;n de Temas de ayuda para SAPTI');

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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'helpdesk/','name'=>'Temas de Ayuda');
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
  $menu = new Menu('Temas de Ayuda');
  $link = Administrador::URL."helpdesk/helpdesk.gestion.php?todos";
  $menu->agregarItem('Gesti&oacute;n de Temas de Ayuda','Gesti&oacute;n de Temas de Ayuda para el sistema SAPTI.','basicset/helpdesk_48.png',$link);
  $link = Administrador::URL."helpdesk/helpdesk.permisos.php?todos";
  $menu->agregarItem('Permisos y Restricciones','Gesti&oacute;n de accesos a los temas de ayuda Temas de Ayuda.','basicset/login.png',$link);
  if (!$_SESSION['editor_online'])
  {
    $link = Administrador::URL."helpdesk/?activarEditor=1";
    $menu->agregarItem('Activar el editor En-linea','Activamos la herramienta Editor Directo de Consejos en todas las p&aacute;ginas.','basicset/edit_48.png',$link);
  }
  else
  {
    $link = Administrador::URL."helpdesk/?desactivarEditor=1";
    $menu->agregarItem('Desactivar el editor En-linea','Desactivamos la herramienta Editor Directo de Consejos en todas las p&aacute;ginas.','basicset/editno_48.png',$link);
  }
  $menus[] = $menu;
  $menu = new Menu('Temas de Ayuda Pendientes');
  $link = Administrador::URL."helpdesk/helpdesk.gestion.php?estado_helpdesk=".Helpdesk::EST01_RECIEN;
  // CONTADOR //
  $helpdesk   = new Helpdesk();
  $pendientes = Helpdesk::EST01_RECIEN;
  $pendientes = $helpdesk->contar(" estado_helpdesk = '{$pendientes}' ");
  // -CONTADOR //
  $menu->agregarItem('Temas de Ayuda Pedientes','Temas de ayuda que estan pendientes.','basicset/tag.png',$link,$pendientes);
  $link = Administrador::URL."helpdesk/helpdesk.tooltips.php?todos";
  // CONTADOR //
  leerClase('Tooltip');
  $tooltips   = new Tooltip();
  $pendientes = Tooltip::EST02_APROBA;
  $pendientes = $tooltips->contar(" estado_tooltip != '{$pendientes}' ");
  // -CONTADOR //
  $menu->agregarItem('Consejos Pedientes','Ventanas flotantes que ofrece el sistema, Ayudas pendientes.','basicset/tag.png',$link,$pendientes);
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