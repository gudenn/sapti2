<?php
try {
  define ("MODULO", "ADMIN-REPORTE");
  require('../../_start.php');
  if(!isAdminSession())
    header("Location: ../../login.php");  

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Docentes');
  $smarty->assign('description','Gesti&oacute;n de Docentes');
  $smarty->assign('keywords','Gesti&oacute;n de Docentes');

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
           //Consulta Aceptados
  $sqlr='select u.nombre as NOMBRE,CONCAT(u.apellido_paterno," ",u.apellido_materno) as APELLIDO   ,pt.fecha_acepta FECHA,p.nombre as PROYECTO
from usuario u,tutor t ,proyecto_tutor pt,proyecto p 
where u.id=t.usuario_id and pt.tutor_id=t.id  and pt.proyecto_id=p.id and pt.estado_tutoria="AC"
';
   //Consulta Rechazados
   $sqlr2='select u.nombre as NOMBRE,CONCAT(u.apellido_paterno," ",u.apellido_materno) as APELLIDO   ,pt.fecha_acepta FECHA,p.nombre as PROYECTO
from usuario u,tutor t ,proyecto_tutor pt,proyecto p 
where u.id=t.usuario_id and pt.tutor_id=t.id  and pt.proyecto_id=p.id and pt.estado_tutoria="RE"
';
  //serializando
  $sql=  array_envia($sqlr);
  $sql2=  array_envia($sqlr2);
  
  
  leerClase('Menu');
  $menu = new Menu('Reporte Tutor Proyectos Aceptados Pdf');
  $link = Administrador::URL."reportesistema/reportes.sistema.pdf.php?sql=$sql";
  $menu->agregarItem('Reporte Pdf','Reportes PDF de tutor Proyectos aceptados','basicset/filepd.png',$link);
  
  $link = Administrador::URL."reportesistema/reporte.sistema.excel.php?sql=$sql";
  $menu->agregarItem('Reportes Excel','Reportes Excel de tutor Proyectos aceptados','basicset/boton_excel.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Reporte Tutor Proyectos Rechazados');
  $link = Administrador::URL."reportesistema/reportes.sistema.pdf.php?sql=$sql2";
  $menu->agregarItem('Reporte Tutor Proyectos Rechazados Pdf','Reporte Tutor Proyectos Rechazados','basicset/filepd.png',$link);
  $link = Administrador::URL."reportesistema/reporte.sistema.excel.php?sql=$sql2";
  $menu->agregarItem('Reporte Tutor Proyectos Rechazados Excel','Reporte Tutor Proyectos Rechazados','basicset/boton_excel.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Reportes');
  $link = Administrador::URL."tutor/reporte/reporte.php";
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