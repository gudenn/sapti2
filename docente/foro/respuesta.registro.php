<?php
try {
  define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','SAPTI - Registro Respueta');
  $smarty->assign('description','Formulario de registro de Respuetas');
  $smarty->assign('keywords','SAPTI, Respuetas,Registro');


  leerClase('Docente');
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


  leerClase('Forotema');
  leerClase('Fororespuesta');
  
  //Son las subareas de un area asi que si o si tenemos una area
  $forotema_id = false;
  if (isset($_SESSION['forotema_id']) && is_numeric($_SESSION['forotema_id']))
    $forotema_id = $_SESSION['forotema_id'];
  if (isset($_GET['forotema_id']) && is_numeric($_GET['forotema_id']))
  {
    $_SESSION['forotema_id'] = $_GET['forotema_id'];
    $forotema_id             = $_GET['forotema_id'];
  }
  $forotema = new Forotema($forotema_id);
  $smarty->assign("forotema"  ,$forotema);

  
  $smarty->assign('columnacentro','docente/fororespuesta/columna.centro.registro.tpl');
  $id = '';
  if (isset($_GET['fororespuesta_id']) && is_numeric($_GET['fororespuesta_id']))
    $id = $_GET['fororespuesta_id'];
  $objeto = new Fororespuesta($id);
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    $EXITO = false;
    mysql_query("BEGIN");
    $objeto->objBuidFromPost();
    $objeto->estado      = Objectbase::STATUS_AC;
    $objeto->forotema_id = $forotema->id;
    $objeto->usuario_id  = $docente->usuario_id;
    
    $objeto->validar();
    $objeto->save();
    $EXITO = TRUE;
    $stado = 1;
    mysql_query("COMMIT");
  }
  $smarty->assign("fororespuesta",$objeto);

  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();

  if (isset($stado) && $stado) {
    $_SESSION['estado'] = $stado;
    header("Location: respuesta.gestion.php");
  } elseif (isset($stado)) {
    $mensaje = array('mensaje' => 'Hubo un problema, No se grab&oacute; correctamente la respuesta', 'titulo' => 'Registro de respuesta', 'icono' => 'warning_48.png');
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