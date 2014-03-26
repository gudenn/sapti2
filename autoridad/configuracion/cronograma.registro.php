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
    //$EXITO = false;
    $stado=0;
    mysql_query("BEGIN");
    $cronograma->objBuidFromPost();
    $cronograma->estado = Objectbase::STATUS_AC;
    $cronograma->semestre_id=$semestre->id;
    //$cronograma->validar();
    $cronograma->save();
    
    //$EXITO = TRUE;
    $stado=1;
    mysql_query("COMMIT");
  }
  $smarty->assign("cronograma",$cronograma);

 //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  //$moderador=0;
  if(isset($stado))
  {
  if($stado==1){
       $_SESSION['estado']=$stado;
          header("Location: cronograma.gestion.php");
          

  }  else {
          $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente el Area','titulo'=>'Registro de Area' ,'icono'=> 'warning_48.png');
          $ERROR = $html->getMessageBox ($mensaje);
  }
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