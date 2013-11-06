<?php
try {
  define ("MODULO", "DOCENTE");
  require('_start.php');
  if(!isDocenteSession())
    header("Location: login.php");  

  /** HEADER */
  $smarty->assign('title','Materias Asignadas');
  $smarty->assign('description','Men&uacute; de Materias Asignadas');
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
   $CSS[]  = URL_JS . "box/box.css";
  $JS[]  = URL_JS ."box/jquery.box.js";
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);

  //CREAR UN DOCENTE
   leerClase('Usuario');
   leerClase('Docente');
   leerClase('Semestre');
   leerClase('Notificacion');

      /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $smarty->assign("menuList", $menuList);

    /**
   * Menu central
   */
  $docente = getSessionDocente(); 
  leerClase('Menu');
  $menu = new Menu('');
  $menus = $menu->getDocenteIndex($docente);
  $smarty->assign("menus", $menus);
  $smarty->assign("docente", $docente);
  $smarty->assign("ERROR", $ERROR);
  
  $ERROR = ''; 
if(isset($_SESSION['estado']) && $_SESSION['estado']==1)
{
  
  
  leerClase('Html');
  $html  = new Html();
 
 
    $html = new Html();
      
      $mensaje = array('mensaje'=>'Se grabo correctamente ','titulo'=>'Visto Bueno' ,'icono'=> 'tick_48.png');
  
      $ERROR = $html->getMessageBox ($mensaje);
   
   $_SESSION['estado']=0;
$smarty->assign("ERROR",$ERROR);
     
}
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'docente/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>