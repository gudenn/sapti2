<?php
try {
  define ("MODULO", "ADMIN-DOCENTE");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Tribunales');
  $smarty->assign('description','Gesti&oacute;n de Tribunales');
  $smarty->assign('keywords','Gesti&oacute;n de Tribunales');

  //CSS
  $CSS[]  = URL_CSS . "dashboard.css";
  $CSS[]  = URL_CSS . "academic/3_column.css";

  //JS
  $JS[]  = "js/jquery.min.js";
  $smarty->assign('header_ui','1');
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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'tribunal/','name'=>'Tribunal');
  $smarty->assign("menuList", $menuList);

  

  /**
   * Menu central
   */
  //----------------------------------//
  leerClase('Menu');
  $menu = new Menu('Tribunal');
  $link = Administrador::URL."Tribunal/docente.gestion.php";
  $menu->agregarItem('Gesti&oacute;n de Tribunales','Registro y modificaciones para Tribunales','basicset/people.png',$link);
   $link = Administrador::URL."tribunal/docente.registro.php";
  $menu->agregarItem('Registro de Tribunal Externo','Registro de un  Tribunal Externo','basicset/user4.png',$link);
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