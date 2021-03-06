<?php
try {
  define ("MODULO", "ADMIN-SEGURIDAD");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Accesos');
  $smarty->assign('description','Gesti&oacute;n de Accesos');
  $smarty->assign('keywords','Gesti&oacute;n de Accesos');

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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'seguridad/','name'=>'Control de Permisos');
  $smarty->assign("menuList", $menuList);


  /**
   * Menu central
   */
  //----------------------------------//
  leerClase('Menu');
  $menu = new Menu('Permisos');
  $link = Administrador::URL."seguridad/grupo.asignarpermiso.php";
  $menu->agregarItem('Gesti&oacute;n de Permisos','Gesti&oacute;n de Permisos para Usuarios del Sistema SAPTI','basicset/people.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Grupos');
  $link = Administrador::URL."seguridad/grupo.gestion.php";
  $menu->agregarItem('Gesti&oacute;n de Grupos','Gesti&oacute;n de Grupos','basicset/people.png',$link);
  $link = Administrador::URL."seguridad/grupo.registro.php";
  $menu->agregarItem('Registro de Grupo','Registro de un grupo para Usuarios ','basicset/plus_48.png',$link);
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