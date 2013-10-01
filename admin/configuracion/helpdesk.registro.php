<?php
try {
  define ("MODULO", "HELPDESK-REGISTRO");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','SAPTI - Registro Helpdesk');
  $smarty->assign('description','Formulario de registro de Helpdesk');
  $smarty->assign('keywords','SAPTI,Helpdesk,Registro');

  leerClase('Administrador');
  leerClase('Html');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/helpdesk.gestion.php','name'=>'Gesti&oacute;n de Temas de Ayuda');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Registro de Temas de ayuda');
  $smarty->assign("menuList", $menuList);


  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  
  //JS
  $JS[]  = URL_JS . "jquery.min.js";


  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";

  //BOX
  $JS[]  = URL_JS ."box/jquery.box.js";
  $smarty->assign('JS',$JS);

  
  //FileUpload
  $JS[]   = URL_JS . "ui/jquery-ui.min.js";
  $CSS[]  = URL_JS . "ui/overcast/jquery-ui.css";
  $CSS[]  = URL_JS . "jQfu/css/jquery.fileupload-ui.css";

  //CK Editor
  $JS[]  = URL_JS . "ckeditor/ckeditor.js";
  //BOX
  $CSS[]  = URL_JS . "box/box.css";
  $JS[]   = URL_JS ."box/jquery.box.js";

  $smarty->assign('JS',$JS);
  $smarty->assign('CSS',$CSS);

  
  $smarty->assign("ERROR", '');


  //CREAR 
  leerClase('Helpdesk');
  
  $id = '';
  if (isset($_GET['helpdesk_id']) && is_numeric($_GET['helpdesk_id']))
    $id = $_GET['helpdesk_id'];
  $helpdesk = new helpdesk($id);
  // guardamos en la session para recuperar los archivos
  $_SESSION['helpdesk_id'] = $id;
  $template = TEMPLATES_DIR."helpdesk/archivo/{$helpdesk->codigo}.tpl";
  
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    $EXITO = false;
    mysql_query("BEGIN");

    //Primero lo grabamos grabamos si es que hay post
    if ( get_magic_quotes_gpc() )
      $value = stripslashes($_POST['contenido']);
    else
      $value = $_POST['contenido']; 
    $ERROR = Html::grabarTemplate($template,$value);
    
    var_dump($ERROR);
    $helpdesk->objBuidFromPost();
    $helpdesk->estado = Objectbase::STATUS_AC;
    $helpdesk->validar();
    if ( $helpdesk->estado_helpdesk != Helpdesk::EST03_APROBA )
      $helpdesk->estado_helpdesk = Helpdesk::EST02_EDITAD;
    
    $helpdesk->save();
    $EXITO = TRUE;
    mysql_query("COMMIT");
  }
  if ( !file_exists($template) )
    $template = false;
  $template = Html::leerTemplate($template);

  $smarty->assign('template' ,$template);
  $smarty->assign("helpdesk",$helpdesk);

  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje'=>'Se grabo correctamente el La Ayuda','titulo'=>'Registro de Helpdesk' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente el Helpdesk','titulo'=>'Registro de Helpdesk' ,'icono'=> 'warning_48.png');
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
$smarty->display('admin/helpdesk/registro.tpl');

?>