<?php
try {
    define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','SAPTI - Inscripcion de Estudiantes');
  $smarty->assign('description','Inscripcion de Estudiantes');
  $smarty->assign('keywords','SAPTI,Estudiantes,Inscripcion');

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
    $CSS[]  = URL_JS . "calendar/css/eventCalendar.css";
  $CSS[]  = URL_JS . "calendar/css/eventCalendar_theme.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";

  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";
    $JS[]  = URL_JS . "calendar/js/jquery.eventCalendar.js";
    $smarty->assign('JS',$JS);
  $smarty->assign("ERROR", '');
  leerClase('Docente');
  leerClase('Dicta');
  $docente     = getSessionDocente();
  if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) && $docente->getDictaverifica($_GET['iddicta']))
  {
     $iddicta                = $_GET['iddicta'];
  }  else {
        header("Location: ../index.php");
  }
  $dicta = new Dicta($iddicta);
  
   /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Asignaturas');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.materias.php','name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.proyecto-final.php?iddicta='.$iddicta,'name'=>$dicta->getNombreMateria());
  $menuList[]     = array('url'=>URL.Docente::URL.'estudiante/inscripcion.estudiante-cvs.php?iddicta='.$iddicta,'name'=>'Inscripcion Estudiantes');
  $smarty->assign("menuList", $menuList);
  
    function array_recibe($url_array) { 
     $tmp = stripslashes($url_array); 
     $tmp = urldecode($tmp); 
     $tmp = unserialize($tmp); 

    return $tmp; 
  };
    $yainscritos=$_GET['yainscritos']; 
    $yainscritos=array_recibe($yainscritos); 
    
    $inscritos=$_GET['inscritos']; 
    $inscritos=array_recibe($inscritos); 
    
    $noestudiante=$_GET['noestudiante']; 
    $noestudiante=array_recibe($noestudiante); 
    
    $errorestudiante=$_GET['errorestudiante']; 
    $errorestudiante=array_recibe($errorestudiante);
    
    $borradoestudiante=$_GET['borradoestudiante']; 
    $borradoestudiante=array_recibe($borradoestudiante);
    
    $total=$_GET['total'];
    
    $smarty->assign("yainscritos"  ,$yainscritos);
    $smarty->assign("inscritos"  ,$inscritos);
    $smarty->assign("noestudiante"  ,$noestudiante);
    $smarty->assign("errorestudiante"  ,$errorestudiante);
    $smarty->assign("borradoestudiante"  ,$borradoestudiante);
    $smarty->assign("total"  ,$total);
    
  $columnacentro = 'docente/estudiante/columna.centro.inscripcion.estudiante-cvs-lista.tpl';
  $smarty->assign('columnacentro',$columnacentro);
  //No hay ERROR
  $smarty->assign("ERROR",'');
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
$TEMPLATE_TOSHOW = 'docente/docente.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>