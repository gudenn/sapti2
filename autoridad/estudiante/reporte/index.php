<?php
try {
  require('../../_start.php');
  if(!isAdminSession())
    header("Location: login.php");  

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de  Estudiante');
  $smarty->assign('description','Gesti&oacute;n de Estudiante');
  $smarty->assign('keywords','Gesti&oacute;n de  Estudiante');

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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'estudiante/','name'=>'Reportes');
  $smarty->assign("menuList", $menuList);


  /**
   * Menu central
   */
  //----------------------------------//
  leerClase('Menu');
  $menu = new Menu('Docente');
  $link = Administrador::URL."estudiante/reporte/estudiante.reporte.php";
  $menu->agregarItem('Reprotes','Reportes para Estudiantes','basicset/my-reports.png',$link);
  $link = Administrador::URL."reportes/cambio.php";
  $menu->agregarItem('Reportes Cambios','Reportes para Estudiantes que Hicieron Cambios','basicset/my-reports.png',$link);
  
  $menus[] = $menu;
  $menu = new Menu('Reportes Cambios');
  $link = Administrador::URL."estudiante/reporte/reporte.php";
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