<?php
try {
  define ("MODULO", "ADMIN-CONFIGURACION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','SAPTI - Registro Institucion');
  $smarty->assign('description','Formulario de registro de Institucion');
  $smarty->assign('keywords','SAPTI,Institucion,Registro');
  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Registro de Lugar de Defensa');
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
  leerClase('Lugar');
  
   $smarty->assign('columnacentro','admin/lugar/columna.centro.registro.tpl');
  $id = '';
 
if (isset($_GET['lugar_id']) && is_numeric($_GET['lugar_id']))
  echo  $id = $_GET['lugar_id'];
  $lugar = new Lugar($id);
  
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
      
   $EXITO = false;
   $stado=0;
    mysql_query("BEGIN");
    $lugar->objBuidFromPost();
    $lugar->estado = Objectbase::STATUS_AC;
   // $lugar->validar();
    $lugar->save();
    $EXITO = TRUE;
    $stado=1;
    mysql_query("COMMIT");
  }
  
  $smarty->assign("lugar",$lugar);

  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  //$moderador=0;
  if(isset($stado))
  {
  if($stado==1){
       $_SESSION['estado']=$stado;
          header("Location: lugar.gestion.php");
          

  }  else {
          $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente el Lugar','titulo'=>'Registro de Lugar' ,'icono'=> 'warning_48.png');
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