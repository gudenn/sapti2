<?php
try {
  define ("MODULO", "ADMIN-AUTORIDADES");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Autoridades');
  $smarty->assign('description','Gesti&oacute;n de Autoridades');
  $smarty->assign('keywords','Gesti&oacute;n de Autoridades');

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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'autoridad/','name'=>'Autoridades');
  $smarty->assign("menuList", $menuList);


  /**
   * Menu central
   */
  //----------------------------------//
  leerClase('Menu');
  $menu = new Menu('Autoridades');
  $link = Administrador::URL."autoridad/autoridad.gestion.php?todos=1";
  $menu->agregarItem('Gesti&oacute;n de Autoridades','Registro y modificaciones de Autoridades','basicset/people.png',$link);
  $link = Administrador::URL."autoridad/autoridad.registro.php?todos=1";
  $menu->agregarItem('Agregar Nueva Autoridad','Crear una nueva Autoridad','basicset/client.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Consejos');
  $link = Administrador::URL."autoridad/consejo.gestion.php?todos=1";
  $menu->agregarItem('Gesti&oacute;n de Consejos','Registro y modificaciones de Autoridades de Consejo','basicset/people.png',$link);
  $link = Administrador::URL."autoridad/consejo.registro.php?todos=1";
  $menu->agregarItem('Agregar Nueva Autoridad de Consejo','Crear una nueva Autoridad tipo Consejo','basicset/user3.png',$link);
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