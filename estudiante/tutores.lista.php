<?php
try {
  require('_start.php');
  global $PAISBOX;

  /** HEADER */
    
  
  
  
  leerClase("Usuario");
  leerClase("Docente");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");
 leerClase('Estudiante');
  leerClase('Proyecto');

  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Enviar Solicitud');
  $smarty->assign('description','P&aacute;gina de listado de tutores');
  $smarty->assign('keywords','Docentes');
/**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Estudiante::URL,'name'=>'Estudiante');
  $menuList[]     = array('url'=>URL.Estudiante::URL.Proyecto::URL,'name'=>'Enviar Carta');
  $menuList[]     = array('url'=>URL.Estudiante::URL.Proyecto::URL.basename(__FILE__),'name'=>'Solicitud Tutor');
  $smarty->assign("menuList", $menuList);
  $editores = '';
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

  $smarty->assign('mascara'     ,'estudiante/listas.mascara.tpl');
  $smarty->assign('lista'       ,'estudiante/docente.lista.tpl');

  //Filtro
  $filtro     = new Filtro('g_estudiante',__FILE__);
  $docente = new Docente();
  $docente->iniciarFiltro($filtro);
  $filtro_sql = $docente->filtrar($filtro);

  $docente->usuario_id = '%';
  
  $o_string   = $docente->getOrderString($filtro);
  $obj_mysql  = $docente->getAll('',$o_string,$filtro_sql,TRUE,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'g_estudiante','',false,10);
  var_dump($obj_mysql);
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
  $smarty->display('estudiante/listas.lista.tpl'); 
else
  $smarty->display('estudiante/full-width.lista.correcion.tpl');

?>