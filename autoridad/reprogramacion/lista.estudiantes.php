<?php
try {
  define ("MODULO", "ESTUDIANTE-REPROGRAMACION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: login.php");  


  

  leerClase("Usuario");
  leerClase("Estudiante");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Reprogramaciones');
  $smarty->assign('description','Pagina de gest&oacute;n  de Reprogramaci&oacute;nes');
  $smarty->assign('keywords','Gestion,Reprogramaci&oacute;n');

  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administrador');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'reprogramacion/','name'=>'Reprogramaci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'reprogramacion/'.basename(__FILE__),'name'=>'Gestion de Estados');
  $smarty->assign("menuList", $menuList);

  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  if (isset($_GET['eliminar']) && isset($_GET['estudiante_id']) && is_numeric($_GET['estudiante_id']) )
  {
    $estudiante = new Estudiante($_GET['estudiante_id']);
    $usaurio    = new Usuario($estudiante->usuario_id);
    $usaurio->delete();
    $estudiante->delete();
  }

  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/estado/gestion.estado.tpl');

  //Filtro
  $filtro     = new Filtro('g_estudiante',__FILE__);
  $estudiante = new Estudiante();
  $estudiante->iniciarFiltro($filtro);
  $filtro_sql = $estudiante->filtrar($filtro);

  $estudiante->usuario_id = '%';
  
  $o_string   = $estudiante->getOrderString($filtro);
  $obj_mysql  = $estudiante->getAll('',$o_string,$filtro_sql,TRUE,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'g_estudiante','',false,10);

  $smarty->assign("filtros"  ,$filtro);
  $smarty->assign("objs"     ,$objs_pg->objs);
  $smarty->assign("pages"    ,$objs_pg->p_pages);




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