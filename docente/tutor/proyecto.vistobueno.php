<?php
try {
      define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession() && !isTutorSession() )
  header("Location: ../login.php");
  leerClase('Visto_bueno');
  leerClase('visto_bueno_tutor');
  leerClase('Docente');
 
  leerClase('Estudiante');
  leerClase('Usuario');
  leerClase('Proyecto');
  leerClase('Notificacion');
  leerClase('Tutor');
  leerClase('Proyecto_tutor');
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
  // echo  $usuario->tutor_id;
    //////creando la clase de visto bueno para realizar el visto bueno del proyecto de un estudiante
 
    $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
    $menuList[]     = array('url'=>URL.Docente::URL.'tutor','name'=>'Tutor');
    $menuList[]     = array('url'=>URL.Docente::URL.'tutor/estudiante.lista.php','name'=>'Lista Estudiantes de Proyecto');
     
    $smarty->assign("menuList", $menuList);
    $proyecto->objetivo_general;
  $smarty->assign("usuario", $usuario);
  $smarty->assign("proyecto", $proyecto);
    $smarty->assign("estudiante",  $estudiante );
   
      $vistobueno= new Visto_bueno_tutor();
      date_default_timezone_set('America/La_Paz');
      date_default_timezone_set('UTC');
     $vistobueno->fecha_visto_buena=date("d/m/Y");
      $smarty->assign("vistobueno", $vistobueno);

    if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
     
        $vistobueno                    =       new Visto_bueno_tutor();
        $docente                       =       getSessionDocente();
        $tutoractual                   = getSessionTutor();
   
    $estudiante = new Estudiante($_POST['estudiante_id']); /// crando el estudiante
    $proyectoestudiante = $estudiante->getProyecto();  // obtien e el proyecto del estudioante
    $usuario = getSessionUser();
    $usuario->getAllObjects();
    $tuores = $usuario->tutor_objs;
    $docentestudiante = $estudiante->getDocente(); //  retorna el docente del estudiante
       foreach ($usuario->tutor_objs as $tutor_id)
        {
              $vistobueno->objBuidFromPost();
              $vistobueno->proyecto_id       =       $proyectoestudiante->id;
              $vistobueno->visto_bueno  =        Visto_bueno::STATUS_AC;
              $vistobueno->tutor_id   =        $tutor_id->id;    
              $vistobueno-> tipo_proyecto   =       $proyectoestudiante->tipo_proyecto;    
              $vistobueno->estado            =        Objectbase::STATUS_AC;
              $vistobueno->save();
              
                   $notificacions= new Notificacion();
                    $notificacions->objBuidFromPost();
                    $notificacions->proyecto_id = $proyecto->id; 
                    $notificacions->tipo        =  Notificacion::TIPO_NOTIFICACION;
                    $notificacions->fecha_envio =  date("j/n/Y");
                    $tipo = $proyecto->tipo_proyecto == Proyecto::TIPO_PERFIL ? 'Perfil' : 'Proyecto';
                    $notificacions->asunto = "VoBo $tipo, Tutor";
                    $notificacions->detalle = "Aprobado por: " . getSessionTutor()->getNombreCompleto();
                    $notificacions->prioridad   =  7;
                    $notificacions->estado      =   Objectbase::STATUS_AC;
                    $noticaciones = array('estudiantes'=>array($estudiante->id));
                    $notificacions->enviarNotificaion( $noticaciones);
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
  
$TEMPLATE_TOSHOW = 'docente/tutor/full-width.visto.registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>