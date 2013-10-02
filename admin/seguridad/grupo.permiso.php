<?php
try {
  define ("MODULO", "PERMISO-GESTION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  


  

  leerClase("Grupo");
  leerClase("Permiso");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gestion de Permisos');
  $smarty->assign('description','Pagina de gestion de Permisos');
  $smarty->assign('keywords','Gestion,Permisos');
  $smarty->assign('menudirslast','Gestion Permisos');

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
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Administrador::URL,'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'seguridad/','name'=>'Control de Permisos');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'seguridad/grupo.gestion.php','name'=>'Gesti&oacute;n de Permisos');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'seguridad/'.basename(__FILE__),'name'=>'Asignaci&oacute;n de Permisos');
  $smarty->assign("menuList", $menuList);


  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/seguridad/grupo.permiso.tpl');

  //Filtro
  $filtro     = new Filtro('premisos',__FILE__);
  
  if (isset($_GET['grupo_id']))
    $_SESSION['grpasigpermi_id'] = $_GET['grupo_id'];
  elseif (!isset ($_SESSION['grpasigpermi_id']))
    $_SESSION['grpasigpermi_id'] = 1;
  else
    $_SESSION['grpasigpermi_id'] = $_SESSION['grpasigpermi_id'];
    
  $grupo_id = $_SESSION['grpasigpermi_id'];
  
  $permiso = new Permiso();
  $permiso->grupo_id = $grupo_id;
  $permiso->iniciarFiltro($filtro);
  $filtro_sql = $permiso->filtrar($filtro);
  
  $permiso->modulo_id = '%';

  $o_string   = $permiso->getOrderString($filtro);
  $obj_mysql  = $permiso->getAll('',$o_string,$filtro_sql,TRUE,TRUE);
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