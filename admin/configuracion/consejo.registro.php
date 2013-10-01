<?php
try {
  define ("MODULO", "CONSEJO-REGISTRO");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','SAPTI - Registro Area');
  $smarty->assign('description','Formulario de registro de Area');
  $smarty->assign('keywords','SAPTI,Area,Registro');

  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administrador');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Registro de consejo');
  $smarty->assign("menuList", $menuList);


 //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "validate/validationEngine.jquery.css";
  //BOX
  $CSS[]  = URL_JS . "box/box.css";
   $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  $smarty->assign('CSS',$CSS);
  
    $JS[]  = URL_JS . "jquery.min.js";
//Datepicker UI
  $JS[]  = URL_JS . "jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";

  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  $smarty->assign('JS',$JS);


  $smarty->assign("ERROR", '');


   leerClase('Docente');
   leerClase('Usuario');
   leerClase('Consejo');
  
  $smarty->assign('columnacentro','admin/consejo/columna.centro.registro.tpl');
 
    if (isset($_POST['buscar']) && $_POST['buscar'] == 'buscar'  && isset($_POST['codigosis']))
    {
      
      echo $_POST['codigosis'];
      $docente= new Docente($_POST['codigosis']);
 
      //echo $docente->codigo_sis;
      
      $usuario= new Usuario($docente->usuario_id);
      $smarty->assign("docente",$docente);
      $smarty->assign("usuario",$usuario); 
    }  
  
  $id = '';
  if (isset($_GET['usuario_id']) && is_numeric($_GET['usuario_id']))
    $id = $_GET['usuario_id'];
  $usuarios= new Usuario($id);
  
  
  
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    $EXITO = false;
    mysql_query("BEGIN");
    $usuarios->objBuidFromPost();
    $usuarios->estado = Objectbase::STATUS_AC;
   // $usuarios->validar();
    $usuarios->save();
    $EXITO = TRUE;
    $consejo= new Consejo();
    $consejo->objBuidFromPost();
     $consejo->usuario_id=$usuarios->id;
     $consejo->login= "hola";
    $consejo->clave="hola";
    $consejo->fecha_inicio=  date("j/n/Y");
    $consejo->estado=  Objectbase::STATUS_AC;
    $consejo->save();
    mysql_query("COMMIT");
  }
  $smarty->assign("usuario",$usuarios);

  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje'=>'Se grabo correctamente el Usuario','titulo'=>'Registro de Consejo' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente el Consejo','titulo'=>'Registro de Consejo' ,'icono'=> 'warning_48.png');
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