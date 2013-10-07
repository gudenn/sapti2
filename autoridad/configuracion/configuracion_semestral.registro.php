<?php
try {
  define ("MODULO", "ADMIN-CONFIGURACION-CONFIGURACIONSEMESTRAL-REGISTRO");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','SAPTI - Configuracion Semestral');
  $smarty->assign('description','Formulario de registro de Configuracion');
  $smarty->assign('keywords','SAPTI,Area,Registro');

  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/configuracion_semestral.gestion.php','name'=>'Configurai&oacute;n Semestral');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Registro Variable');
  $smarty->assign("menuList", $menuList);


  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "validate/validationEngine.jquery.css";
  

  //JS
  $JS[]  = URL_JS . "jquery.min.js";


  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  //BOX
  $JS[]  = URL_JS ."box/jquery.box.js";
  $CSS[]  = URL_JS . "box/box.css";

  $smarty->assign('JS',$JS);
  $smarty->assign('CSS',$CSS);


  $smarty->assign("ERROR", '');


  leerClase('Semestre');
  leerClase('Configuracion_semestral');
  $semestre_id = false;
  if (isset($_SESSION['semestre_id']) && is_numeric($_SESSION['semestre_id']))
    $semestre_id = $_SESSION['semestre_id'];
  if (isset($_GET['semestre_id']) && is_numeric($_GET['semestre_id']))
  {
    $_SESSION['semestre_id'] = $_GET['semestre_id'];
    $semestre_id             = $_GET['semestre_id'];
  }
  $semestre = new Semestre($semestre_id);
  if (!$semestre_id)
    $semestre->getActivo ();
  $smarty->assign("semestre"  ,$semestre);
  
  $smarty->assign('columnacentro','admin/configuracion_semestral/columna.centro.registro.tpl');
  $id = '';
  if (isset($_GET['configuracion_semestral_id']) && is_numeric($_GET['configuracion_semestral_id']))
    $id = $_GET['configuracion_semestral_id'];
  $configuracion_semestral = new Configuracion_semestral($id);
  
  
  $smarty->assign("configuracion_semestral",$configuracion_semestral);
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    $EXITO = false;
    mysql_query("BEGIN");
    $configuracion_semestral->objBuidFromPost();
    $configuracion_semestral->estado = Objectbase::STATUS_AC;
    $configuracion_semestral->validar();
    $configuracion_semestral->save();
    $EXITO = TRUE;
    mysql_query("COMMIT");
  }
  $smarty->assign("configuracion_semestral",$configuracion_semestral);

  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje'=>'Se grabo correctamente el Valor','titulo'=>'Registro de Configuraci&oacute;n' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente el Valor','titulo'=>'Registro de Configuraci&oacute;' ,'icono'=> 'warning_48.png');
   $ERROR = $html->getMessageBox ($mensaje);
  }
  $smarty->assign("ERROR",$ERROR);
  
} 
catch(Exception $e) 
{
  mysql_query("ROLLBACK");
  $smarty->assign("ERROR", handleError($e));
}

$token                = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token',$token);

$TEMPLATE_TOSHOW = 'admin/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>