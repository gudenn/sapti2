<?php
try {
    
   require('../_start.php');
  global $PAISBOX;
 
   /** HEADER */
  $smarty->assign('title','Registro de Docentes');
  $smarty->assign('description','Pagina de Registro de Docente');
  $smarty->assign('keywords','Registro,Docentes');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'docente/','name'=>' Docentes');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'docente/'.basename(__FILE__),'name'=>'Registro de Docente');
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


  
  
  
  leerClase('Semestre');
 $semestre=new Semestre();
  $semestre->getActivo();
echo  $semestrecod=$semestre->id;
  

   
  //CREAR UN TUTOR
  leerClase('Docente');
  leerClase('Usuario');
  
   if (isset($_GET['docente_id']) && is_numeric($_GET['docente_id']))
    $id = $_GET['docente_id'];
      $docente=new Docente($id);
      $docente->usuario_id;
      $usuario = new Usuario($docente->usuario_id); 
  
  
  
    if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
           

   $EXITO = false;
    mysql_query("BEGIN");
     $usuario->objBuidFromPost();
     $usuario->estado = Objectbase::STATUS_AC;
     $es_nuevo = (!isset($_POST['usuario_id'])||trim($_POST['usuario_id'])=='' )?TRUE:FALSE;
     //$usuario->validar($es_nuevo);
     $usuario->save();
   
   
      $docente->objBuidFromPost();
      $docente->estado = Objectbase::STATUS_AC;
      $docente->usuario_id = $usuario->id;
      $docente->save();
     
      $EXITO = TRUE;
      mysql_query("COMMIT");
  }
  
    
 
  
  
 
  

  
    $columnacentro = 'admin/columna.centro.registro-docente.tpl';
  $smarty->assign('columnacentro',$columnacentro);
    
    
    $smarty->assign("docente", $docente);

    $smarty->assign("usuario"   , $usuario);
    $smarty->assign('token','');
  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje'=>'Se grabo correctamente el Docente','titulo'=>'Registro de Docente' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente el docente','titulo'=>'Registro de Docente' ,'icono'=> 'warning_48.png');
   $ERROR = $html->getMessageBox ($mensaje);
  }
  $smarty->assign("ERROR",$ERROR);
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$token                = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token',$token);


$TEMPLATE_TOSHOW = 'admin/3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>