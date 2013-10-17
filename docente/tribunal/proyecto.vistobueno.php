<?php
try {
     define ("MODULO", "DOCENTE");
  require('_start.php');
  if(!isDocenteSession())
  header("Location: ../login.php");
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

   $menuList[]     = array('url'=>URL.Docente::URL.'tribunal','name'=>'Tribunal');
 $menuList[]     = array('url'=>URL.Docente::URL.'tribunal/visto.estudiante.lista.php','name'=>'Lista Estudiante');
 $smarty->assign("menuList", $menuList);
  
  
    
  if (isset($_POST['observaciones'])) 
  $observaciones=$_POST['observaciones'];
    if (isset($_GET['id_estudiante'])) 
  $id_estudiante=$_GET['id_estudiante'];
    
  $estudiante     = new Estudiante($id_estudiante);
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();
   
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
    $vistobueno->proyecto_id       =        $_POST['proyecto_id'];
    $vistobueno->visto_bueno_tipo  =        Visto_bueno::E3_TRIBUNAL;
    $vistobueno->fecha_visto_bueno =        date("d/m/Y");
    $vistobueno->visto_bueno_id    =        $docente->id;;
    $vistobueno->estado            =        Objectbase::STATUS_AC;
   
    $vistobueno->save();
     $proyectos=     new Proyecto(  $_POST['proyecto_id']);
     echo $proyectos->nombre;
      if((sizeof($proyectos->getVbTribunal()))==3)
      {
    //$proyecto = new Proyecto($vistobueno->proyecto_id);
     $proyecto->estado_proyecto="TV";
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
  
$TEMPLATE_TOSHOW = 'docente/tribunal/full-width.visto.registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>