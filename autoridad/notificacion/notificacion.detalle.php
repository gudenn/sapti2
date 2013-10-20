<?php
try {
  if (!defined('MODULO'))
  {
    define ("MODULO", "NOTIFICACION");
    require('../_start.php');
  }
  if(!isUserSession())
    header("Location: ../login.php");  
  
  /** HEADER */
  $smarty->assign('title','Detalle de Mis Notificaciones');
  $smarty->assign('description','Detalle de Mis Notificaciones');
  $smarty->assign('keywords','Gesti&oacute;n,Notificaciones');
  /**
   * Menu superior
   * hay que declarar esta variable en cada pagina para que esto funcione bien
   */
  if (!isset($menuList))
  {
    $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
    $menuList[]     = array('url'=>URL . Administrador::URL . 'notificacion/','name'=>'Notificaciones');
    $menuList[]     = array('url'=>URL . Administrador::URL . 'notificacion/notificacion.gestion.php','name'=>'Archivo de Notificaiones');
    $menuList[]     = array('url'=>URL . Administrador::URL . 'notificacion/notificacion.detalle.php','name'=>'Detalle de Notificaciones');
  }
  $smarty->assign("menuList", $menuList);

  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');



  $smarty->assign("ERROR", '');

  $smarty->assign('columnacentro','notificacion/detalle.tpl');

  //CREAR UN TUTOR
  leerClase('Tutor');
  leerClase('Usuario');
  leerClase('Estudiante');
  leerClase('Notificacion');
  leerClase('Estudiante');
  leerClase('Proyecto');
  leerClase('Tribunal');
  

  //Sexo del usuario
      $smarty->assign('sexo', array(
      Usuario::FEMENINO  => 'Femenino',
      Usuario::MASCULINO => 'Masculino'));
     $smarty->assign('sexo_selected', ($usuario->sexo==Usuario::FEMENINO)?Usuario::FEMENINO:Usuario::MASCULINO);

  if (isset($_GET['notificacion_id']) && is_numeric($_GET['notificacion_id']))
  {
    
     $smarty->assign('accion', array(
        Tribunal::ACCION_AC =>  Tribunal::ACCION_AC,
        Tribunal::ACCION_RE =>  Tribunal::ACCION_RE
     ));
    
    $notificacion  = new Notificacion($_GET['notificacion_id']);
    $notificacion->marcarVisto();
    $proyecto      =  new Proyecto($notificacion->proyecto_id);
    $estudiante    =  $proyecto->getEstudiante();
    
    //echo $_GET['notificacion_id'];
    //$notificacion
    $tipo = Notificacion::TIPO_ASIGNACION;
    // echo $tipo;
    $smarty->assign("proyecto", $proyecto);
    $smarty->assign("estudiante", $estudiante);
    $smarty->assign("notificacion", $notificacion);
    $smarty->assign("tiponotificacion",$tipo);
  }
  

  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token']){
    
    $EXITO = false;
    mysql_query("BEGIN");
    if(isset($_POST['id_notificacion'])){
      
      $notificacion = new Notificacion($_POST['id_notificacion']);
      $notificacion->getAllObjects();
      $tribunal     = $notificacion->getNotificacionTribunal(getSessionUser()->id);
      $proyecto     = new Proyecto($notificacion->proyecto_id);
     
      //Solo para tribunales
      if($tribunal){

        $tribunal->visto   = Tribunal::VISTO;
        $tribunal->accion  = ( $_POST['accion']==Tribunal::ACCION_AC)?Tribunal::ACCION_AC:Tribunal::ACCION_RE;
        $tribunal->detalle = $_POST['detalle'];
        $tribunal->save();

        //Enviar notificacion
        $notificacions = new Notificacion();
        $notificacions->objBuidFromPost();
        $notificacions->proyecto_id = $proyecto->id; 
        $notificacions->fecha_envio = date("j/n/Y");
        $notificacions->prioridad   = 7;
        $notificacions->asunto      = "Asignacion de Tribunales";
        $notificacions->tipo        = Notificacion::TIPO_MENSAJE;
        $notificacions->estado      = Objectbase::STATUS_AC;

        $noticaciones= array('estudiantes'=>array($proyecto->getEstudiante()->id));
        $notificacions->enviarNotificaion( $noticaciones);

       
      }else{ // notificaiones para asignar tutor
       
        leerClase('Proyecto_tutor');
        $id = '';
        if (isset($notificacion->notificacion_tutor_objs[0]))
          $id = $notificacion->notificacion_tutor_objs[0]->proyecto_tutor_id;
        // Aceptamos o rechasamos la tutoria
        $proyectotutor = new Proyecto_tutor($id);
        $proyectotutor->estado_tutoria = ( $_POST['accion'] == Tribunal::ACCION_AC )?Proyecto_tutor::ACEPTADO:Proyecto_tutor::RECHADO;
        $proyectotutor->fecha_acepta   = date("j/n/Y");
        $proyectotutor->save();

        
        //Enviamos un mensaje
        $notificacions= new Notificacion();
        $notificacions->objBuidFromPost();
        $notificacions->proyecto_id = $proyecto->id; 
        $notificacions->tipo        =  Notificacion::TIPO_MENSAJE;
        $notificacions->fecha_envio = date("j/n/Y");
        $notificacions->asunto      = "Nombramiento de tutor";
        $notificacions->prioridad   = 7;
        $notificacions->estado      = Objectbase::STATUS_AC;

        $noticaciones = array('estudiantes'=>array($proyecto->getEstudiante()->id));
        $notificacions->enviarNotificaion( $noticaciones);


      }
    }
    $EXITO = TRUE;
    mysql_query("COMMIT");
  }


  
  $token = sha1(URL . time());
  $_SESSION['register'] = $token;
  $smarty->assign('token',$token);
  
  
  

  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje'=>'Se asigno correctamente el Tutor','titulo'=>'Registro de Tutor' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente el Tutor','titulo'=>'Registro de Tutor' ,'icono'=> 'warning_48.png');
   $ERROR = $html->getMessageBox ($mensaje);
  }
  $smarty->assign("ERROR",$ERROR);
  
} 
catch(Exception $e) 
{
  mysql_query("ROLLBACK");
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'admin/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>