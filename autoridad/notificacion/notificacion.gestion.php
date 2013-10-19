<?php
try {
  if (!defined('MODULO'))
  {
    define ("MODULO", "NOTIFICACION");
    require('../_start.php');
  }
  if(!isUserSession())
    header("Location: ../login.php");  

  
  
  
  leerClase("Usuario");
  leerClase("Proyecto");
  leerClase("Notificacion");
  leerClase("Notificacion_consejo");
  leerClase("Notificacion_dicta");
  leerClase("Notificacion_estudiante");
  leerClase("Notificacion_revisor");
  leerClase("Notificacion_tribunal");
  leerClase("Notificacion_tutor");
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
    $menuList[]     = array('url'=>URL . Administrador::URL . 'notificacion/','name'=>'Notificaciones');
    $menuList[]     = array('url'=>URL . Administrador::URL . 'notificacion/notificacion.gestion.php','name'=>'Archivo de Notificaiones');
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
  
  // creo unas cuantas notificaciones de prueba
  // para testeo habilitar estas lineas
  /**
  $nueva_notificacion = new Notificacion();
  $tipo = array('N01','N02','N03');
  
  $nueva_notificacion->asunto      = "Mensaje nuevo";
  $nueva_notificacion->detalle     = "Mensaje nuevo ";
  $nueva_notificacion->fecha_envio = date("d/m/Y");
  $nueva_notificacion->estado      = 'AC';
  $nueva_notificacion->prioridad   = rand(1, 10);
  $nueva_notificacion->tipo        = $tipo[rand(0, 2)];  
  $nueva_notificacion->proyecto_id = '1';
  $nueva_notificacion->notificarTodos();
  
  var_dump($nueva_notificacion);
  /**/ 

  //Filtro
  $filtro       = new Filtro('mis_notificaciones',__FILE__);
  $notificacion = new Notificacion();
  
  
  
  $notificacion->iniciarFiltro($filtro);
  $filtro_sql = $notificacion->filtrar($filtro);

  
  $o_string   = $notificacion->getOrderString($filtro);
  $usuario    = getSessionUser();
  $obj_mysql  = $notificacion->getTodasNotificaciones($usuario->id,'',$o_string,$filtro_sql,TRUE);
  
 
  $objs_pg    = new Pagination($obj_mysql, 'mis_notificaciones','',false);


  $smarty->assign("filtros"       ,$filtro);
  $smarty->assign("objs_pg"       ,$objs_pg);
  $smarty->assign("objs"          ,$objs_pg->objs);
  $smarty->assign("pages"         ,$objs_pg->p_pages);
  $smarty->assign("notificacion"  ,$notificacion);

       


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