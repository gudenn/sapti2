<?php
try {
  define ("MODULO", "NOTIFICACIONES");
  require_once('../_start.php');
  if(!isUserSession())
    header("Location: ../login.php");  
  
  
  
  leerClase("Usuario");
  leerClase("Proyecto");
  leerClase("Notificacion");
  leerClase("Notificacion_dicta");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");

  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Mis Notificaciones');
  $smarty->assign('description','Gesti&oacute;n de Mis Notificaciones');
  $smarty->assign('keywords','Gesti&oacute;n,Notificaciones');
  /**
   * Menu superior
   * hay que declarar esta variable en cada pagina para que esto funcione bien
   */
  if (!isset($menuList))
  {
    $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
    $menuList[]     = array('url'=>URL . Administrador::URL . 'notificaion/','name'=>'Notificaciones');
  }
  $smarty->assign("menuList", $menuList);

  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');
  
  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////

  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'notificacion/lista.tpl');
  
  
  //Filtro
  $filtro       = new Filtro('mis_notificaciones',__FILE__);
  $notificacion = new Notificacion();
  
  
  
  $notificacion->iniciarFiltro($filtro);
  $filtro_sql = $notificacion->filtrar($filtro);

  
  $o_string   = $notificacion->getOrderString($filtro);
  $usuario    = getSessionUser();
  $obj_mysql  = $notificacion->getTodasNotificaciones($usuario->id,'',$o_string,$filtro_sql,TRUE,TRUE);
 
  $objs_pg    = new Pagination($obj_mysql, 'mis_notificaciones','',false);


  $smarty->assign("filtros"  ,$filtro);
  $smarty->assign("objs"     ,$objs_pg->objs);
  $smarty->assign("pages"    ,$objs_pg->p_pages);

  // creo unas cuantas notificaciones de prueba
  $nueva_notificacion = new Notificacion();
  
  $nueva_notificacion->asunto      = "MEnsaje nuevo";
  $nueva_notificacion->detalle     = "MEnsaje nuevo";
  $nueva_notificacion->fecha_envio = date("d/m/Y");
  $nueva_notificacion->estado      = 'AC';
  $nueva_notificacion->prioridad   = '5';
  $nueva_notificacion->proyecto_id = '1';
  $nueva_notificacion->save();
  $nueva_notificacion->notificarTodos();
  
  var_dump($nueva_notificacion);
          


  //No hay ERROR
  $smarty->assign("ERROR",'');
  $smarty->assign("URL",URL);  

}
catch(Exception $e) 
{
  echo handleError($e);
  exit('ACAAA');
  $smarty->assign("ERROR", handleError($e));
}

if (isset($_GET['tlista']) && $_GET['tlista']) //recargamos la tabla central
  $smarty->display('admin/listas.lista.tpl'); 
else
  $smarty->display('admin/full-width.tpl');


?>