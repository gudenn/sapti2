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
  $smarty->assign('title','Calendario de Eventos');
  $smarty->assign('description','Calendario de Eventos del Sistema');
  $smarty->assign('keywords','SAPTI,Eventos,Sistema,Gestion');

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
  $docente     = getSessionDocente();
  if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) && $docente->getDictaverifica($_GET['iddicta']))
  {
     $iddicta                = $_GET['iddicta'];
  }  else {
        header("Location: ../index.php");
  }
  $dicta=new Dicta($iddicta);
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.proyecto-final.php?iddicta='.$iddicta,'name'=>$dicta->getNombreMateria());
  $menuList[]     = array('url'=>URL.Docente::URL.'calendario/calendario.evento.php?iddicta='.$iddicta,'name'=>'Calendario de Eventos');
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