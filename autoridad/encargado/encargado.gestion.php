<?php
try {
  require('../_start.php');
 
  
  //MODULO -> REGISTRO DE MERCADERIA
  //ACCION -> GESTION
  

  
  
  
  
  leerClase("Usuario");
  leerClase("Docente");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");
  leerClase('Dicta');


  $ERROR = '';

   /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Docentes');
  $smarty->assign('description','Pagina de Gesti&oacute;n de Docente');
  $smarty->assign('keywords','Gesti&oacute;n,Docentes');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'docente/','name'=>' Docentes');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'docente/'.basename(__FILE__),'name'=>'Gesti&oacute;n de Docente');
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
  if (isset($_GET['eliminar']) && isset($_GET['docente_id']) && is_numeric($_GET['docente_id']) )
  {
    $docente = new Docente($_GET['docente_id']);
    $usaurio    = new Usuario($docente->usuario_id);
    $usaurio->delete();
    $docente->delete();
  }

  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  
  $smarty->assign('lista'       ,'admin/docente.lista.tpl');

  //Filtro
  $filtro     = new Filtro('g_docente',__FILE__);
  $docente = new Docente();
  $docente->iniciarFiltro($filtro);
  $filtro_sql = $docente->filtrar($filtro);
 
 
 
  $docente->usuario_id = '%';
  
  $o_string   = $docente->getOrderString($filtro);
  $obj_mysql  = $docente->getAll('',$o_string,$filtro_sql,TRUE,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'g_docente','',false,10);

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