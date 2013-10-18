<?php
try {
  define ("MODULO", "ADMIN-CONFIGURACION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  


  /** HEADER */
  $smarty->assign('title','SAPTI - Cronograma Crear');
  $smarty->assign('description','Formulario de Cronograma Crear');
  $smarty->assign('keywords','SAPTI,Cronograma Crear,Registro');

  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Cronograma Crear');
  $smarty->assign("menuList", $menuList);


  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "validate/validationEngine.jquery.css";
  //BOX
  $CSS[]  = URL_JS . "box/box.css";
   $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  $smarty->assign('CSS',$CSS);

  //JS
  
  $JS[]  = URL_JS . "jquery.min.js";
//Datepicker UI
  $JS[]  = URL_JS . "jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";

  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  $smarty->assign('JS',$JS);

  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  //BOX
  $JS[]  = URL_JS ."box/jquery.box.js";
  $smarty->assign('JS',$JS);


  $smarty->assign("ERROR", '');


  leerClase('Cronograma');
  leerClase('Semestre');
  $semestre=new Semestre();
  $semestre->getActivo();
  $semestrecod=$semestre->codigo;
 
 $smarty->assign("semestrecod",$semestrecod);
 
  $smarty->assign('columnacentro','admin/cronograma/columna.centro.registro.tpl');
  $id = '';
  if (isset($_GET['cronograma_id']) && is_numeric($_GET['cronograma_id']))
    $id = $_GET['cronograma_id'];
  $cronograma = new Cronograma($id);
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    $EXITO = false;
    mysql_query("BEGIN");
    $cronograma->objBuidFromPost();
    $cronograma->estado = Objectbase::STATUS_AC;
     $cronograma->semestre_id=$semestre->id;
    //$cronograma->validar();
   
    $cronograma->save();
    $EXITO = TRUE;
    mysql_query("COMMIT");
  }
  $smarty->assign("cronograma",$cronograma);

  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje'=>'Se grabo correctamente el Evento','titulo'=>'Registro de Evento' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente el Evento','titulo'=>'Registro de Evento' ,'icono'=> 'warning_48.png');
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