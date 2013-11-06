<?php
try {
  define ("MODULO", "ADMIN-HELPDESK");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  leerClase("Grupo");
  leerClase("Permiso");
  leerClase("Helpdesk");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n Accesos a Temas de Ayuda');
  $smarty->assign('description','Gesti&oacute;n de Ayuda para el sistema');
  $smarty->assign('keywords','Temas de Ayuda,Semestre');
  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'helpdesk/','name'=>'Temas de Ayuda');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'helpdesk/'.basename(__FILE__),'name'=>'Gesti&oacute;n de Permisos Para Temas de Ayuda');
  $smarty->assign("menuList", $menuList);


  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

  if (isset($_GET['permiso_id']) && is_numeric($_GET['permiso_id']) && isset($_GET['dar_acceso']) )
  {
    $permiso = new Permiso($_GET['permiso_id']);
    $permiso->ver = Permiso::NO;
    if ($_GET['dar_acceso'])
      $permiso->ver = Permiso::SI;
    $permiso->save();
  }
  
  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/helpdesk/lista.permisos.tpl');

  //Filtro
  $filtro   = new Filtro('asi_helpdesk',__FILE__);
  if (isset($_GET['todos']))
    $filtro->clearFiltro();
  $helpdesk = new Helpdesk();
  $helpdesk->iniciarFiltro($filtro);
  $filtro_sql = $helpdesk->filtrar($filtro);

  
  $o_string   = $helpdesk->getOrderString($filtro);
  $obj_mysql  = $helpdesk->getAll('',$o_string,$filtro_sql,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'asi_helpdesk','',false);

  $smarty->assign("helpdesk"  ,$helpdesk);
  $smarty->assign("filtros"  ,$filtro);
  $smarty->assign("objs_pg"  ,$objs_pg);
  $smarty->assign("objs"     ,$objs_pg->objs);
  $smarty->assign("pages"    ,$objs_pg->p_pages);


  
  $grupos = new Grupo();
  $grupos->verificaTodosAccesosHelpdesk();
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