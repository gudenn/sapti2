<?php
try {
   require('../_start.php');
  
  
  
  leerClase("Grupo");
  leerClase("Usuario");
  leerClase("Pertenece");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Asignar grupos a Usuarios');
  $smarty->assign('description','Asignar grupos a Usuarios');
  $smarty->assign('keywords','Gestion,Usuarios');

  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

    
  //grabamos un usario en un determinado grupo
  if (
        isset($_GET['pertenece_id'])    && 
        isset($_GET['asignar_grupo'])   && 
        isset($_GET['usuario_id'])      && 
        isset($_GET['grupo_id'])        && 
        is_numeric($_GET['usuario_id']) && 
        is_numeric($_GET['grupo_id']) ) {
    $id = '';
    if (is_numeric(($_GET['pertenece_id'])))
      $id = ($_GET['pertenece_id']);
    $pertenece = new Pertenece($id);
    $usuario   = new Usuario($_GET['usuario_id']);
    $grupo     = new Grupo($_GET['grupo_id']);
    if ( $_GET['asignar_grupo'] == 1 )
    {
      $usuario->asignarGrupo($grupo->codigo);
      $usuario->crearObjetoxParaGrupo($grupo);
    }
    else
      $pertenece->delete();
  }
  
  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////


  $smarty->assign('mascara'     ,'docente/configuracion/listas.mascara.tpl');
  $smarty->assign('lista'       ,'docente/configuracion/asignar.grupo.tpl');

  //Filtro
  $filtro     = new Filtro('usuarioasignar',__FILE__);
  if (isset($_GET['todos']))
    $filtro->clearFiltro();
  $usuariox = new Usuario();
  $usuariox->iniciarFiltro($filtro);
  $filtro_sql = $usuariox->filtrar($filtro);

  
  
  $o_string   = $usuariox->getOrderString($filtro);
  $obj_mysql  = $usuariox->getAll('',$o_string,$filtro_sql,TRUE,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'usuarioasignar','',false);


  $smarty->assign("usuario"  ,$usuariox);
  $smarty->assign("filtros"  ,$filtro);
  $smarty->assign("objs_pg"  ,$objs_pg);
  $smarty->assign("objs"     ,$objs_pg->objs);
  $smarty->assign("pages"    ,$objs_pg->p_pages);

  $grupos = new Grupo();
    
    
  $smarty->assign("grupos",$grupos->getGrupos());




  //No hay ERROR
  $smarty->assign("ERROR",'');
  $smarty->assign("URL",URL);  

}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

if (isset($_GET['tlista']) && $_GET['tlista']) //recargamos la tabla central
  $smarty->display('docente/configuracion/listas.lista.tpl'); 
else
  $smarty->display('docente/configuracion/full-width.tpl');


?>