<?php
try {
  define ("MODULO", "REPORTE");
  require('../../_start.php');
  if(!isUserSession())
  

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Reprte');
  $smarty->assign('description','Gesti&oacute;n de Reportes');
  $smarty->assign('keywords','Gesti&oacute;n de Reporte');

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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'tutor/reporte','name'=>'Reportes');
  $smarty->assign("menuList", $menuList);


  /**
   * Menu central
   */
  //----------------------------------//
  //serialisar sql
   function array_envia($url_array) 
           {
               $tmp = serialize($url_array);
               $tmp = urlencode($tmp);
           
               return $tmp;
           };
           //Consulta Usuarios
  $sqlr='select u.nombre as NOMBRE ,concat(u.apellido_paterno," ",u.apellido_materno) as APELLIDO ,u.email as CORREO,u.ci as CI ,u.login as LOGIN ,u.estado as ESTADO
from usuario u
';
  
  //serializando
  $sql=  array_envia($sqlr);
  $sql2=  array_envia($sqlr2);
  
  
  leerClase('Menu');
  $menu = new Menu('Reporte Usuario');
  $link = Administrador::URL."reportesistema/reportes.sistema.pdf.php?sql=$sql";
  $menu->agregarItem('Reporte Pdf','Reportes PDF de Usuario','basicset/filepd.png',$link);
  
  $link = Administrador::URL."reportesistema/reporte.sistema.excel.php?sql=$sql";
  $menu->agregarItem('Reportes Excel','Reportes Excel de Usuario','basicset/boton_excel.png',$link);
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