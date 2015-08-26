<?php
try {
  define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php");  


  /** HEADER */
  $smarty->assign('title','SAPTI - Registro Tema');
  $smarty->assign('description','Formulario de registro de Tema');
  $smarty->assign('keywords','SAPTI,Tema,Registro');

  leerClase('Docente');
  leerClase('Forotema');
  $docente = getSessionDocente(); 

  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Docente::URL , 'name'=>'Asignaturas');
  $menuList[]     = array('url'=>URL . Docente::URL .'foro/' , 'name'=>'FORO');

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
  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);


  $smarty->assign("ERROR", '');


  leerClase('Forotema');
  
  $smarty->assign('columnacentro','docente/foro/columna.centro.registro.tpl');
  $id = '';
  if (isset($_GET['forotema_id']) && is_numeric($_GET['forotema_id']))
    $id = $_GET['forotema_id'];
  $forotema = new Forotema($id);
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    //$EXITO = false;
    $stado=0;
    mysql_query("BEGIN");
    $forotema->objBuidFromPost();
    $forotema->estado = Objectbase::STATUS_AC;
    $forotema->usuario_id = $docente->usuario_id;
    $forotema->validar();
    $forotema->save();
    //$EXITO = TRUE;
    $stado=1;
    mysql_query("COMMIT");
  
  }
  $smarty->assign("forotema",$forotema);

  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();

  if (isset($stado) && $stado) {
    $_SESSION['estado'] = $stado;
    header("Location: index.php");
  } elseif (isset($stado)) {
    $mensaje = array('mensaje' => 'Hubo un problema, No se grab&oacute; correctamente el Tema', 'titulo' => 'Registro de Tema', 'icono' => 'warning_48.png');
    $ERROR = $html->getMessageBox($mensaje);
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