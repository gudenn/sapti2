<?php
try {
  if (!defined('MODULO'))
  {
    define ("MODULO", "NOTIFICACION");
    require('../_start.php');
  }
  if(!isUserSession())
    header("Location: ../login.php");  


  
  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Accesos');
  $smarty->assign('description','Gesti&oacute;n de Accesos');
  $smarty->assign('keywords','Gesti&oacute;n de Accesos');

  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

 /**
  * Clases
  */
  leerClase('Usuario');
  leerClase('Notificacion');
  $usuario      = getSessionUser();
  $notificacion = new Notificacion();
  
  /**
   * Menu superior
   * hay que declarar esta variable en cada pagina para que esto funcione bien
   */
  if (!isset($menuList))
  {
    $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
    $menuList[]     = array('url'=>URL . Administrador::URL . 'notificacion/','name'=>'Notificaciones');
  }
  $smarty->assign("menuList", $menuList);

  // Url para los links
  if (!isset($url_base))
  {
    $url_base = Administrador::URL;
  }
  

  /**
   * Menu central
   */
  //----------------------------------//
  if (!isset($menus))
  {
    leerClase('Menu');
    $menu = new Menu('Notificaciones y Mensajes');
    $counter = $notificacion->getTodasNotificaciones($usuario->id, '', '', '');
    $link = $url_base."notificacion/notificacion.gestion.php?estado_notificacion=";
    $menu->agregarItem('Archivo de notificaciones','Archivo de Todas las notificaciones y mensajes','basicset/message-archived.png',$link,'',$counter[1]);
    $counter = $notificacion->getTodasNotificaciones($usuario->id, '', '', " AND estado_notificacion='VI' ");
    $link = $url_base."notificacion/notificacion.gestion.php?estado_notificacion=VI";
    $menu->agregarItem('Notificaciones Leidas','Todas las notificaciones leidas','basicset/message-already-read.png',$link,'',$counter[1]);
    $counter = $notificacion->getTodasNotificaciones($usuario->id, '', '', " AND estado_notificacion='AR' ");
    $link = $url_base."notificacion/notificacion.gestion.php?estado_notificacion=AR";
    $menu->agregarItem('Nortificaciones Archivadas','Notificaciones archivadas','basicset/message-archived.png',$link,'',$counter[1]);
    $menus[] = $menu;
    $menu = new Menu('Notificaciones Pendientes');
    // CONTADOR
    $counter = $notificacion->getTodasNotificaciones($usuario->id, '', '', ' AND estado_notificacion="SV" ');
    $link    = $url_base."notificacion/notificacion.gestion.php?estado_notificacion=SV";
    $menu->agregarItem('Notificaciones Pendientes','Todas las notificaciones no leidas','basicset/message-not-read.png',$link,$counter[1]);
    $menus[] = $menu;
  }
  //----------------------------------//
  
  
  $smarty->assign("menus", $menus);

  
  $smarty->assign("ERROR", $ERROR);
  

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'admin/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>