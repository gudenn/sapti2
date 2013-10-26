<?php
try {
  define ("MODULO", "ADMIN-CONFIGURACION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  


  /** HEADER */
  $smarty->assign('title','SAPTI - Registro &Aactue;rea');
  $smarty->assign('description','Formulario de registro de &Aactue;rea');
  $smarty->assign('keywords','SAPTI,Area,Registro');

  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Registro de &Aacute;rea');
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
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);


  $smarty->assign("ERROR", '');


  leerClase('Area');
  
  $smarty->assign('columnacentro','admin/area/columna.centro.registro.tpl');
  $id = '';
  if (isset($_GET['area_id']) && is_numeric($_GET['area_id']))
    $id = $_GET['area_id'];
  $area = new Area($id);
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    $EXITO = false;
    mysql_query("BEGIN");
    $area->objBuidFromPost();
    $area->estado = Objectbase::STATUS_AC;
    $area->validar();
    $area->save();
    $EXITO = TRUE;
    mysql_query("COMMIT");
  }
  $smarty->assign("area",$area);

  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
    $html = new Html();
    if ($EXITO)
    {
      $mensaje = array('mensaje'=>'Se grabo correctamente el Area','titulo'=>'Registro de Area' ,'icono'=> 'tick_48.png');
    
    //  
    }else{
      $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente el Area','titulo'=>'Registro de Area' ,'icono'=> 'warning_48.png');
   }
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