<?php
try {
  define ("MODULO", "ADMIN-ESTUDIANTE-CAMBIOTEMA");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
   leerClase("Usuario");
   leerClase("Estudiante");
   leerClase("Formulario");
   leerClase("Pagination");
   leerClase("Filtro");


  $ERROR ='';

  /** HEADER */
  $smarty->assign('title','Cambio de Tema');
  $smarty->assign('description','Cambio de tema para los estudiantes');
  $smarty->assign('keywords','estudiante,cambio tema,proyecto final');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL,'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'estudiante/','name'=>'Gesti&oacute;n Estudiantes');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'estudiante/'.basename(__FILE__),'name'=>'Cambio de Tema');
  $smarty->assign("menuList", $menuList);
  

  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/estudiante/lista-estudiantes-cambiotema.tpl');

  //Filtro
  $filtro     = new Filtro('g_cambiotema',__FILE__);
  $estudiante = new Estudiante();
  $estudiante->iniciarFiltro($filtro);
  $filtro_sql = $estudiante->filtrar($filtro);

  $estudiante->usuario_id = '%';
  
  $o_string   = $estudiante->getOrderString($filtro);
  $obj_mysql  = $estudiante->getAll('',$o_string,$filtro_sql,TRUE,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'g_cambiotema','',false);

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