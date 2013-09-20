<?php
try {
  define ("MODULO", "TUTOR-GESTION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  
  
  
  
  leerClase("Usuario");
  leerClase("Tutor");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gestion de Tutores');
  $smarty->assign('description','Pagina de gestion de Tutores');
  $smarty->assign('keywords','Gestion,Tutores');

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
  $smarty->assign('lista'       ,'admin/tutor/gestion.lista.tpl');

  //Filtro
  $filtro     = new Filtro('tutor',__FILE__);
  $tutor      = new Tutor();
  
  $tutor->iniciarFiltro($filtro);
  $filtro_sql = $tutor->filtrar($filtro);

  $tutor->usuario_id   = '%';
  $o_string   = $tutor->getOrderString($filtro);
  $obj_mysql  = $tutor->getAll('',$o_string,$filtro_sql,TRUE,TRUE);

  $objs_pg    = new Pagination($obj_mysql, 'tutor','',false);


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