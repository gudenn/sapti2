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

  //JS
  $JS[]  = URL_JS . "jquery.min.js";

  //Datepicker & Tooltips $ Dialogs UI
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  $JS[]   = URL_JS . "jquery-ui-1.10.3.custom.min.js";
  $JS[]   = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";

  //Validation
  $CSS[] = URL_JS . "/validate/validationEngine.jquery.css";
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  $smarty->assign('JS',$JS);
  $smarty->assign('CSS',$CSS);

  
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