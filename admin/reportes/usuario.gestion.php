<?php
try {
  require('_start.php');
  if(!isAdminSession())
    header("Location: login.php");  
  
  //MODULO -> REGISTRO DE MERCADERIA
  //ACCION -> GESTION
  

  
  
  
  
  leerClase("Usuario");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gestion de Usuarios');
  $smarty->assign('description','Pagina de gestion de Usuarios');
  $smarty->assign('keywords','Gestion,Usuarios');

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
  $smarty->assign('lista'       ,'admin/usuario.lista.tpl');

  //Filtro
  $filtro     = new Filtro('usuario',__FILE__);
  $usuario = new Usuario();
  $usuario->iniciarFiltro($filtro);
  $filtro_sql = $usuario->filtrar($filtro);

  /*
  $usuario->pais_id         = '%';
  $usuario->departamento_id = '%';
  $usuario->ciudad_id       = '%';
*/
  //Habilitamos para proffecionales y para no profecionales
  if ( isset($_GET['es_profecional']) && is_numeric($_GET['es_profecional']) )
  {
    $usuario_aux = new Usuario($_GET['es_profecional']);
    $usuario_aux->puede_ser_tutor = Usuario::PROFECIONAL;
    $usuario_aux->save();
  }
  //Habilitamos para proffecionales y para no profecionales
  if ( isset($_GET['noes_profecional']) && is_numeric($_GET['noes_profecional']) )
  {
    $usuario_aux = new Usuario($_GET['noes_profecional']);
    $usuario_aux->puede_ser_tutor = Usuario::NOPROFECIONAL;
    $usuario_aux->save();
  }
  
  
  $o_string   = $usuario->getOrderString($filtro);
  $obj_mysql  = $usuario->getAll('',$o_string,$filtro_sql,TRUE,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'usuario','',false,10);


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