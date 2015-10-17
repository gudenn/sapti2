<?php
try {
define ("MODULO", "DOCENTE");
  require('../_start.php');
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
   $privada='';
   $publica='';
   $docente = getSessionDocente();
  $publica=$docente->getTotalDefensasPublicas();
  $notificacion = new Notificacion();

  $menuList[]     = array('url'=>URL.Docente::URL.'tribunal','name'=>'Tribunal');
  $smarty->assign("menuList", $menuList);

  $menu = new Menu('Lista de Estudiantes');
  $link = Tribunal::URL."seguimiento.lista.php";
  $menu->agregarItem('Gesti&oacute;n de Estudiantes','Revisión y Vistos Buenos a los Proyectos','basicset/user4.png',$link,$docente->getTotalEstudiantesTribunal());
  $link = Tribunal::URL."estudiante.lista.php";
  $menu->agregarItem('Dar Visto Bueno','Habilitar los Proyectos Para la Asignación de Defensa','basicset/ok.png',$link,$docente->getTotalEstudiantesSinVistoBueno());
 $link = Tribunal::URL."visto.estudiante.lista.php";
  $menu->agregarItem('Lista de Visto Bueno','Habilitar los Proyectos Para la Asignación de Defensa','basicset/ok.png',$link,$docente->getTotalEstudiantesConVistoBueno());

  $menus[] = $menu;
 
   $menu = new Menu('Defensas');
  $link = Tribunal::URL."privada.estudiante.lista.php";
  $menu->agregarItem('Lista de Defensa  Privada','Revisión y modificación de Proyectos','tribunal.png',$link,$privada);
  $link = Tribunal::URL."publica.estudiante.lista.php";
  
  $menu->agregarItem('Lista de Defensa Publica ','Evaluaci&oacute;n de Proyecto','tribunal.png',$link, $publica);

  
    $menus[] = $menu;

    $smarty->assign("menus", $menus);
 
    
   
   
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