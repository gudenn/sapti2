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
    $proyecto      =  new Proyecto($notificacion->proyecto_id);
    $estudiante   =  $proyecto->getEstudiante();
    
     //echo $_GET['notificacion_id'];
    //$notificacion
    $tipo= Notificacion::TIPO_ASIGNACION;
   // echo $tipo;
    $smarty->assign("tiponotificacion",$tipo);
    
     $smarty->assign("notificacion", $notificacion);
     $smarty->assign("proyecto", $proyecto);
     $smarty->assign("estudiante", $estudiante);
  }
  

  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    
    $EXITO = false;
    mysql_query("BEGIN");
    if(isset($_POST['id_notificacion']))
    {
      
      $notificacion = new Notificacion($_POST['id_notificacion']);
     $tribunal=    $notificacion->getNotificacionTribunal(getSessionUser()->id);
     
     $proyecto= new Proyecto($notificacion->proyecto_id);
     
    echo  $tribunal->id;
     
     if($tribunal)
     {
        
       $idtribuanl=$tribunal->id;
      $query = "UPDATE notificacion_tribunal nt SET nt.estado_notificacion='V'  WHERE nt.tribunal_id=$idtribuanl";
       //  mysql_query($query);
         
    if( $_POST['accion']==Tribunal::ACCION_AC)
     {
      
      
      
      // $tribunal = new Tribunal($_POST['ids']);
       $tribunal->visto=  Tribunal::VISTO;
       $tribunal->accion=$_POST['accion'];
       $tribunal->detalle=$_POST['detalle'];
    
       
       
     $notificacions= new Notificacion();
     $notificacions->objBuidFromPost();
     $notificacions->proyecto_id=$proyecto->id; 
     $notificacions->tipo=  Notificacion::TIPO_MENSAJE;
     $notificacions->fecha_envio= date("j/n/Y");
     $notificacions->asunto="Asignacion de Tribunales";
    // $notificacions->detalle=;
     $notificacions->prioridad=5;
     $notificacions->estado = Objectbase::STATUS_AC;

    $noticaciones= array('estudiantes'=>array($proyecto->getEstudiante()->id));
  $notificacions->enviarNotificaion( $noticaciones);
    
    $tribunal->save();
  
     }else
    {
      
          $tribunal->visto=  Tribunal::VISTO;
          $tribunal->accion=$_POST['accion'];
          $tribunal->detalle=$_POST['detalle'];
      // $tribunal->estado= Objectbase::STATUS_DE;
       
        $notificacions= new Notificacion();
        $notificacions->objBuidFromPost();
        $notificacions->proyecto_id=$proyecto->id; 
        $notificacions->tipo=  Notificacion::TIPO_MENSAJE;
        $notificacions->fecha_envio= date("j/n/Y");
        $notificacions->asunto="Asignacion de Tribunales";
        $notificacions->detalle=$_POST['detalle'];
        $notificacions->prioridad=5;
        $notificacions->estado = Objectbase::STATUS_AC;

       $noticaciones= array('estudiantes'=>array($proyecto->getEstudiante()->id));
      $notificacions->enviarNotificaion( $noticaciones);
        
        
       $tribunal->save();
    }
    
       
       
       
       
       
     }else{
       leerClase('Proyecto_tutor');
       
       
     $proyectotutor=  $notificacion->getProyectoTutor(getSessionUser()->id);
       
       
              $idtribuanl=$tribunal->id;
      $query = "UPDATE notificacion_tutor nt SET nt.estado_notificacion='V'  WHERE nt.notificacion_id=$notificacion->id";
       //  mysql_query($query);
         
    if( $_POST['accion']==Tribunal::ACCION_AC)
     {
      
      /**
       *  const ACEPTADO   = "AC";
        const RECHADO    = "RE";
       */
      
      // $tribunal = new Tribunal($_POST['ids']);
      $proyectotutor->estado_tutoria=  Proyecto_tutor::ACEPTADO;
      
       
     $notificacions= new Notificacion();
     $notificacions->objBuidFromPost();
     $notificacions->proyecto_id=$proyecto->id; 
     $notificacions->tipo=  Notificacion::TIPO_MENSAJE;
     $notificacions->fecha_envio= date("j/n/Y");
     $notificacions->asunto="Nombramiento de tutor";
    // $notificacions->detalle=;
     $notificacions->prioridad=5;
     $notificacions->estado = Objectbase::STATUS_AC;

    $noticaciones= array('estudiantes'=>array($proyecto->getEstudiante()->id));
  $notificacions->enviarNotificaion( $noticaciones);
    
    $proyectotutor->save();
  
     }else
    {
       $proyectotutor->estado_tutoria=  Proyecto_tutor::RECHADO;
    
       
        $notificacions= new Notificacion();
        $notificacions->objBuidFromPost();
        $notificacions->proyecto_id=$proyecto->id; 
        $notificacions->tipo=  Notificacion::TIPO_MENSAJE;
        $notificacions->fecha_envio= date("j/n/Y");
        $notificacions->asunto= "Nombramiento de tutor";
        $notificacions->detalle=$_POST['detalle'];
        $notificacions->prioridad=5;
        $notificacions->estado = Objectbase::STATUS_AC;

       $noticaciones= array('estudiantes'=>array($proyecto->getEstudiante()->id));
      $notificacions->enviarNotificaion( $noticaciones);
        
        
       $proyectotutor->save();
    }
       
      
       
  
     }
      
      
      
    }
    
   
    $EXITO = TRUE;
    mysql_query("COMMIT");
  }
  
  $smarty->assign('usuario',$usuario);
  $smarty->assign('tutor',$tutor);

  
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