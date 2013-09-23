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
  

  //JS
  $JS[]  = URL_JS . "jquery.min.js";

  //Datepicker UI
  $JS[]  = URL_JS . "jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";

  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  //BOX
  $JS[]  = URL_JS ."box/jquery.box.js";
  $CSS[]  = URL_JS . "box/box.css";

  $smarty->assign('JS',$JS);
  $smarty->assign('CSS',$CSS);



  $smarty->assign("ERROR", '');

  $smarty->assign('columnacentro','admin/tutor/columna.centro.registro.tpl');

  //CREAR UN TUTOR
  leerClase('Tutor');
  leerClase('Usuario');
  leerClase('Estudiante');
  
  if (isset($_GET['estudiante_id']) && is_numeric($_GET['estudiante_id']))
  {
     $estudiante = new Estudiante($_GET['estudiante_id']);
     $smarty->assign("estudiante",$estudiante);
  }

  
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    
    $EXITO = false;
    mysql_query("BEGIN");
    

    
    $usuario = new Usuario();
    $usuario->objBuidFromPost();
    $usuario->puede_ser_tutor = Usuario::PROFECIONAL;
    $usuario->estado = Objectbase::STATUS_AC;
    $usuario->save();
    
    
    $tutor= new Tutor();
    $tutor->objBuidFromPost();
    $tutor->usuario_id = $usuario->id;
    $tutor->save();
    
    if (isset($_POST['estudiante_id']) && is_numeric($_POST['estudiante_id']) )
    {
      // Primero quitamos al tutor anterior
      if ( isset($_GET['cambiartutor_id']) && is_numeric($_GET['cambiartutor_id']) )
      {
        $tutoantiguo = new Tutor($_GET['cambiartutor_id']);
        $tutoantiguo->finalizarTutoria($estudiante->id);
      }
      $tutor->asignarTutoria ($_POST['estudiante_id']);
      
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