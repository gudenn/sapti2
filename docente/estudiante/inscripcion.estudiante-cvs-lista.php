<?php
try {
  require('_start.php');
  if(!isDocenteSession())
    header("Location: login.php");  

  /** HEADER */
  $smarty->assign('title','SAPTI - Inscripcion de Estudiantes');
  $smarty->assign('description','Formulario de Inscripcion de Estudiantes');
  $smarty->assign('keywords','SAPTI,Estudiantes,Inscripcion');

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";

  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";
  $smarty->assign('JS',$JS);
  $smarty->assign("ERROR", '');
 
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
    
    $smarty->assign("yainscritos"  ,$yainscritos);
    $smarty->assign("inscritos"  ,$inscritos);
    $smarty->assign("noestudiante"  ,$noestudiante);
    
  $columnacentro = 'docente/columna.centro.inscripcion.estudiante-cvs-lista.tpl';
  $smarty->assign('columnacentro',$columnacentro);
  //No hay ERROR
  $smarty->assign("ERROR",'');
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
$TEMPLATE_TOSHOW = 'docente/estudiante/docente.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>