<?php
try {
  define ("MODULO", "ADMIN-ESTUDIANTE-INDEX");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Estudiantes');
  $smarty->assign('description','Gesti&oacute;n de Estudiantes');
  $smarty->assign('keywords','Gesti&oacute;n de Estudiantes');

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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'estudiante/','name'=>' Estudiantes');
  $smarty->assign("menuList", $menuList);


  /**
   * Menu central
   */
  //----------------------------------//
  leerClase('Menu');
  $menu = new Menu('Estudiantes');
  $link = Administrador::URL."estudiante/estudiante.gestion.php";
  $menu->agregarItem('Gesti&oacute;n de Estudiantes','Registro y modificaciones para Estudiantes','basicset/people.png',$link);
  $link = Administrador::URL."estudiante/estudiante.registro.php";
  $menu->agregarItem('Registro de Estudiante','Registro de un nuevo Estudiante','basicset/user5.png',$link);
  $link = Administrador::URL."estudiante/estudiante.asignartutor.php";
  $menu->agregarItem('Asignar Tutor a un Estudiante','Registro de un nuevo Tutor o seleccionar uno de la lista de tutores disponibles para un estudiante.','basicset/user1.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Proyecto y Perfil');
  $link = Administrador::URL."estudiante/";/*@TODO*/
  $menu->agregarItem('Registro de Perfil','Grabar Los datos de un Perfil para un Estudiante.','basicset/survey.png',$link);
  $link = Administrador::URL."estudiante/estudiante.asignarproyecto.php";
  $menu->agregarItem('Registro de Proyecto Final','Grabar Los datos de un Proyecto Final para un Estudiante.','basicset/briefcase_48.png',$link);
  $link = Administrador::URL."estudiante/estudiante.cambiotema.php";
  $menu->agregarItem('Cambios de Tema','Registro de Cambios de Tema; Cambios Leves y Cambios Totales.','basicset/reload.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Reportes');
  $link = Administrador::URL."estudiante/";
  $menu->agregarItem('Reportes de Estudiantes','Reportes correspondientes a los Estudiantes','basicset/graph.png',$link);
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