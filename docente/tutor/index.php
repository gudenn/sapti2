<?php
try {

     define ("MODULO", "DOCENTE");
  require('../_start.php');
 
  if(!isDocenteSession() && !isTutorSession() )
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Tutor');
  $smarty->assign('description','Men&uacute de Tutor&iacuteas');
  $smarty->assign('keywords','Tutor');

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  
   // Agregan el css
  $CSS[]  = URL_JS . "calendar/css/eventCalendar.css";
  $CSS[]  = URL_JS . "calendar/css/eventCalendar_theme.css";
  $CSS[]  = URL_CSS . "dashboard.css";

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
 $usuario      = getSessionUser();

  $menuList[]     = array('url'=>URL.Tutor::URL,'name'=>'Tutor');
  $smarty->assign("menuList", $menuList);
  $notificaciones= new Notificacion();
  leerClase('Menu');
  leerClase('Tutor');
  $menu = new Menu('Lista de Estudiantes Tutorados de  METODOL. Y PLANIF. de proyecto de Grado');
  
  $link = Tutor::URL."perfil.seguimiento.lista.php";
  $menu->agregarItem('Estudiantes Tutorados','Lista de Estudiantes Tutorados','basicset/user4.png',$link);
   $link = Tutor::URL."perfil.estudiante.lista.php";
  $menu->agregarItem('Dar Visto Bueno ','Visto Bueno a los Proyectos de los Estudiantes Tutorados','basicset/ok.png',$link);
 $link = Tutor::URL."perfil.vistobueno.lista.php";
  $menu->agregarItem('Lista  de  Visto Bueno  ','Lista de Proyectos Aprobados','basicset/ok.png',$link);

  $menus[] = $menu;
   $thise = new Menu('Notificaciones y Mensajes');
   $link = Docente::URL."notificacion/";
   $thise->agregarItem('Notificaciones','Gesti&oacute;n de Notificaciones','basicset/message-archived.png',$link);
   $link = Docente::URL."notificacion/notificacion.gestion.php?estado_notificacion=SV";
   $counter = $notificaciones->getTodasNotificaciones($usuario->id, '', '', ' AND estado_notificacion="SV" ');
   $thise->agregarItem('Notificaciones Pendientes','Todas las notificaciones no le&iacute;das','basicset/message-not-read.png',$link,$counter[1]);
   $menus[] = $thise;
  
  $menu = new Menu('Lista de Estudiantes Tutorados De Proyecto Final');
  $link = Tutor::URL."seguimiento.lista.php";
  $menu->agregarItem('Estudiantes Tutorados','Lista de Estudiantes Tutorados','basicset/user4.png',$link);
  $link = Tutor::URL."estudiante.lista.php";
  $menu->agregarItem(' Dar Visto Bueno ','Visto Bueno a los Proyectos de los Estudiantes Tutorados','basicset/ok.png',$link);
   $link = Tutor::URL."proyecto.vistobueno.lista.php";
  $menu->agregarItem('Lista Visto Bueno ','Lista de Proyectos Aprobados','basicset/ok.png',$link);

  
  $menus[] = $menu;
   
  
 $smarty->assign("menus", $menus);
  
  $docente_aux = getSessionDocente();
  $docente     = new Docente($docente_aux->id);
  $usuario     = $docente->getUsuario();
  
  $smarty->assign("docente", $docente);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("ERROR", $ERROR);
 
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
    echo $e;
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'docente/tutor/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>