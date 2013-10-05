<?php
try {
  define ("MODULO", "ADMIN-USUARIO-ASIGNARGRUPO");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  
  
  //MODULO -> REGISTRO DE MERCADERIA
  //ACCION -> GESTION

  
  
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

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  //$CSS[]  = URL_CSS . "pg.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.js";
  $smarty->assign('JS',$JS);

  
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL,'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'usuario/','name'=>'Usuarios');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'usuario/'.basename(__FILE__),'name'=>'Asignar Grupos');
  $smarty->assign("menuList", $menuList);


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
    if ($_GET['asignar_grupo']==1)
    {
      $pertenece->usuario_id = $_GET['usuario_id'];
      $pertenece->grupo_id   = $_GET['grupo_id'];
      $pertenece->estado     = Objectbase::STATUS_AC;
      $pertenece->save();
    }
    else
      $pertenece->delete();
  }
  
  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////


  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/usuario/asignar.grupo.tpl');

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
  $smarty->display('admin/listas.lista.tpl'); 
else
  $smarty->display('admin/full-width.tpl');


?>