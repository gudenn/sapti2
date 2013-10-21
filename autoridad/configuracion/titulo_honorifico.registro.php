<?php
try {
  define ("MODULO", "ADMIN-CONFIGURACION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  


  /** HEADER */
  $smarty->assign('title','SAPTI - Registro de T&iacute;tulo honor&iacute;fico');
  $smarty->assign('description','Formulario de registro de T&iacute;tulos honor&iacute;ficos');
  $smarty->assign('keywords','SAPTI,T&iacute;tulos honor&iacute;ficos,Registro');

  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Registro de T&iacute;tulos honor&iacute;ficos');
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
  $CSS[]  = URL_JS . "box/box.css";
  $JS[]  = URL_JS ."box/jquery.box.js";
  //Datepicker & Tooltips $ Dialogs UI
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  $JS[]   = URL_JS . "jquery-ui-1.10.3.custom.min.js";
  $JS[]   = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);


  $smarty->assign("ERROR", '');


  leerClase('Titulo_honorifico');
  
  $smarty->assign('columnacentro','admin/titulo_honorifico/registro.tpl');
  $id = '';
  if (isset($_GET['titulo_honorifico_id']) && is_numeric($_GET['titulo_honorifico_id']))
    $id = $_GET['titulo_honorifico_id'];
  $titulo = new Titulo_honorifico($id);
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    $EXITO = false;
    mysql_query("BEGIN");
    $titulo->objBuidFromPost();
    $titulo->estado = Objectbase::STATUS_AC;
    $titulo->validar();
    $titulo->save();
    $EXITO = TRUE;
    mysql_query("COMMIT");
  }
  $smarty->assign("titulo",$titulo);

  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje'=>'Se grabo correctamente el T&iacute;tulo honor&iacute;fico','titulo'=>'Registro de T&iacute;tulo honor&iacute;fico' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Hubo un problema, No se Registro de T&iacute;tulos honor&iacute;ficos','titulo'=>'Registro T&iacute;tulo honor&iacute;fico' ,'icono'=> 'warning_48.png');
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