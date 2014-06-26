<?php
try {

  require('_start.php');

  leerClase("Docente");
  leerClase("Formulario");

  /** HEADER */
  $smarty->assign('title','Ingresar');
  $smarty->assign('description','P&aacute;gina de inicio');
  $smarty->assign('keywords','Ingreso,usuario');

  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  $docente = new Docente();
  $smarty->assign('docente',$docente);
  //LOGIN FORM
  if (isset($_POST["login"]) && $_POST["login"] != "" && isset($_POST["clave"]) && $_POST["clave"] != "" && isset($_POST['tarea']) && $_SESSION['logindocente'] == $_POST['token'] )
  {
    $docente = new Docente();
    $formulario = new Formulario('');
    $formulario->validar('login'   ,$_POST["login"]   ,'texto','Login ');
    $formulario->validarPassword('clave',$_POST["clave"], false,TRUE);

    if (!initSession($_POST["login"] ,($_POST["clave"])))
      throw new Exception("?login&m=El usuario y el password no corresponden a un docente registrado.");
    $ir = "Location: index.php";
    header($ir);
  }
  $_SESSION['docente_id']=$docente->id;
  $_SESSION['mensaje']=1;
  //No hay ERROR
  $smarty->assign("ERROR",'');
  $smarty->assign("URL",URL);  
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$_SESSION['logindocente'] = sha1(URL . time());
$smarty->assign('token',$_SESSION['logindocente']);

$smarty->display('docente/login.tpl');
?>