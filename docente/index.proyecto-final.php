<?php
try {
  define ("MODULO", "DOCENTE");
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
  leerClase('Notificacion');
  leerClase('Dicta');

  if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) )
  {
     $iddicta                = $_GET['iddicta'];
     $_SESSION['iddictapro'] = $iddicta;
  }  else {
      $iddicta=$_SESSION['iddictapro'];
  }
  $dicta=new Dicta($iddicta);
  
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.proyecto-final.php','name'=>$dicta->getNombreMateria());
  $smarty->assign("menuList", $menuList);
  
  $docente     = getSessionDocente();
  $usuario     = $docente->getUsuario();
  
  $smarty->assign("docente", $docente);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("iddicta", $iddicta);
  $smarty->assign("ERROR", $ERROR);
  
  /**
   * Menu central
   */
  //----------------------------------//
  leerClase('Menu');
  $menu = new Menu('Estudiantes');
  $link = Docente::URL."estudiante/estudiante.lista.php";
  $menu->agregarItem('Estudiantes Registrados','Estudiantes Registrados en la Materia de Proyecto Final','docente/inscritos.png',$link);
  $link = Docente::URL."evaluacion/estudiante.evaluacion-editar.php";
  $menu->agregarItem('Evaluacion de Estudiantes','Evaluacion de Estudiantes Registrados en la Materia de Proyecto Final','docente/evaluacion.png',$link);  
  $link = Docente::URL."estudiante/inscripcion.estudiante-cvs.php";
  $menu->agregarItem('Gesti&oacute;n de Estudiantes','Registro de Estudiantes Inscritos en la Materia de Proyecto Final','docente/correccion.png',$link);
  $menus[] = $menu;
  
  $menu = new Menu('Calendario');
  $link = Docente::URL."calendario/calendario.evento.php";
  $menu->agregarItem('Calendario de Eventos','Calendario de todos los Eventos registrados por Tutor(es), Docente(s) y Tribunales','docente/calendar.png',$link);
  $link = Docente::URL."calendario/evento.registro.php";
  $menu->agregarItem('Registro de Eventos','Registro de Eventos y en la Materia de Proyecto Final','docente/registroeve.png',$link);
  $link = Docente::URL."calendario/evento.lista.php";
  $menu->agregarItem('Edici&oacute;n de Eventos','Edici&oacute;n de Eventos de la Materia de Proyecto Final','docente/edicion.png',$link);
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