<?php
try {
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
  //$CSS[]  = URL_CSS . "acordion.css";

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

      /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.basename(__FILE__),'name'=>'Gestion Estudiantes');
  $smarty->assign("menuList", $menuList);

    if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) )
  {
     $iddicta = $_GET['iddicta'];
  }

  $docente_aux = getSessionDocente();
  $docente     = new Docente($docente_aux->docente_id);
  $usuario     = $docente->getUsuario();
  
  $smarty->assign("docente", $docente);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("iddicta", $iddicta);
  $smarty->assign("ERROR", $ERROR);
  
  //$smarty->assign("columnacentro", 'docente/index.proyecto-final.tpl');
  
    /**
   * Menu central
   */
  //----------------------------------//
  leerClase('Menu');
  $menu = new Menu('Estudiantes');
  $link = Docente::URL."estudiante/inscripcion.estudiante-cvs.php?iddicta={$iddicta}";
  $menu->agregarItem('Gesti&oacute;n de Estudiantes','Registro de Estudiantes Inscritos en la Materia de Proyecto Final','docente/correccion.png',$link);
  $link = Docente::URL."estudiante/estudiante.lista.php?iddicta={$iddicta}";
  $menu->agregarItem('Estudiantes Registrados','Estudiantes Registrados en la Materia de Proyecto Final','docente/inscritos.png',$link);
  $link = Docente::URL."evaluacion/estudiante.evaluacion-editar.php?iddicta={$iddicta}";
  $menu->agregarItem('Evaluacion de Estudiantes','Evaluacion de Estudiantes Registrados en la Materia de Proyecto Final','docente/evaluacion.png',$link);  
  $menus[] = $menu;
  
  $menu = new Menu('Calendario');
  $link = Docente::URL."calendario/calendario.evento.php";
  $menu->agregarItem('Calendario de Eventos','Calendario de todos los Eventos registrados por Tutor(es), Docente(s) y Tribunales','docente/calendar.png',$link);
  $link = Docente::URL."calendario/evento.registro.php?iddicta={$iddicta}";
  $menu->agregarItem('Registro de Eventos','Registro de Eventos y en la Materia de Proyecto Final','docente/registroeve.png',$link);
  $link = Docente::URL."calendario/evento.lista.php?iddicta={$iddicta}";
  $menu->agregarItem('Edici&oacute;n de Eventos','Edici&oacute;n de Eventos de la Materia de Proyecto Final','docente/edicion.png',$link);
  $menus[] = $menu;
  
  $menu = new Menu('Notificaciones y Mensajes');
  $link = Docente::URL."calendario/calendario.evento.php";
  $menu->agregarItem('Notificaiones','Notificaciones para el Proyecto Final','docente/notificacion.png',$link);
  $link = Docente::URL."calendario/evento.registro.php?iddicta={$iddicta}";
  $menu->agregarItem('Mensajes','Mensajes para el Proyecto Final','docente/notificacion.png',$link);
  $menus[] = $menu;
  
  $menu = new Menu('Configuracion');
  $link = Docente::URL."disponibilidad.php";
  $menu->agregarItem('Tiempo','Agregue Disponibilidad de tiempo','docente/notificacion.png',$link);
  $link = Docente::URL."configuracion.php";
  $menu->agregarItem('Areas','Agregue las de interes para ser tribunal','docente/notificacion.png',$link);
  $link = Docente::URL."configuracion.php";
  $menu->agregarItem('Areas','Agregue las de interes para ser tribunal','docente/notificacion.png',$link);  
  $menus[] = $menu;
  //----------------------------------//
  
  
  $smarty->assign("menus", $menus);
  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'docente/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>