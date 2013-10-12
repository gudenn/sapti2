<?php
try {
 define ("MODULO", "DOCENTE-TRIBUNAL");
  require('_start.php');
if(!isDocenteSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Proyecto');
  $smarty->assign('description','');
  $smarty->assign('keywords','Proyecto Final');

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  
   // Agregan el css
  $CSS[]  = URL_JS . "calendar/css/eventCalendar.css";
  $CSS[]  = URL_JS . "calendar/css/eventCalendar_theme.css";
  $CSS[]  = URL_CSS . "dashboard.css";
  $CSS[]  = URL_CSS . "acordion.css";

// Agregan el js
  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "calendar/js/jquery.eventCalendar.js";
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);

  //CREAR UN DOCENTE
  leerClase('Usuario');
  leerClase('Docente');
  leerClase('Semestre');
  leerClase('Consejo');
  leerClase('Tribunal');
  leerClase('Menu');
  leerClase("Notificacion");
      /**
   * Menu superior
   */
  
  
  $notificacion = new Notificacion();
  $menuList[]     = array('url'=>URL.Tribunal::URL,'name'=>'Tribunal');
  $smarty->assign("menuList", $menuList);

  $menu = new Menu('Lista de Estudiantes');
  $link = Tribunal::URL."estudiante.lista.php";
  $menu->agregarItem('Gesti&oacute;n de Estudiantes','Revision y Vistos Buenos a los Proyectos','basicset/user4.png',$link);
  $link = Tribunal::URL."estudiante.lista.php";
  $menu->agregarItem('Dar Visto Buenos','Habilitar los Proyectos Para la Asignacion de Defensa','basicset/user4.png',$link);

  $menus[] = $menu;
 
 
  
  $menu = new Menu('Defensas');
  $link = Tribunal::URL."estudiante.lista.php";
  $menu->agregarItem('Lista de Defensa  Privada','Revision y modificacion de Proyectos','basicset/user4.png',$link);
  $link = Tribunal::URL."estudiante.lista.php";
  $menu->agregarItem('Lista de Defensa Publica ','Evaluaci&oacute;n de Proyecto','basicset/graph.png',$link);

  
  $menus[] = $menu;
  
  $notificaciontotal= $notificacion->getNotificacionTribunal(getSessionUser()->id);
    $menu = new Menu('Notificaciones');
    $link = Tribunal::URL."notificacion/notitribunal.php";
    $menu->agregarItem('Notificaciones','Geti&oacute;n de las Notificaciones','basicset/megaphone.png',$link,  sizeof($notificaciontotal));
    $menus[] = $menu;
  
  
  
  
  
 $smarty->assign("menus", $menus);
 
 
 
 
 
 
 
  $docente_aux = getSessionDocente();
   $smarty->assign("docente", $docente);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("ERROR", $ERROR);
 
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'docente/tribunal/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>