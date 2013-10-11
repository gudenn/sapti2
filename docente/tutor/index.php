<?php
try {
 define ("MODULO", "DOCENTE-TUTOR");
  require('_start.php');
 if(!isDocenteSession())
  header("Location: login.php");  

  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
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
  leerClase('Tutor');
  leerClase('Notificacion');
  

      /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Tutor::URL,'name'=>'Tutor');
  $smarty->assign("menuList", $menuList);
$notificaciones= new Notificacion();
  leerClase('Menu');
  leerClase('Tutor');
  $menu = new Menu('Lista de Estudiantes  de Perfil');
  
  $link = Tutor::URL."estudiante.lista.php";
  $menu->agregarItem('Seguimiento','Seguimiento a los Estudiantes ','basicset/user4.png',$link);
   $link = Tutor::URL."perfil.estudiante.lista.php";
  $menu->agregarItem('Dar Visto Bueno Perfil ','Reportes correspondientes a los Docentes','basicset/graph.png',$link);

  $menus[] = $menu;
  
  $menu = new Menu('Lista de Estudiantes De Proyecto Final');
  $link = Tutor::URL."estudiante.lista.php";
  $menu->agregarItem('Seguimiento a los estudiantes ','Registro y modificacion de tribunales','basicset/user4.png',$link);
  $link = Tutor::URL."estudiante.lista.php";
  $menu->agregarItem(' Dar Visto Bueno ','Reportes correspondientes a los Docentes','basicset/graph.png',$link);

  
  $menus[] = $menu;
  
   $notificaciones->getNotificacionTutor(getSessionUser()->id);
    $menu = new Menu('Notificaciones');
    $link = Tutor::URL."notificacion/notitutor.php";
    $menu->agregarItem('Notificaciones','Geti&oacute;n de las Notificaciones','basicset/megaphone.png',$link,  sizeof($notificaciones));
    $menus[] = $menu;
  
  
  
  
  
 $smarty->assign("menus", $menus);
  
  $docente_aux = getSessionDocente();
  $docente     = new Docente($docente_aux->docente_id);
  $usuario     = $docente->getUsuario();
  


  $smarty->assign("docente", $docente);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("ERROR", $ERROR);
 
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'docente/tutor/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>