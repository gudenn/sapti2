<?php
try {
  define ("MODULO", "ADMIN-CONFIGURACION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','SAPTI - Registro Institucion');
  $smarty->assign('description','Formulario de registro de Instituci&oacute;n');
  $smarty->assign('keywords','SAPTI,Instituci&oacute;n,Registro');
  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Registro de Instituci&oacute;n');
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

  //CREAR UNA DEFENSA
  leerClase('Institucion');
  
   $smarty->assign('columnacentro','admin/institucion/columna.centro.registro.tpl');
  $id = '';
 
if (isset($_GET['institucion_id']) && is_numeric($_GET['institucion_id']))
  $id = $_GET['institucion_id'];
  $institucion = new Institucion($id);
  
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
      
   $EXITO = false;
   $stado=0;
    mysql_query("BEGIN");
    $institucion->objBuidFromPost();
    $institucion->estado = Objectbase::STATUS_AC;
    $institucion->validar();
    $institucion->save();
    $EXITO = TRUE;
    $stado=1;
    mysql_query("COMMIT");
  }
  
  $smarty->assign("institucion",$institucion);

 //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  //$moderador=0;
  if(isset($stado))
  {
  if($stado==1){
       $_SESSION['estado']=$stado;
          header("Location: institucion.gestion.php");
          

  }  else {
          $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente la Institucion','titulo'=>'Registro de Institucion' ,'icono'=> 'warning_48.png');
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