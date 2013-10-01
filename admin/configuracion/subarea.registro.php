<?php
try {
  define ("MODULO", "SUBAREA-REGISTRO");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','SAPTI - Registro Sub-Area');
  $smarty->assign('description','Formulario de registro de  Sub-Area');
  $smarty->assign('keywords','SAPTI, Sub-Area,Registro');

  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/area.gestion.php','name'=>'Gesti&oacute;n de Areas');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/subarea.gestion.php','name'=>'Gesti&oacute;n de Sub-Areas');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Registro de Sub-Area');

  $smarty->assign("menuList", $menuList);


  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "validate/validationEngine.jquery.css";
  //BOX
  $CSS[]  = URL_JS . "box/box.css";
  
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";


  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  //BOX
  $JS[]  = URL_JS ."box/jquery.box.js";
  $smarty->assign('JS',$JS);


  $smarty->assign("ERROR", '');


  leerClase('Area');
  leerClase('Sub_area');
  
  //Son las subareas de un area asi que si o si tenemos una area
  $area_id = false;
  if (isset($_SESSION['area_id']) && is_numeric($_SESSION['area_id']))
    $area_id = $_SESSION['area_id'];
  if (isset($_GET['area_id']) && is_numeric($_GET['area_id']))
  {
    $_SESSION['area_id'] = $_GET['area_id'];
    $area_id             = $_GET['area_id'];
  }
  $area = new Area($area_id);
  $smarty->assign("area"  ,$area);

  
  $smarty->assign('columnacentro','admin/sub_area/columna.centro.registro.tpl');
  $id = '';
  if (isset($_GET['subarea_id']) && is_numeric($_GET['subarea_id']))
    $id = $_GET['subarea_id'];
  $subarea = new Sub_area($id);
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    $EXITO = false;
    mysql_query("BEGIN");
    $subarea->objBuidFromPost();
    $subarea->estado  = Objectbase::STATUS_AC;
    $subarea->area_id = $area->id;
    $subarea->validar();
    $subarea->save();
    $EXITO = TRUE;
    mysql_query("COMMIT");
  }
  $smarty->assign("subarea",$subarea);

  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje'=>'Se grabo correctamente el Sub-Area','titulo'=>'Registro de Sub-Area' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente el Sub-Area','titulo'=>'Registro de Sub-Area' ,'icono'=> 'warning_48.png');
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