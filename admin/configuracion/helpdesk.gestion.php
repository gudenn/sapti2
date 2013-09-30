<?php
try {
  define ("MODULO", "HELPDESK-GESTION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  leerClase("Helpdesk");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Ayuda');
  $smarty->assign('description','Gestion de Ayuda para el sistema');
  $smarty->assign('keywords','Helpdesk,Semestre');
  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administrador');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Gesti&oacute;n de Temas de Ayuda');
  $smarty->assign("menuList", $menuList);

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  //$CSS[]  = URL_CSS . "pg.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $smarty->assign('JS',$JS);

  if (isset($_GET['helpdesk_id']) && is_numeric($_GET['helpdesk_id']) && isset($_GET['activar']) && $_GET['activar'] )
  {
    $helpdesk = new Helpdesk($_GET['helpdesk_id']);
    if ($helpdesk->id)
    {
      $helpdesk->estado_helpdesk = Helpdesk::EST03_APROBA;
      $helpdesk->save();
    }
  }
  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/helpdesk/lista.tpl');

  //Filtro
  $filtro   = new Filtro('g_helpdesk',__FILE__);
  if (isset($_GET['todos']))
    $filtro->clearFiltro();
  $helpdesk = new Helpdesk();
  $helpdesk->iniciarFiltro($filtro);
  $filtro_sql = $helpdesk->filtrar($filtro);

  
  $o_string   = $helpdesk->getOrderString($filtro);
  $obj_mysql  = $helpdesk->getAll('',$o_string,$filtro_sql,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'g_helpdesk','',false);

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