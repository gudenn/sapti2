<?php
try {
  require('_start.php');


  leerClase('Grupo');
  leerClase("Estudiante");
  leerClase("Formulario");

  /** HEADER */
  $smarty->assign('title','Ingresar');
  $smarty->assign('description','Pagina de inicio');
  $smarty->assign('keywords','Ingreso,usuario');


  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');


  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  $estudiante = new Estudiante();
  $smarty->assign('estudiante',$estudiante);
  //LOGIN FORM
  if (isset($_POST["login"]) && $_POST["login"] != "" && isset($_POST["clave"]) && $_POST["clave"] != "" && isset($_POST['tarea']) && $_SESSION['loginestudiante'] == $_POST['token'] )
  {
    $estudiante = new Estudiante();
    $formulario = new Formulario('');
    $formulario->validar('login'   ,$_POST["login"]   ,'texto','El nombre de usuario ');
    $formulario->validarPassword('clave',$_POST["clave"], false,TRUE);

    if (!initSession($_POST["login"] ,($_POST["clave"])))
      throw new Exception("?login&m=El usuario y el password no corresponden a un estudiante registrado.");
    $ir = "Location: index.php";
    header($ir);
  }
  //No hay ERROR
  $smarty->assign("ERROR",'');
  $smarty->assign("URL",URL);  
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$_SESSION['loginestudiante'] = sha1(URL . time());
$smarty->assign('token',$_SESSION['loginestudiante']);

$smarty->display('estudiante/login.tpl');
?>