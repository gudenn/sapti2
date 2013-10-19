<?php
try {
  define ("MODULO", "ADMIN-HELPDESK");
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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'helpdesk/','name'=>'Helpdesk SAPTI');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'helpdesk/helpdesk.gestion.php','name'=>'Gesti&oacute;n de Temas de Ayuda');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'helpdesk/'.basename(__FILE__),'name'=>'Registro de Temas de ayuda');
  $smarty->assign("menuList", $menuList);


  $smarty->assign('header_ui','1');

  
  //FileUpload
  $JS[]   = URL_JS . "ui/jquery-ui.min.js";
  $CSS[]  = URL_JS . "ui/overcast/jquery-ui.css";
  $CSS[]  = URL_JS . "jQfu/css/jquery.fileupload-ui.css";

  //CK Editor
  $JS[]  = URL_JS . "ckeditor/ckeditor.js";
  

  $smarty->assign('JS',$JS);
  $smarty->assign('CSS',$CSS);

  
  $smarty->assign("ERROR", '');


  //CREAR 
  leerClase('Helpdesk');
  
  $id = '';
  if (isset($_GET['helpdesk_id']) && is_numeric($_GET['helpdesk_id']))
    $id = $_GET['helpdesk_id'];
  $helpdesk = new Helpdesk($id);
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
      $mensaje = array('mensaje'=>'Se grabo correctamente La Ayuda','titulo'=>'Registro de Helpdesk' ,'icono'=> 'tick_48.png');
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