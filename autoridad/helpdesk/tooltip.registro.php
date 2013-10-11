<?php
try {
  define ("MODULO", "ADMIN-HELPDESK-TOOLTIPS-REGISTRO");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','SAPTI - Registro Tooltips');
  $smarty->assign('description','Formulario de registro de Tooltips');
  $smarty->assign('keywords','SAPTI,tooltips,Registro');

  leerClase('Administrador');
  leerClase('Html');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'helpdesk/','name'=>'Helpdesk SAPTI');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'helpdesk/tooltip.gestion.php','name'=>'Gesti&oacute;n de Tooltips');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'helpdesk/'.basename(__FILE__),'name'=>'Registro de Tooltips de ayuda');
  $smarty->assign("menuList", $menuList);


  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

  
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
  leerClase('Tooltip');
  $smarty->assign('columnacentro','admin/tooltip/registro.tpl');
  
  
  $id = '';
  if (isset($_GET['tooltip_id']) && is_numeric($_GET['tooltip_id']))
    $id = $_GET['tooltip_id'];
  $tooltip = new Tooltip($id);
  // guardamos en la session para recuperar los archivos
  $_SESSION['tooltip_id'] = $id;
  
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    $EXITO = false;
    mysql_query("BEGIN");

    //Primero lo grabamos grabamos si es que hay post
    $tooltip->objBuidFromPost();
    $tooltip->estado = Objectbase::STATUS_AC;
    $tooltip->validar();
    if ( $tooltip->estado_tooltip != Tooltip::EST02_APROBA)
      $tooltip->estado_tooltip = Tooltip::EST02_APROBA;
    
    $tooltip->save();
    $EXITO = TRUE;
    mysql_query("COMMIT");
  }
  if ( !file_exists($template) )
    $template = false;
  $template = Html::leerTemplate($template);

  $smarty->assign('template' ,$template);
  $smarty->assign("tooltip"  ,$tooltip);

  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje'=>'Se grabo correctamente el La Ayuda','titulo'=>'Registro de Tooltip' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente el Tooltip','titulo'=>'Registro de Tooltip' ,'icono'=> 'warning_48.png');
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