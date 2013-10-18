<?php
try {
  define ("MODULO", "ADMIN-ESTUDIANTE");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  


  

  leerClase("Usuario");
  leerClase("Estudiante");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Estudiantes');
  $smarty->assign('description','Pagina de Gesti&oacute;n de Estudiantes');
  $smarty->assign('keywords','Gesti&oacute;n,Estudiantes');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'estudiante/','name'=>' Estudiantes');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'estudiante/'.basename(__FILE__),'name'=>'Gesti&oacute;n de Estudiantes');
  $smarty->assign("menuList", $menuList);


  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

  
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
  $smarty->assign('lista'       ,'admin/estudiante/estudiante.lista.tpl');

  //Filtro
  $filtro     = new Filtro('g_estudiantetod',__FILE__);
  $estudiante = new Estudiante();
  $estudiante->iniciarFiltro($filtro);
  $filtro_sql = $estudiante->filtrar($filtro);

  $estudiante->usuario_id = '%';
  
  $o_string   = $estudiante->getOrderString($filtro);
  $obj_mysql  = $estudiante->getAll('',$o_string,$filtro_sql,TRUE,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'g_estudiantetod','',false);

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