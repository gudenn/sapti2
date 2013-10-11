<?php
try {
   define ("MODULO", "DOCENTE-TUTOR");
  require('_start.php');
  if(!isDocenteSession())
  header("Location: login.php");
  leerClase('Visto_bueno');
  leerClase('Docente');
 
  leerClase('Estudiante');
  leerClase('Usuario');
  leerClase('Proyecto');

  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";

  //Datepicker UI
  $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";

  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";
  $JS[]  = URL_JS . "jquery.addfield.js";
  $smarty->assign('JS',$JS);
  
 
  if (isset($_POST['observaciones'])) 
  $observaciones=$_POST['observaciones'];
    if (isset($_GET['id_estudiante'])) 
  $id_estudiante=$_GET['id_estudiante'];
    
  $estudiante     = new Estudiante($id_estudiante);
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();
  echo  $usuario->tutor_id;
    //////creando la clase de visto bueno para realizar el visto bueno del proyecto de un estudiante
 
  
  $smarty->assign("usuario", $usuario);
  $smarty->assign("proyecto", $proyecto);
    
    $urlpdf=".../ARCHIVO/proyecto.pdf";
    $smarty->assign("urlpdf", $urlpdf);
      $vistobueno= new Visto_bueno();
    date_default_timezone_set('UTC');
    $vistobueno->fecha_visto_buena=date("d/m/Y");

    if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
      
      
      
      
    $vistobueno                    =       new Visto_bueno();
    $docente                       =       getSessionDocente();
    $vistobueno->objBuidFromPost();
   // $vistobueno->proyecto_id       =       $_POST['pro'];
    $vistobueno->visto_bueno_tipo  =        Visto_bueno::E2_TUTOR;
    $vistobueno->visto_bueno_id    =        4;
    $vistobueno->estado            =        Objectbase::STATUS_AC;
   
    $vistobueno->save();
    
    $proyecto = new Proyecto($vistobueno->proyecto_id);
    $proyecto->estado_proyecto="VB";
    $proyecto->save();

    $total= 0;
    $totalVistosbuenos=0;
    ////////////////////////////////////////////////// probar con mas de tutores        //////////
    
    $total= 1+ sizeof($proyecto->getTutores());
    
    $totalVistosbuenos=sizeof($proyecto->getVbDocente())+($proyecto->getVbTutor());
    
  //  echo $proyecto->get
    
    
    if( $total==$totalVistosbuenos)
    {
      $proyecto->estado_proyecto= Proyecto::EST2_BUE;
      $proyecto->save();
    }
    
    
    
    $ir = "Location: estudiante.lista.php";
    header($ir);
        
        
        
    }

  //No hay ERROR
  $smarty->assign("ERROR",'');
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $token = sha1(URL . time());
  $_SESSION['register'] = $token;
  $smarty->assign('token',$token);
  
$TEMPLATE_TOSHOW = 'docente/tutor/perfil.visto.registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>