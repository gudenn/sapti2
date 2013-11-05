<?php
try {
  define ("MODULO", "ADMIN-CONFIGURACION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  leerClase("Area");
  leerClase("Sub_area");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Sub-Area');
  $smarty->assign('description','P&aacute;gina de gesti&oacute;n de Sub-&Aacutereas');
  $smarty->assign('keywords','Gesti&acoute;n,Sub-&Aacutereas');
  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/area.gestion.php','name'=>'Gesti&oacute;n de Sub-&Aacutereas');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Gesti&oacute;n de Sub-&Aacutereas');
  $smarty->assign("menuList", $menuList);

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  //$CSS[]  = URL_CSS . "pg.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.js";
  $smarty->assign('JS',$JS);

  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/sub_area/lista.tpl');

  //Son las subareas de un area asi que si o si tenemos una area
  $area_id = false;
  if (isset($_SESSION['area_id']) && is_numeric($_SESSION['area_id']))
    $area_id = $_SESSION['area_id'];
  if (isset($_GET['area_id']) && is_numeric($_GET['area_id']))
  {
    $_SESSION['area_id'] = $_GET['area_id'];
    $area_id             = $_GET['area_id'];
  }
  $area = new Area($area_id);
  $smarty->assign("area"  ,$area);

  
  //Filtro
  $filtro   = new Filtro('g_subarea',__FILE__);
  $objeto   = new Sub_area();
  $objeto->area_id = $area->id;
  $objeto->iniciarFiltro($filtro);
  $filtro_sql = $objeto->filtrar($filtro);

  
  $o_string   = $objeto->getOrderString($filtro);
  $obj_mysql  = $objeto->getAll('',$o_string,$filtro_sql,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'g_subarea','',false,3);

  $smarty->assign("crear_nuevo"  ,"subarea.registro.php?area_id={$area->id}");
  $smarty->assign("filtros"      ,$filtro);
  $smarty->assign("objs"         ,$objs_pg->objs);
  $smarty->assign("pages"        ,$objs_pg->p_pages);




  //No hay ERROR
  $smarty->assign("ERROR",'');
  $smarty->assign("URL",URL);  

}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

if (isset($_GET['tlista']) && $_GET['tlista']) //recargamos la tabla central
  $smarty->display('admin/listas.lista.tpl'); 
else
  $smarty->display('admin/full-width.tpl');


?>