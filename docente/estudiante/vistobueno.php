<?php
try {
  define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
  header("Location: ../login.php");
  leerClase('Visto_bueno');
  leerClase('Docente');
 
  leerClase('Estudiante');
  leerClase('Usuario');
  leerClase('Proyecto');
  leerClase('Notificacion');

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
  
 if (isset($_GET['id_estudiante']))
  {
 
     
  $estudiante     = new Estudiante($_GET['id_estudiante']);
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();
  
  $smarty->assign("estudiante",  $estudiante);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("proyecto", $proyecto);
  
   }
    $vistobueno= new Visto_bueno();
    date_default_timezone_set('UTC');
    $vistobueno->fecha_visto_buena=date("d/m/Y");
    
    if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    
    //  $docen
    $proyecto =    new Proyecto($_POST['proyecto_id']);
    $listavistobueno= $proyecto->getVbTutor();
    $listatutores=$proyecto->getTutores();
   
    $vistobuenotutores= $proyecto->getVbTutorPerfilIds();
    
     $vistobueno                    =       new Visto_bueno();
     $docente                       =       getSessionDocente();
     $vistobueno->objBuidFromPost();
     $vistobueno->proyecto_id       =        $proyecto->id;
     $vistobueno->visto_bueno_tipo  =        Visto_bueno::E1_DOCENTE;
     $vistobueno->visto_bueno_id    =        $docente->id;
     $vistobueno->estado            =        Objectbase::STATUS_AC;
   
     $vistobueno->save();
     
                $notificacions= new Notificacion();
                    $notificacions->objBuidFromPost();
                    $notificacions->proyecto_id = $proyecto->id; 
                    $notificacions->tipo        =  Notificacion::TIPO_MENSAJE;
                    $notificacions->fecha_envio = date("j/n/Y");
                    $notificacions->asunto      =  " Visto bueno del Docente de Proyecto final";
                    $notificacions->prioridad   = 7;
                    $notificacions->estado      = Objectbase::STATUS_AC;

                    $noticaciones = array('estudiantes'=>array($estudiantes->id));
                    $notificacions->enviarNotificaion( $noticaciones);
    
  
    
    $totalvistobuenotutor=true;
    foreach ($listatutores as $value) 
      {
      
      if(!in_array($value->id, $vistobuenotutores))
      {
        $totalvistobuenotutor=FALSE;
        break;;
        
      }
     }
     
     
   //  $vistobuenodocente= $proyecto->getVbDocentePerfil(getSessionDocente()->id);
     
     
     if( $totalvistobuenotutor)
       {
        $proyecto = new Proyecto($vistobueno->proyecto_id);
        $proyecto->estado_proyecto="VB";
        $proyecto->save();
        
                   $notificacions= new Notificacion();
                    $notificacions->objBuidFromPost();
                    $notificacions->proyecto_id = $proyecto->id; 
                    $notificacions->tipo        =  Notificacion::TIPO_MENSAJE;
                    $notificacions->fecha_envio = date("j/n/Y");
                    $notificacions->asunto      = "Estas Habilitado para Para tus Defensas";
                    $notificacions->prioridad   = 7;
                    $notificacions->estado      = Objectbase::STATUS_AC;

                    $noticaciones = array('estudiantes'=>array($estudiantes->id));
                    $notificacions->enviarNotificaion( $noticaciones);
        
        
       }
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
  
$TEMPLATE_TOSHOW = 'docente/vistobueno/full-width.visto.registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>