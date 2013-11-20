<?php
try {
  define ("MODULO", "ADMIN-CARTAS");
  require('../_start.php');
  if(!isUserSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','SAPTI - Detalle de Carta');
  $smarty->assign('description','Detalle de Carta');
  $smarty->assign('keywords','SAPTI,Carta,Registro');

  leerClase('Administrador');
  leerClase('Html');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'carta/','name'=>'Cartas SAPTI');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'carta/carta.getion.php','name'=>'Gesti&oacute;n de Cartas');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'carta/'.basename(__FILE__),'name'=>'Detalle de Carta');
  $smarty->assign("menuList", $menuList);


  $smarty->assign('header_ui','1');
  $CSS[]  = URL_CSS . "carta.css";
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS','');

  
  $smarty->assign("ERROR", '');


  //CREAR 
  leerClase('Carta');
  leerClase('Proyecto');
  leerClase('Modelo_carta');
  
  $id = '';
  if (isset($_POST['carta_id']) && is_numeric($_POST['carta_id']))
    $id = $_POST['carta_id'];
  $carta    = new Carta($id);
  $proyecto = new Proyecto($carta->proyecto_id);
  $proyecto->getAllObjects();
  $modelo   = new Modelo_carta($carta->modelo_carta_id);
  
  // guardamos en la session para recuperar los archivos
  $template = TEMPLATES_DIR."modelo_carta/archivo/{$modelo->codigo}.tpl";

  if ( !file_exists($template) )
    $template = false;
  $template = Html::leerTemplate($template);
  if (isset($_POST['carta_id']))
    $template = $modelo->asignarFormulario($template);
  
  
  $smarty->assign('template' ,$template);
  $smarty->assign('carta'    ,$carta);
  $smarty->assign('modelo'   ,$modelo);
  $smarty->assign('proyecto' ,$proyecto);

  //No hay ERROR
  $ERROR = ''; 

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
$smarty->display('modelo_carta/impresion.tpl');

?>