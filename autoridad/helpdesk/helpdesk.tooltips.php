<?php
try {
  define ("MODULO", "ADMIN-HELPDESK-TOOLTIPS");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  leerClase("Helpdesk");
  leerClase("Tooltip");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Ayudas Pendientes');
  $smarty->assign('description','Gesti&oacute;n de ventanas de Ayuda para el sistema');
  $smarty->assign('keywords','Helpdesk,tooltips,Semestre');
  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'helpdesk/','name'=>'Helpdesk SAPTI');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'helpdesk/'.basename(__FILE__),'name'=>'Gesti&oacute;n de Temas de Ayuda');
  $smarty->assign("menuList", $menuList);

  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/helpdesk/lista.opciones.tooltips.tpl');

  //Filtro
  $filtro   = new Filtro('g_helptoolt',__FILE__);
  if (isset($_GET['todos']))
    $filtro->clearFiltro();
  $helpdesk = new Helpdesk();
  $helpdesk->iniciarFiltro($filtro);
  $filtro_sql = $helpdesk->filtrar($filtro);

  
  $o_string   = $helpdesk->getOrderString($filtro);
  $obj_mysql  = $helpdesk->getAll('',$o_string,$filtro_sql,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'g_helptoolt','',false);

  $smarty->assign("helpdesk"  ,$helpdesk);
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