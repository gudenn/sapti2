<?php
try {
    define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Evaluaciones');
  $smarty->assign('description','Gesti&oacute;n de Evaluaciones');
  $smarty->assign('keywords','Gestion,Evaluacion,Estudiantes,Inscritos');

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
  $menuList[]     = array('url'=>URL.Docente::URL.'evaluacion/estudiante.evaluacion-editar.php?iddicta='.$iddicta,'name'=>'Evaluacion de Estudiantes');
  $menuList[]     = array('url'=>URL.Docente::URL.'evaluacion/estudiante.evaluacion-editar.php?iddicta='.$iddicta,'name'=>'Evaluacion de Estudiantes');
  $smarty->assign("menuList", $menuList);

    function array_recibe($url_array) { 
     $tmp = stripslashes($url_array); 
     $tmp = urldecode($tmp); 
     $tmp = unserialize($tmp); 

    return $tmp; 
  };

    $inscritos=$_GET['inscritos']; 
    $inscritos=array_recibe($inscritos); 
    
    $noestudiante=$_GET['noestudiante']; 
    $noestudiante=array_recibe($noestudiante); 
    
    $smarty->assign("inscritos"  ,$inscritos);
    $smarty->assign("noestudiante"  ,$noestudiante);
    
  $columnacentro = 'docente/evaluacion/columna.centro.evaluacion.estudiante-cvs-lista.tpl';
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