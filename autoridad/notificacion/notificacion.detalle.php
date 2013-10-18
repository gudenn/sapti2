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

  
  //Sexo del usuario
  $smarty->assign('sexo', array(
      Usuario::FEMENINO  => 'Femenino',
      Usuario::MASCULINO => 'Masculino'));
  $smarty->assign('sexo_selected', ($usuario->sexo==Usuario::FEMENINO)?Usuario::FEMENINO:Usuario::MASCULINO);

  if (isset($_GET['estudiante_id']) && is_numeric($_GET['estudiante_id']))
  {
     $estudiante = new Estudiante($_GET['estudiante_id']);
     $smarty->assign("estudiante",$estudiante);
  }
  //Asignar titulo al usuario
  leerClase('Titulo_honorifico');
  $titulo_h     = new Titulo_honorifico();
  $titulo_hs    = $titulo_h->getAll();
  $titulo_h_values[] = '';
  $titulo_h_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($titulo_hs[0])) 
  {
    $titulo_h_values[] = $row['nombre'];
    $titulo_h_output[] = $row['nombre'];
  }
  $smarty->assign("titulo_h_values", $titulo_h_values);
  $smarty->assign("titulo_h_output", $titulo_h_output);

  //tutor
  $id = '';
  if (isset($_GET['tutor_id']) && is_numeric($_GET['tutor_id']) )
    $id = $_GET['tutor_id'];
  $tutor   = new Tutor($id);
  $usuario = new Usuario($tutor->usuario_id);

  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    
    $EXITO = false;
    mysql_query("BEGIN");
    
    // OPCIONES

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