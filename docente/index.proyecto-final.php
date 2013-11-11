<?php
try {
  define ("MODULO", "DOCENTE");
  require('_start.php');
  if(!isDocenteSession())
    header("Location: login.php");  

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

  $docente     = getSessionDocente();
  $usuario     = $docente->getUsuario();

  if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) && $docente->getDictaverifica($_GET['iddicta']))
  {
     $iddicta                = $_GET['iddicta'];
  }  else {
        header("Location: ../index.php");
  }
  $dicta=new Dicta($iddicta);
    /** HEADER */
  $smarty->assign('title',$dicta->getNombreMateria());
  $smarty->assign('description',$dicta->getNombreMateria());
  $smarty->assign('keywords','Proyecto Final');
  
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.proyecto-final.php?iddicta='.$iddicta,'name'=>$dicta->getNombreMateria());
  $smarty->assign("menuList", $menuList);
  
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
  $link = Docente::URL."estudiante/estudiante.lista.php?iddicta=".$iddicta;
  $menu->agregarItem('Estudiantes Registrados','Estudiantes Registrados en la Materia de '.$dicta->getNombreMateria(),'docente/inscritos.png',$link);
  $link = Docente::URL."evaluacion/estudiante.evaluacion-editar.php?iddicta=".$iddicta;
  $menu->agregarItem('Evaluaci&oacute;n de Estudiantes','Evaluaci&oacute;n de Estudiantes Registrados en la Materia de '.$dicta->getNombreMateria(),'docente/evaluacion.png',$link);  
  $link = Docente::URL."estudiante/inscripcion.estudiante-cvs.php?iddicta=".$iddicta;
  $menu->agregarItem('Inscripci&oacute;n de Estudiantes','Registro de Estudiantes Inscritos en la Materia de '.$dicta->getNombreMateria(),'docente/correccion.png',$link);
  $menus[] = $menu;
  
  $menu = new Menu('Calendario');
  $link = Docente::URL."calendario/calendario.evento.php?iddicta=".$iddicta;
  $menu->agregarItem('Calendario de Eventos','Calendario de todos los Eventos registrados por Tutor(es), Docente(s) y Tribunales','docente/calendar.png',$link);
  $link = Docente::URL."calendario/evento.registro.php?iddicta=".$iddicta;
  $menu->agregarItem('Registro de Eventos','Registro de Eventos y en la Materia de '.$dicta->getNombreMateria(),'docente/registroeve.png',$link);
  $link = Docente::URL."calendario/evento.lista.php?iddicta=".$iddicta;
  $menu->agregarItem('Edici&oacute;n de Eventos','Edici&oacute;n de Eventos de la Materia de '.$dicta->getNombreMateria(),'docente/edicion.png',$link);
  $menus[] = $menu;

  $menu = new Menu('Aprobaciones');
  $link = Docente::URL."vistobueno/estudiante.vistobueno.php?iddicta=".$iddicta;
  $menu->agregarItem('Lista de Estudiantes','Lista de Estudiantes en Espera de Revision y Visto Bueno de su proyecto','docente/calendar.png',$link);
  $link = Docente::URL."vistobueno/estudiante.lista.vistobueno.php?iddicta=".$iddicta;
  $menu->agregarItem('Lista de Estudiantes con Visto Bueno','Lista de Estudiantes en que Revision y aprobo con el Visto Bueno de su proyecto','docente/edicion.png',$link);
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