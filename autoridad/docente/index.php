<?php
try {
  define ("MODULO", "ADMIN-DOCENTE");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Docentes');
  $smarty->assign('description','Gesti&oacute;n de Docentes');
  $smarty->assign('keywords','Gesti&oacute;n de Docentes');

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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'docente/','name'=>'Docente');
  $smarty->assign("menuList", $menuList);

  

  /**
   * Menu central
   */
  //----------------------------------//
  leerClase('Menu');
  $menu = new Menu('Docente');
  $link = Administrador::URL."docente/docente.gestion.php";
  $menu->agregarItem('Gesti&oacute;n de Docentes','Registro y modificaciones para Docentes','basicset/people.png',$link);
  $link = Administrador::URL."docente/docente.registro.cvs.php";
  $menu->agregarItem('Registro de Docentes por CVS','Registro de Docentes a travez de un archivo CVS','basicset/people.png',$link);
  $link = Administrador::URL."docente/docente.registro.php";
  $menu->agregarItem('Registro de Docente','Registro de un nuevo Docente','basicset/user4.png',$link);
  $link = Administrador::URL."docente/configuracion.dicta.php";
  $menu->agregarItem('Asignación de Materias','Asignación de Materias a los Docentes','basicset/survey.png',$link);  
  $menus[] = $menu;
  $menu = new Menu('Reportes');
  $link = Administrador::URL."docente/reporte";
  $menu->agregarItem('Reportes de Docente','Reportes correspondientes a los Docentes','basicset/graph.png',$link);
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