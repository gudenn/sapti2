<?php
try {
  define ("MODULO", "REPORTE");
  require('../../_start.php');
  if(!isAdminSession())
    header("Location: ../../login.php");  

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Docentes');
  $smarty->assign('description','Gesti&oacute;n de Docentes');
  $smarty->assign('keywords','Gesti&oacute;n de Docentes');
  $smarty->assign('header_ui','1');

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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'proyecto/','name'=>'Reportes');
  $smarty->assign("menuList", $menuList);


  /**
   * Menu central
   */
  //----------------------------------//
  leerClase('Menu');
  $menu = new Menu('Proyecto');
  $link = Administrador::URL."reportes/proceso.php";
  $menu->agregarItem('Reportes de Proyectos en Proceso','Reprotes de Proyectos en Proceso','basicset/my-reports.png',$link);
  $link = Administrador::URL."reportes/tribunales.php";
  $menu->agregarItem('Reportes de Proyectos con Tribunales','Reportes de Proyectos con Tribunales','basicset/my-reports.png',$link);
  $link = Administrador::URL."reportes/defensa.php";
  $menu->agregarItem('Reportes de Proyectos en Defensa','Reportes de Proyectos en Defensa','basicset/my-reports.png',$link);
  $link = Administrador::URL."reportes/defensa.php";
  $menu->agregarItem('Reportes de Proyectos en Finalizados','Reportes de Proyectos en Finalizados','basicset/my-reports.png',$link);
  
  
  $menus[] = $menu;
  $menu = new Menu('Reportes');
  $link = Administrador::URL."proyecto/reporte/reporte.php";
  $menu->agregarItem('Reportes de Proyectos',' Reportes de Proyectos','basicset/graph.png',$link);
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