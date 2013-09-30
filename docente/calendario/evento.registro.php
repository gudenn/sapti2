<?php
try {
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: login.php");
  
  leerClase('Evento');
  leerClase('Docente');
  
  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";

  //Datepicker UI
  $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";

  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";
  $smarty->assign('JS',$JS);
  
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Docente');
  $menuList[]     = array('url'=>URL.Docente::URL.basename(__FILE__),'name'=>'Registro de Eventos');
  $smarty->assign("menuList", $menuList);
  
  $docente=  getSessionDocente();
  $docente_ids=$docente->id;
  $evento = new Evento();

  $smarty->assign("evento", $evento);
    
    if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    $evento->objBuidFromPost();
    $evento->estado = Objectbase::STATUS_AC;
    $quitarsaltos=$evento->descripcion;
    $evento->descripcion=preg_replace("/\r\n+|\r+|\n+|\t+/i", " ", $quitarsaltos);
    $evento->dicta_id=4;
    $evento->save();

    $url="calendario.evento.php";
    $ir = "Location: $url";
        header($ir);
    }
    
  $columnacentro = 'docente/calendario/columna.centro.evento.registro.tpl';
  $smarty->assign('columnacentro',$columnacentro);  
  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
$token                = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token',$token);

$TEMPLATE_TOSHOW = 'docente/docente.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>