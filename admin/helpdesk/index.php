<?php
try {
  define ("MODULO", "ADMIN-HELPDESK-INDEX");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Temas de ayuda para SAPTI');
  $smarty->assign('description','Gesti&oacute;n Temas de ayuda para SAPTI');
  $smarty->assign('keywords','Gesti&oacute;n de Temas de ayuda para SAPTI');

  //CSS
  $CSS[]  = URL_CSS . "dashboard.css";
  $CSS[]  = URL_CSS . "academic/3_column.css";

  //JS
  $JS[]  = "js/jquery.min.js";
  $smarty->assign('JS','');
  $smarty->assign('CSS',$CSS);

 /**
  * Clases
  */
  leerClase('Administrador');

  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Administrador::URL,'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'helpdesk/','name'=>'Helpdesk SAPTI');
  $smarty->assign("menuList", $menuList);


  /**
   * Menu central
   */
  //----------------------------------//
  leerClase('Menu');
  $menu = new Menu('Helpdesk');
  $link = Administrador::URL."helpdesk/helpdesk.gestion.php?todos";
  $menu->agregarItem('Gesti&oacute;n de Helpdesk','Gesti&oacute;n de Helpdesk para el sistema SAPTI.','basicset/helpdesk_48.png',$link);
  $link = Administrador::URL."helpdesk/helpdesk.permisos.php?todos";
  $menu->agregarItem('Permisos y Restricciones','Gesti&oacute;n de accesos a los temas de ayuda Helpdesk.','basicset/login.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Helpdesk y Tooltips Pendientes');
  $link = Administrador::URL."helpdesk/helpdesk.gestion.php?estado_helpdesk=".Helpdesk::EST01_RECIEN;
  // CONTADOR //
  $helpdesk   = new Helpdesk();
  $pendientes = Helpdesk::EST01_RECIEN;
  $pendientes = $helpdesk->contar(" estado_helpdesk = '{$pendientes}' ");
  // -CONTADOR //
  $menu->agregarItem('Helpdesk Pedientes','Temas de ayuda que estan pendientes.','basicset/tag.png',$link,$pendientes);
  $link = Administrador::URL."helpdesk/helpdesk.tooltips.php?todos";
  // CONTADOR //
  leerClase('Tooltip');
  $tooltips   = new Tooltip();
  $pendientes = Tooltip::EST02_APROBA;
  $pendientes = $tooltips->contar(" estado_tooltip != '{$pendientes}' ");
  // -CONTADOR //
  $menu->agregarItem('Tooltips Pedientes','Ventanas flotantes que ofrece el sistema, Ayudas pendientes.','basicset/tag.png',$link,$pendientes);
  $menus[] = $menu;

  //----------------------------------//

  
  $smarty->assign("menus", $menus);

  
  $smarty->assign("ERROR", $ERROR);
  

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'admin/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>