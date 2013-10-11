<?php
try {
  define ("MODULO", "ADMIN-PROYECTO-INDEX");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Proyectos Finales');
  $smarty->assign('description','Gesti&oacute;n de Proyectos Finales');
  $smarty->assign('keywords','Gesti&oacute;n de Proyectos Finales');

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
  $menuList[]     = array('url'=>URL.Administrador::URL.'proyecto/','name'=>'Gesti&oacute;n Proyectos Finales');
  $smarty->assign("menuList", $menuList);


  /**
   * Menu central
   */
  //----------------------------------//
  leerClase('Menu');
  $menu = new Menu('Detalle Proyecto');
  $link = Administrador::URL."detalle/estudiante.detalleproyecto.php";
  $menu->agregarItem('Ver Detalle del Proyecto','Ver Detalle de los proyectos registrados','basicset/document.png',$link);
 
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