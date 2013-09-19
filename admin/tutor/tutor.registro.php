<?php
try {
  require('../_start.php');
  global $PAISBOX;
  
  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";

  //Datepicker UI
  $JS[]  = URL_JS . "jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";

  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  $smarty->assign('JS',$JS);


  $smarty->assign("ERROR", '');

  $columnacentro = 'admin/columna.centro.registro-tutor.tpl';
  $smarty->assign('columnacentro',$columnacentro);

  //CREAR UN TUTOR
  leerClase('Tutor');
  leerClase('Usuario');
  leerClase('Estudiante');
  leerClase('Docente');
  leerClase('Proyecto_tutor');
  leerClase('Notificacion');
  leerClase('Notificacion_tutor');
  
  
 //$tutor = new ();
  
 // $smarty->assign("tutor", $tutor);
    $smarty->assign('token','');
    if (isset($_GET['estudiante_id']))
    {
       echo $_GET['estudiante_id'];
       $estudiante = new Estudiante($_GET['estudiante_id']);
       echo   $estudiante->getProyecto()->nombre;
       $proyecto = $estudiante->getProyecto();
      
     
       $smarty->assign("proyecto",$proyecto);
    }
    
   if (isset($_POST['buscar']) && $_POST['buscar'] == 'buscar')
  {
   
    
  $docente= new Docente(false,$_POST['codigo']);
  echo   $docente->usuario_id;
  $usuario= new Usuario($docente->usuario_id);
  $smarty->assign("tutor",  $usuario);
   
  }
  
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {  
    $usuario = new Usuario();
    $usuario->objBuidFromPost();
    $usuario->estado = Objectbase::STATUS_AC;
    $usuario->save();
    
    
    $tutor= new Tutor();
    $tutor->objBuidFromPost();
    $tutor->usuario_id=$usuario->id;
    $tutor->save(); 
    
    $notificacion= new Notificacion();
    $notificacion->proyecto_id=1;
    $notificacion->tipo="normal";
    $notificacion->fecha_envio="";
    $notificacion->asunto="hola mundo";
    $notificacion->detalle="fasdf";
    $notificacion->prioridad=1;
    $notificacion->estado = Objectbase::STATUS_AC;
    
    //$usuarios  = array();
    $tutores= array();
    $tutores[]=1;
     $tutores[]=4;
    $usuarios= array('tutores'=>array(1,4),'estudiantes'=>array(1,4));
     //$usuarios[]=$tutores;
    $notificacion->enviarNotificaion($usuarios);
    
  
    $proyectotutor= new Proyecto_tutor();
    $proyectotutor->objBuidFromPost();
    $proyectotutor->tutor_id=$tutor->id;
    $proyectotutor->estado = Objectbase::STATUS_AC;
   
    $proyectotutor->save();
  }

  
  $token = sha1(URL . time());
  $_SESSION['register'] = $token;
  $smarty->assign('token',$token);
  
  
  

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'admin/3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>