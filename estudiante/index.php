<?php
try {
  define ("MODULO", "ESTUDIANTE");
  require('_start.php');
  if(!isEstudianteSession())
    header("Location: login.php");  

  
  /** HEADER */
  $smarty->assign('title','Sistema SAPTI - Estudiante');
  $smarty->assign('description','Entorno de trabajo del Estudiante');
  $smarty->assign('keywords','Estudiante,SAPTI');

  //CSS
  $CSS[]  = URL_CSS . "dashboard.css";
  $CSS[]  = URL_CSS . "academic/3_column.css";


  //JS
  $JS[]  = URL_JS ."jquery.min.js";
  //Calendar
  $CSS[]  = URL_JS . "calendar/css/eventCalendar.css";
  $CSS[]  = URL_JS . "calendar/css/eventCalendar_theme.css";
  $JS[]   = URL_JS . "calendar/js/jquery.eventCalendar.js";  
  
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);

  // Escritorio del estuddinate
  leerClase('Usuario');
  leerClase('Proyecto');
  leerClase('Estudiante');
  leerClase('Visto_bueno');
  leerClase('Vigencia');
  
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Estudiante::URL,'name'=>'Estudiante');
  $smarty->assign("menuList", $menuList);
  
  
  
  
  $usuario_aux    = getSessionUser();
  $usuario        = new Usuario($usuario_aux->id);
  $usuario->getAllObjects();
  $estudiante     = new Estudiante();
  if (isset($usuario->estudiante_objs[0]))
    $estudiante = $usuario->estudiante_objs[0];
  $proyecto       = $estudiante->getProyecto();
  //$proyecto= new Proyecto($proyecto->id);

  /*
   * no viene al caso
   $vistod   = $proyecto->getVbDocente();
   $vistodoc = $vistod[0]->visto_bueno_tipo;
   $vistot   = $proyecto->getVbTutor();
   $vistotu  = $vistot[0]->visto_bueno_tipo;
   $vb       = Proyecto::EST2_BUE;
   */

  /**
   * Menu central
   */
   //reporte de Vigencia de proyecto
    $vigencia=$proyecto->getVigencia();
    $fecha=$vigencia[0]->fecha_fin;
    $fechafin=  date("d-m-Y", strtotime("$fecha"));
    $date1 =  date('d-m-Y')  ;
    $date2 = $fechafin;

    $diff = abs(strtotime($date2) - strtotime($date1));
    $years = floor($diff / (365*60*60*24));
    $months = floor(($diff - $years * 365*60*60*24) / (30*60*60*24));
    $days = floor(($diff - $years * 365*60*60*24 - $months*30*60*60*24)/ (60*60*24));

   
  leerClase('Menu');
  $menu = new Menu('');
 

  $menus = $menu->getestudianteIndex($proyecto);
  $smarty->assign("menus", $menus);

  $smarty->assign("estudiante", $estudiante);
  $smarty->assign("usuario", $usuario);
  
  $smarty->assign("proyecto", $proyecto);
  $smarty->assign("anio", $years);
  $smarty->assign("mes", $months);
  $smarty->assign("dia", $days);
  
  $smarty->assign("ERROR", $ERROR);
  

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}


$TEMPLATE_TOSHOW = 'estudiante/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>