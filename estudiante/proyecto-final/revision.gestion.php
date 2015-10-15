<?php
try {
  define ("MODULO", "ESTUDIANTE");
  require('../_start.php');
  if(!isEstudianteSession())
    header("Location: ../login.php");  

  leerClase("Estudiante");
  leerClase("Usuario");
  leerClase("Revision");
  leerClase("Observacion");
  leerClase("Proyecto");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Correcciones');
  $smarty->assign('description','P&aacute;gina de gesti&oacute;n de Correcciones');
  $smarty->assign('keywords','Gesti&oacute;n,Correcciones');

  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Estudiante::URL,'name'=>'Estudiante');
  $menuList[]     = array('url'=>URL.Estudiante::URL.Proyecto::URL,'name'=>'Proyecto Final');
  $menuList[]     = array('url'=>URL.Estudiante::URL.Proyecto::URL.basename(__FILE__),'name'=>'Archivo de Correcciones');
  $smarty->assign("menuList", $menuList);

  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////

  $estudiante     = getSessionEstudiante();
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();
  
  $smarty->assign("estudiante", $estudiante);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("proyecto", $proyecto);
  $smarty->assign("E1_CREADO", Revision::E1_CREADO);
  $smarty->assign("ERROR", $ERROR);
  
  
//Filtro
  $filtro   = new Filtro('e_revision',__FILE__);
  $revision = new Revision();
  $revision->iniciarFiltro($filtro);
  $filtro_sql   = $revision->filtrar($filtro);
  $revision->proyecto_id = $proyecto->id;
  $smarty->assign("revision"  ,$revision);
  
  $o_string   = $revision->getOrderString($filtro);
  if($o_string==''){
      $o_string='ORDER BY revision.fecha_revision DESC';
  }
  $obj_mysql  = $revision->getAll('',$o_string,$filtro_sql,TRUE,TRUE);
  
 
  $objs_pg    = new Pagination($obj_mysql, 'e_revision','',false,10);

  //var_dump($objs_pg->objs);
  
  $smarty->assign("revision" ,$revision);
  $smarty->assign("filtros"  ,$filtro);
  $smarty->assign("objs"     ,$objs_pg->objs);
  $smarty->assign("pages"    ,$objs_pg->p_pages);


  $smarty->assign('mascara'     ,'estudiante/listas.mascara.tpl');
  $smarty->assign('lista'       ,'estudiante/correcion.lista.tpl');

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