<?php
try {
  define ("MODULO", "ADMIN-CONFIGURACION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  


  /** HEADER */
  $smarty->assign('title','SAPTI - Registro Materia');
  $smarty->assign('description','Formulario de registro de Materia');
  $smarty->assign('keywords','SAPTI,Materia,Registro');

  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Registro de Materia');
  $smarty->assign("menuList", $menuList);


 //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "validate/validationEngine.jquery.css";
 
  //JS
  $JS[]  = URL_JS . "jquery.min.js";


  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  //MASK
  $JS[]   = URL_JS . "jQuery-Mask/jquery.mask.min.js";
  //BOX
  $CSS[]  = URL_JS . "box/box.css";
  $JS[]   = URL_JS ."box/jquery.box.js";
  //Datepicker & Tooltips $ Dialogs UI
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  $JS[]   = URL_JS . "jquery-ui-1.10.3.custom.min.js";
  $JS[]   = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);


  $smarty->assign("ERROR", '');
  leerClase('Materia');

  $smarty->assign("tipo_values", array( ''                 , Materia::MATERIA_PE, Materia::MATERIA_PR));
  $smarty->assign("tipo_output", array( '-- Seleccione --' , 'TIPO PERFIL'      , 'TIPO PROYECTO FINAL'));
  
  $smarty->assign('columnacentro','admin/materia/columna.centro.registro.tpl');
  $id = '';
  if (isset($_GET['materia_id']) && is_numeric($_GET['materia_id']))
    $id = $_GET['materia_id'];
  $materia = new Materia($id);
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    $EXITO = false;
    $stado=0;
    mysql_query("BEGIN");
    
    $materia->objBuidFromPost();
    $materia->estado = Objectbase::STATUS_AC;
    $materia->validar();
    $materia->save();
    $EXITO = TRUE;
    $stado=1;
    mysql_query("COMMIT");
  }
  $smarty->assign("materia",$materia);

   //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  //$moderador=0;
  if(isset($stado))
  {
  if($stado==1){
       $_SESSION['estado']=$stado;
          header("Location: materia.gestion.php");
          

  }  else {
          $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente la Materia','titulo'=>'Registro de Materia' ,'icono'=> 'warning_48.png');
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