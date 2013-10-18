<?php
try {
  define ("MODULO", "ADMIN-PROYECTO");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Proyectos Finales');
  $smarty->assign('description','Gesti&oacute;n de Proyectos Finales');
  $smarty->assign('keywords','Gesti&oacute;n de Proyectos Finales');

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
  $menuList[]     = array('url'=>URL.Administrador::URL.'proyecto/','name'=>'Gesti&oacute;n Proyectos Finales');
  $smarty->assign("menuList", $menuList);


  /**
   * Menu central
   */
  //----------------------------------//
  leerClase('Menu');
  $menu = new Menu('Proyecto Final');
  $link = Administrador::URL."detalle/";
  $menu->agregarItem('Gesti&oacute;n de Proyectos','Registro y modificaciones para los Proyectos','basicset/briefcase_48.png',$link);
  $link = Administrador::URL."estudiante/estudiante.asignarproyecto.php";
  $menu->agregarItem('Grabar Proyecto Final','Grabar Los datos de un Proyecto Final para un Estudiante.','basicset/user6.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Reportes');
  $link = Administrador::URL."proyecto/";
  $menu->agregarItem('Reportes de Proyecto Final','Reportes correspondientes a Proyecto Final','basicset/graph.png',$link);
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