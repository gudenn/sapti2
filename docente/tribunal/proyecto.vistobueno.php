<?php
try {
     define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
  header("Location: ../login.php");
  
  leerClase('Docente');
  leerClase('Estudiante');
  leerClase('Usuario');
  leerClase('Proyecto');
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
    $smarty->assign("fecha_visto_bueno", date("j/n/Y"));

     // date_default_timezone_set('UTC');
    // $vistobueno->fecha_visto_buena=date("d/m/Y");
    //  $smarty->assign("vistobueno", $vistobueno);
  
    if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
           $docente                       =       getSessionDocente(); 
           $proyecto                      =       new Proyecto($_POST['proyecto_id']);
           $tribunal                      =    $proyecto->getTribunal($docente->id);
           $tribunal->visto_bueno         =  Tribunal::VISTO_BUENO;
           $tribunal->fecha_vistobueno    =    date("d/m/Y");
           $tribunal->save();
           
             $notificacions= new Notificacion();
                    $notificacions->objBuidFromPost();
                    $notificacions->proyecto_id = $proyecto->id; 
                    $notificacions->tipo        =  Notificacion::TIPO_NOTIFICACION;
                    $notificacions->fecha_envio =  date("j/n/Y");
                    $tipo = $proyecto->tipo_proyecto == Proyecto::TIPO_PERFIL ? 'Perfil' : 'Proyecto';
                    $notificacions->asunto = "VoBo $tipo, Tutor";
                    $notificacions->detalle = "Aprobado por: " . getSessionUser()->getNombreCompleto();
                    $notificacions->prioridad   =  7;
                    $notificacions->estado      =   Objectbase::STATUS_AC;
                    $noticaciones = array('estudiantes'=>array($estudiante->id));
                    $notificacions->enviarNotificaion( $noticaciones);
           
           
           $bandera=true;
           
           if(sizeof($proyecto->getTribunalVisto())>0)
           {
             
             foreach ($proyecto->getTribunalVisto()  as $valor)
             {
              if($valor->visto_bueno==Tribunal::VISTO_BUENOPENDIENTE)
               {
                   $bandera=false;
                 break;
               }
             }
           }
           
           if($bandera)
           {
         
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