<?php
try {
  define ("MODULO", "ADMIN-SEGURIDAD");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  


  

  leerClase("Grupo");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Grupos');
  $smarty->assign('description','Pagina de Gesti&oacute;n  de Grupos');
  $smarty->assign('keywords','Gesti&oacute;n ,Grupos');
//  $smarty->assign('menudirslast','Gestion Grupos');

  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Administrador::URL,'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'seguridad/','name'=>'Control de Permisos');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'seguridad/'.basename(__FILE__),'name'=>'Gesti&oacute;n de Grupos');
  $smarty->assign("menuList", $menuList);


  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/seguridad/grupo.lista.tpl');

  //Filtro
  $filtro     = new Filtro('grupo',__FILE__);
  $grupo = new Grupo();
  $grupo->verificaTodosPermisos();
  
  $grupo->iniciarFiltro($filtro);
  $filtro_sql = $grupo->filtrar($filtro);

  $o_string   = $grupo->getOrderString($filtro);
  $obj_mysql  = $grupo->getAll('',$o_string,$filtro_sql,TRUE,FALSE);
  $objs_pg    = new Pagination($obj_mysql, 'grupo','',false);


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