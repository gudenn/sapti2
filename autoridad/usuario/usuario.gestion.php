<?php
try {
  define ("MODULO", "ADMIN-USUARIO-GESTION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  
  
  
  leerClase("Usuario");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Usuarios');
  $smarty->assign('description','P&aacute;gina de gesti&oacute;n de Usuarios');
  $smarty->assign('keywords','Gestion,Usuarios');

  
  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

  
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL,'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'usuario/','name'=>'Usuarios');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'usuario/'.basename(__FILE__),'name'=>'Gesti&oacute;n Usuarios');
  $smarty->assign("menuList", $menuList);


  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////


  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/usuario/lista.tpl');

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
  
   //Habilitamos para proffecionales y para no profecionales
  if ( isset($_GET['id_usuario']) && is_numeric($_GET['id_usuario']) )
  {
    $usuario_aux = new Usuario($_GET['id_usuario']);
    $usuario_aux->estado=  Objectbase::STATUS_IN;
    $usuario_aux->save();
  }
  
  
  $o_string   = $usuario->getOrderString($filtro);
  $obj_mysql  = $usuario->getAll('',$o_string,$filtro_sql,TRUE,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'usuario','',false);


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