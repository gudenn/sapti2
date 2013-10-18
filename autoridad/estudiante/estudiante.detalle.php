<?php
try {
  define ("MODULO", "ADMIN-ESTUDIANTE");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','SAPTI - Registro Estudiantes');
  $smarty->assign('description','Formulario de registro de estudiantes');
  $smarty->assign('keywords','SAPTI,Estudiantes,Registro');


  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');


  $smarty->assign("ERROR", '');


  //CREAR UN ESTUDIANTE
  leerClase('Usuario');
  leerClase('Estudiante');

  $_SESSION['estudiante_id'] = (isset($_SESSION['estudiante_id']))?$_SESSION['estudiante_id']:'';
  if ( isset($_GET['estudiante_id']) && is_numeric($_GET['estudiante_id']) )
    $_SESSION['estudiante_id'] = $_GET['estudiante_id'];

  $estudiante = new Estudiante($_SESSION['estudiante_id']);
  $usuario    = new Usuario($estudiante->usuario_id);

  $smarty->assign("usuario"   , $usuario);
  $smarty->assign("estudiante", $estudiante);
  
  $columnacentro = 'admin/estudiante/columna.centro.estudiante-detalle.tpl';
  $smarty->assign('columnacentro',$columnacentro);

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$token                = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token',$token);

$TEMPLATE_TOSHOW = 'admin/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>