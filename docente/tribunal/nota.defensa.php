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
  leerClase('Usuario');
  leerClase('Nota');
  leerClase('Nota_tribunal');
  leerClase('Tribunal');

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
 $menuList[]     = array('url'=>URL.Docente::URL.'tribunal/publica.estudiante.lista.php','name'=>'Lista Estudiante');
 $smarty->assign("menuList", $menuList);
  
  if (isset($_POST['observaciones'])) 
  $observaciones=$_POST['observaciones'];
    if (isset($_GET['id_estudiante'])) 
  $id_estudiante=$_GET['id_estudiante'];
    
  $estudiante     = new Estudiante($id_estudiante);
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();
  //echo  $proyecto->nombre;
  //echo  "Hola elis";
    //////creando la clase de visto bueno para realizar el visto bueno del proyecto de un estudiante
 
  
  $smarty->assign("usuario", $usuario);
   $smarty->assign("estudiante", $estudiante);
  $smarty->assign("proyecto", $proyecto);
    
    $urlpdf=".../ARCHIVO/proyecto.pdf";
    $smarty->assign("urlpdf", $urlpdf);
      $vistobueno= new Visto_bueno();
    date_default_timezone_set('UTC');
    $vistobueno->fecha_visto_buena=date("d/m/Y");

    if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
     
      
      $docente=  getSessionDocente();
      $docenteid=$docente->id;
      //echo  $docenteid;
      //echo $_POST['estudiante_id'];
     // echo  $_POST['nota_tribunal'];
      
      $estudiantes= new Estudiante($_POST['estudiante_id']);
      
      $proyecto= $estudiantes ->getProyecto();
    $tribunal=  $proyecto->getTribunal($docenteid, $proyecto->id);
      
       $notatribunal= new Nota_tribunal();
       $notatribunal->objBuidFromPost();
       $notatribunal->tribunal_id=$docenteid;
      // $notatribunal->nota_tribunal=
       $notatribunal->proyecto_id=$proyecto->id;
       $notatribunal->estado=  Objectbase::STATUS_AC;
       $notatribunal->save();
       
       
       if(($proyecto->getCantidadNotas())==3)
       {
         
         $proyecto->estado_proyecto=  Proyecto::EST5_F;
         $proyecto->save();
         
       }
       
       
    
     // echo $tribunal->id;
      
      
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
  
$TEMPLATE_TOSHOW = 'docente/tribunal/nota.defensa.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>