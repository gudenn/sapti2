<?php
try {
       define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession() && !isTutorSession() )
    header("Location:../ login.php");
  leerClase('Docente');
  leerClase('Revision');
  leerClase('Observacion');
  leerClase('Estudiante');
  leerClase('Usuario');
   leerClase('Tutor');

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
    $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
    $menuList[]     = array('url'=>URL.Docente::URL.'tutor','name'=>'Tutor');
  echo  $proyecto ->tipo_proyecto;
    if( $proyecto ->tipo_proyecto == Proyecto::TIPO_PERFIL)
    {
    $menuList[]     = array('url'=>URL.Docente::URL.'tutor/perfil.estudiante.lista.php','name'=>'Lista Estudiantes Perfil');
    }else
    {
       $menuList[]     = array('url'=>URL.Docente::URL.'tutor/seguimiento.lista.php','name'=>'Lista Estudiantes Proyecto');
  
    }
      $smarty->assign("menuList", $menuList);

  $observacion = new Observacion();
  $revision = new Revision();

  $smarty->assign("revision", $revision);
  $smarty->assign("observacion", $observacion);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("proyecto", $proyecto);
    
    $urlpdf=".../ARCHIVO/proyecto.pdf";
    $smarty->assign("urlpdf", $urlpdf);
    
    date_default_timezone_set('UTC');
    $revision->fecha_revision=date("d/m/Y");

    if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
        $usuarioss= getSessionUser();
        $tutor=  $usuarioss->getTutor();
     
    $revision->objBuidFromPost();
    $revision->estado = Objectbase::STATUS_AC;
    $revision->revisor=$tutor->id;
    $revision->revisor_tipo='TU';
    $revision->estado_revision=Revision::E1_CREADO;
    $revision->proyecto_id=$proyecto->id;
    $revision->save();
    foreach ($observaciones as $obser_array){
    $observacion->objBuidFromPost();
    $observacion->estado = Objectbase::STATUS_AC;
    $observacion->observacion=$obser_array;
    $observacion->revision_id = $revision->id;
     $observacion->estado_observacion = Observacion::E1_CREADO;
    $observacion->save();
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
  
$TEMPLATE_TOSHOW = 'docente/tutor/full-width.observacion.registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>