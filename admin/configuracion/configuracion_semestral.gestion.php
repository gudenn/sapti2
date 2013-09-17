<?php
try {
  define ("MODULO", "CONFIGURACIONSEMESTRAL-GESTION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  leerClase("Configuracion_semestral");
  leerClase("Semestre");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gestion de Configurai&oacute;n Semestral');
  $smarty->assign('description','Pagina de gesti&oacute;n de Configurai&oacute;n Semestral');
  $smarty->assign('keywords','Gesti&acoute;n,Configurai&oacute;n Semestral');
  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administrador');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Configurai&oacute;n Semestral');
  $smarty->assign("menuList", $menuList);

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  //$CSS[]  = URL_CSS . "pg.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.js";
  $smarty->assign('JS',$JS);

  $semestre_id = false;
  if (isset($_SESSION['semestre_id']) && is_numeric($_SESSION['semestre_id']))
    $semestre_id = $_SESSION['semestre_id'];
  if (isset($_GET['semestre_id']) && is_numeric($_GET['semestre_id']))
  {
    $_SESSION['semestre_id'] = $_GET['semestre_id'];
    $semestre_id             = $_GET['semestre_id'];
  }
  $semestre = new Semestre($semestre_id);
  if (!$semestre_id)
    $semestre->getActivo ();
  $smarty->assign("semestre"  ,$semestre);
  
  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/configuracion_semestral/lista.tpl');

  //Filtro
  $filtro   = new Filtro('g_configuracions',__FILE__);
  $objeto = new Configuracion_semestral();
  $objeto->iniciarFiltro($filtro);
  $filtro_sql = $objeto->filtrar($filtro);

  
  $o_string   = $objeto->getOrderString($filtro);
  $obj_mysql  = $objeto->getAll('',$o_string,$filtro_sql,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'g_configuracions','',false);

  $smarty->assign("crear_nuevo"  ,"configuracion_semestral.registro.php?semestre_id={$semestre->id}");
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