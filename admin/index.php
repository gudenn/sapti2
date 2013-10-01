<?php
try {
  require('_start.php');
  if(!isAdminSession())
    header("Location: login.php");  

  /** HEADER */
  $smarty->assign('title','Administraci&oacute;n');
  $smarty->assign('description','Panel de Administraci&oacute;n del Sistema SAPTI');
  $smarty->assign('keywords','Proyecto Final');

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
  $smarty->assign("menuList", $menuList);

  /**
   * Menu central
   */
  //----------------------------------//
  leerClase('Menu');
  $menu = new Menu('Docentes');
  $link = Administrador::URL."docente/";
  $menu->agregarItem('Gesti&oacute;n de Docentes','Registro y modificaciones para Docentes','basicset/user4.png',$link);
  $link = Administrador::URL."docente/";
  $menu->agregarItem('Reportes de Docentes','Reportes correspondientes a los Docentes','basicset/graph.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Estudiantes');
  $link = Administrador::URL."estudiante/";
  $menu->agregarItem('Gesti&oacute;n de Estudiantes','Registro y modificaciones para estudiantes','basicset/user5.png',$link);
  $link = Administrador::URL."estudiante/";
  $menu->agregarItem('Reportes de Estudiantes','Reportes correspondientes a los Estudiantes','basicset/graph.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Tutores');
  $link = Administrador::URL."tutor/";
  $menu->agregarItem('Gesti&oacute;n de Tutores','Registro y modificaciones para Tutores','basicset/user1.png',$link);
  $link = Administrador::URL."tutor/";
  $menu->agregarItem('Reportes de Tutores','Reportes correspondientes a los Tutores','basicset/graph.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Autoridades');
  $link = Administrador::URL."autoridad/";
  $menu->agregarItem('Gesti&oacute;n de Autoridades','Registro y modificaciones para Autoridades','basicset/client.png',$link);
  $link = Administrador::URL."autoridad/";
  $menu->agregarItem('Reportes de Autoridades','Reportes correspondientes a los Autoridades','basicset/graph.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Perfil');
  $link = Administrador::URL."proyeco/";
  $menu->agregarItem('Gesti&oacute;n de Perfiles','Gestionar los perfiles de tesis para los estudiantes','basicset/licence.png',$link);
  $link = Administrador::URL."reportes/";
  $menu->agregarItem('Reportes de Perfiles','Reportes correspondientes a los Perfiles','basicset/graph.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Proyecto Final');
  $link = Administrador::URL."proyecto/";
  $menu->agregarItem('Gesti&oacute;n de Proyectos Finales','Gestionar los proyectos finales de los estudiantes','basicset/briefcase_48.png',$link);
  $link = Administrador::URL."proyecto/";
  $menu->agregarItem('Reportes de Proyectos Finales','Reportes correspondientes a los Proyectos','basicset/graph.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Notificaciones y Mensajes');
  $link = Administrador::URL."notificacion/";
  $menu->agregarItem('Gesti&oacute;n de Notificaciones','Gestionar Mis notificaciones','basicset/megaphone.png',$link,0,12);
  $link = Administrador::URL."mensajes/";
  $menu->agregarItem('Gesti&oacute;n de Mesajes','Mi correo de Mensajes','basicset/mail.png',$link,14);
  $menus[] = $menu;
  $menu = new Menu('Sistema SAPTI');
  $link = Administrador::URL."configuracion/";
  $menu->agregarItem('Configuraciones','Gesti&oacute;n de Helpdesk para el sistema SAPTI.','basicset/gear_48.png',$link,0,15);
  $menus[] = $menu;
  //----------------------------------//
  
  
  $smarty->assign("menus", $menus);
  
  
  //CREAR UN ESTUDIANTE
  
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