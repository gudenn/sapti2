<?php
try {
  define ("MODULO", "ADMIN-TUTOR");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Tutores');
  $smarty->assign('description','Gesti&oacute;n de Tutores');
  $smarty->assign('keywords','Gesti&oacute;n de Tutores');

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
  $menuList[]     = array('url'=>URL.Administrador::URL.'estudiante/','name'=>'Gesti&oacute;n Tutores');
  $smarty->assign("menuList", $menuList);


  /**
   * Menu central
   */
  //----------------------------------//
  leerClase('Menu');
  $menu = new Menu('Tutores');
  $link = Administrador::URL."tutor/tutor.gestion.php?todos=1";
  $menu->agregarItem('Gesti&oacute;n de Tutores','Registro y modificaciones para Tutores','basicset/user1.png',$link);
  $link = Administrador::URL."tutor/tutor.registro.php";
  $menu->agregarItem('Registro de Tutor','Registro de un nuevo Tutor','basicset/user1.png',$link);
  $link = Administrador::URL."estudiante/estudiante.asignartutor.php";
  $menu->agregarItem('Asignar Tutor a un Estudiante','Registro de un nuevo Tutor o seleccionar uno de la lista de tutores disponibles para un estudiante.','basicset/user1.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Reportes');
  $link = Administrador::URL."tutor/reporte";
  $menu->agregarItem('Reportes de Tutores','Reportes correspondientes a los Tutores','basicset/graph.png',$link);
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