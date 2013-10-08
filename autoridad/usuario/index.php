<?php
try {
  define ("MODULO", "ADMIN-USUARIO-INDEX");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Usuarios');
  $smarty->assign('description','Gesti&oacute;n de Usuarios');
  $smarty->assign('keywords','Gesti&oacute;n de Usuarios');

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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'usuario/','name'=>'Usuarios');
  $smarty->assign("menuList", $menuList);


  /**
   * Menu central
   */
  //----------------------------------//
  leerClase('Menu');
  $menu = new Menu('Usuarios');
  $link = Administrador::URL."usuario/usuario.gestion.php?todos=1";
  $menu->agregarItem('Gesti&oacute;n de Usuarios','Registro y modificaciones para Usuarios','basicset/people.png',$link);
  $link = Administrador::URL."usuario/usuario.asignargrupo.php?todos=1";
  $menu->agregarItem('Gesti&oacute;n de Grupos','Gesti&oacute;n de Grupos para los usaurios del sistema SAPTI','basicset/people.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Reportes');
  $link = Administrador::URL."usuario/";
  $menu->agregarItem('Reportes de Usuarios','Reportes correspondientes a los Todos los Usuarios','basicset/graph.png',$link);
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