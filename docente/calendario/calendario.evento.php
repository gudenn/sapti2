<?php
try {
  define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php");
  
  leerClase('Docente');
  leerClase('Dicta');
  $ERROR = '';
  
  /** HEADER */
  $smarty->assign('title','SAPTI - Inscripcion de Estudiantes');
  $smarty->assign('description','Formulario de Inscripcion de Estudiantes');
  $smarty->assign('keywords','SAPTI,Estudiantes,Inscripcion');

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  $CSS[]  = URL_JS . "calendar/css/eventCalendar.css";
  $CSS[]  = URL_JS . "calendar/css/eventCalendar_theme.css";

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "calendar/js/jquery.eventCalendar.js";

  $smarty->assign('JS',$JS);
  $smarty->assign('CSS',$CSS);
  $smarty->assign("ERROR", $ERROR);
    if ( isset($_SESSION['iddictapro']) && is_numeric($_SESSION['iddictapro']) )
  {
     $iddicta = $_SESSION['iddictapro'];
  }  else {
        $ir = URL.Docente::URL;
        header($ir);
  }
  $dicta=new Dicta($iddicta);
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.proyecto-final.php','name'=>$dicta->getNombreMateria());
  $menuList[]     = array('url'=>URL.Docente::URL.'calendario/'.basename(__FILE__),'name'=>'Calendario de Eventos');
  $smarty->assign("menuList", $menuList);
  
  $columnacentro = 'docente/calendario/columna.centro.calendario.eventos.tpl';
  $smarty->assign('columnacentro',$columnacentro);
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'docente/docente.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>