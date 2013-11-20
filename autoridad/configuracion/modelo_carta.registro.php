<?php
try {
  define ("MODULO", "ADMIN-CARTAS");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','SAPTI - Registro Modelo de Carta');
  $smarty->assign('description','Formulario de registro de Modelo de Carta');
  $smarty->assign('keywords','SAPTI,Modelo de Carta,Registro');

  leerClase('Administrador');
  leerClase('Html');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/modelo_carta.gestion.php','name'=>'Gesti&oacute;n de Modelos de Cartas');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Registro de Modelo de Carta');
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
  leerClase('Modelo_carta');
  
  $id = '';
  if (isset($_GET['modelo_carta_id']) && is_numeric($_GET['modelo_carta_id']))
    $id = $_GET['modelo_carta_id'];
  $modelo = new Modelo_carta($id);
  if (!isset($modelo->codigo) || !$modelo->codigo || trim($modelo->codigo) == '' )
    $modelo->codigo = sha1( $modelo->titulo . time());

  // guardamos en la session para recuperar los archivos
  $template = TEMPLATES_DIR."modelo_carta/archivo/{$modelo->codigo}.tpl";

  leerClase('Materia');
  $smarty->assign("tipo_values", array( ''                 , Materia::MATERIA_PE, Materia::MATERIA_PR));
  $smarty->assign("tipo_output", array( '-- Seleccione --' , 'TIPO PERFIL'      , 'TIPO PROYECTO FINAL'));

  $smarty->assign("estado_values", array( ''                 , 'IN'        , 'PD'                            , 'CO'                           ,'VB'         , 'TA'               ,'TV'                  , 'LD'                       , 'PF'                 ));
  $smarty->assign("estado_output", array( '-- Seleccione --' , 'Iniciado'  , 'Formulario de Perfil Pendiente', 'Formulario de Perfil Aprobado','Visto Bueno', 'Tribunal Asignado','Visto Bueno Tribunal', 'Fecha de Defensa Asignada', 'Proyecto Finalizado'));

  
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

    $modelo->objBuidFromPost();
    $modelo->estado = Objectbase::STATUS_AC;
    $modelo->validar();
    
    $modelo->save();
    $EXITO = TRUE;
    mysql_query("COMMIT");
  }
  if ( !file_exists($template) )
    $template = false;
  $template = Html::leerTemplate($template);

  $smarty->assign('template'    ,$template);
  $smarty->assign("modelo_carta",$modelo);

  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
     $_SESSION['estado'] = 1;
     header("Location: modelo_carta.gestion.php");
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
$smarty->display('admin/modelo_carta/registro.tpl');

?>