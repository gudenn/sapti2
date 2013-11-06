<?php
try {

     define ("MODULO", "DOCENTE");
  require('../_start.php');
 
 if(!isDocenteSession())
  header("Location: ../login.php");  

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
   $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $menuList[]     = array('url'=>URL.Tutor::URL,'name'=>'Tutor');
  $smarty->assign("menuList", $menuList);
$notificaciones= new Notificacion();
  leerClase('Menu');
  leerClase('Tutor');
  $menu = new Menu('Lista de Estudiantes  de Perfil');
  
  $link = Tutor::URL."perfil.estudiante.lista.php";
  $menu->agregarItem('Seguimiento','Seguimiento a los Estudiantes ','basicset/user4.png',$link);
   $link = Tutor::URL."perfil.estudiante.lista.php";
  $menu->agregarItem('Dar Visto Bueno ','Dar visto Bueno a los Proyectos de Los Estudiantes','basicset/ok.png',$link);
 $link = Tutor::URL."perfil.vistobueno.lista.php";
  $menu->agregarItem('Lista  de  Visto Bueno  ','Lista de Proyectos Aprobados','basicset/ok.png',$link);

  $menus[] = $menu;
  
  $menu = new Menu('Lista de Estudiantes De Proyecto Final');
  $link = Tutor::URL."seguimiento.lista.php";
  $menu->agregarItem('Seguimiento a los estudiantes ','Seguimiento al Proyecto de los Estudiantes','basicset/user4.png',$link);
  $link = Tutor::URL."estudiante.lista.php";
  $menu->agregarItem(' Dar Visto Bueno ','Visto Bueno a los Proyectos','basicset/ok.png',$link);
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
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'docente/tutor/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>