<?php
try {
  require('_start.php');
  global $PAISBOX;

  /** HEADER */
   leerClase("Usuario");
   leerClase("Docente");
   leerClase("Estudiante");
   leerClase("Formulario");
   leerClase("Pagination");
   leerClase("Filtro");


  $ERROR ='';

  /** HEADER */
  $smarty->assign('title','Enviar Solicitud');
  $smarty->assign('description','Pagina de listado de tutores');
  $smarty->assign('keywords','Docentes');

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  //$CSS[]  = URL_CSS . "pg.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.js";
  $smarty->assign('JS',$JS);


  $smarty->assign('mascara'     ,'admin/tutoradmin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/tutoradmin/lista.tutores.tpl');

  //Filtro
  $filtro     = new Filtro('g_docente',__FILE__);
  $docente = new Docente();
 $docente->iniciarFiltro($filtro);
  $filtro_sql = $docente->filtrar($filtro);

  $docente->usuario_id = '%';
  
  $o_string   = $docente->getOrderString($filtro);
  $obj_mysql  = $docente->getAll('',$o_string,$filtro_sql,TRUE,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'g_estudiante','',false,10);

  $smarty->assign("filtros"  ,$filtro);
  $smarty->assign("objs"     ,$objs_pg->objs);
  $smarty->assign("pages"    ,$objs_pg->p_pages);

  
  
  if (isset($_GET['estudiante_id']) && $_GET['estudiante_id'])
  { 
    //echo $_GET['estudiante_id'];
    
    $estudiante = new Estudiante($_GET['estudiante_id']);
    $proyecto =  $estudiante->getProyecto();
    $proyecto->id;
    $usuarios= new Usuario($estudiante->usuario_id);
    $smarty->assign("proyecto",$proyecto);
    $smarty->assign("estudiante", $estudiante);
    $smarty->assign("usuario",$usuarios);
    
               
  }
  



  //No hay ERROR
  $smarty->assign("ERROR",'');
  $smarty->assign("URL",URL);  
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

if (isset($_GET['tlista']) && $_GET['tlista']) //recargamos la tabla central
{
  $smarty->display('admin/tutoradmin/lista.asignar.tpl'); 
}
else
{
  $smarty->display('admin/tutoradmin/full-width.lista.correcion.tpl');
}
?>