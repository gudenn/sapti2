<?php
try {
  define ("MODULO", "ADMIN-SEGURIDAD-GRUPO-REGISTRO");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','SAPTI - Registro De Grupo');
  $smarty->assign('description','Formulario de registro de Grupo para Usuarios');
  $smarty->assign('keywords','SAPTI,Grupo,Registro');
  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'seguridad/','name'=>'Control de Permisos');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'seguridad/'.basename(__FILE__),'name'=>'Registro de Grupo');
  $smarty->assign("menuList", $menuList);
 
  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');


  $smarty->assign("ERROR", '');

  //CREAR UNA OBJETO
  leerClase('Grupo');
  
   $smarty->assign('columnacentro','admin/seguridad/grupo.registro.tpl');
  $id = '';
 
  if (isset($_GET['grupo_id']) && is_numeric($_GET['grupo_id']))
    $id = $_GET['grupo_id'];
  $grupo = new Grupo($id);
  $smarty->assign('grupo',$grupo);
  
  
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
      
   $EXITO = false;
    mysql_query("BEGIN");
    $grupo->objBuidFromPost();
    $grupo->estado = Objectbase::STATUS_AC;
    $grupo->validar();
    $grupo->save();
    $EXITO = TRUE;
    mysql_query("COMMIT");
  }
  
  $smarty->assign("institucion",$institucion);

  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje'=>'Se grabo correctamente la Intitucion','titulo'=>'Registro de Institucion' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente la Institucion','titulo'=>'Registro de Institucion' ,'icono'=> 'warning_48.png');
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