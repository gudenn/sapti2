<?php
try {
  require('_start.php');
  global $PAISBOX;

  leerClase("Consejo");
  leerClase("Formulario");

  /** HEADER */
  $smarty->assign('title','Ingresar');
  $smarty->assign('description','Pagina de inicio');
  $smarty->assign('keywords','Ingreso,usuario');

  //CSS
  $CSS[]  = "../js/validate/validationEngine.jquery.css";
  $CSS[]  = "../js/ui/base/jquery.ui.all.css";

  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = "../js/jquery.js";
  $JS[]  = "../js/validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = "../js/validate/jquery.validationEngine.js";
  
  $smarty->assign('JS',$JS);

  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  $consejo = new Consejo();
  $smarty->assign('consejo',$consejo);
  //LOGIN FORM
  if (isset($_POST["login"]) && $_POST["login"] != "" && isset($_POST["clave"]) && $_POST["clave"] != "" && isset($_POST['tarea']) && $_SESSION['logindocente'] == $_POST['token'] )
  {
  
    $consejo = new Consejo();
    $formulario = new Formulario('');
   // $formulario->validar('login'   ,$_POST["login"]   ,'texto','Login ');
   // $formulario->validarPassword('clave',$_POST["clave"], false,TRUE);
    

    if (!initConsejoSession($_POST["login"] ,($_POST["clave"])))
      throw new Exception("?login&m=El usuario y el password no corresponden a un Consejero registrado.");
    $ir = "Location: index.php";
    header($ir);
  }
  $_SESSION['consejo_id']=$consejo->id;
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

$smarty->display('tribunal/login.tpl');
?>