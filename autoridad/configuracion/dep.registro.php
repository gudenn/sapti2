<?php
try {
  define ("MODULO", "ADMIN-CONFIGURACION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  


  /** HEADER */
  $smarty->assign('title','SAPTI - Registro Dep');
  $smarty->assign('description','Formulario de registro de Dep');
  $smarty->assign('keywords','SAPTI,Dep,Registro');

  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Asignar Dep');
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
 //Asignar Semestre al estudiante
  leerClase('Institucion');
  leerClase('Departamento');
 $institucion     = new Institucion();
 $institucion    = $institucion ->getAll();
 $institucion_values[] = '';
 $institucion_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($institucion[0])) 
  {
    $institucion_values[] = $row['id'];
    $institucion_output[] = $row['nombre'];
  }
  $smarty->assign("institucion_values",  $institucion_values);
  $smarty->assign("institucion_output",$institucion_output);
  $smarty->assign("institucion_selected", "");

 // leerClase('Area');
  
  $smarty->assign('columnacentro','admin/departamento/columna.centro.registro.tpl');
  $id = '';
  if (isset($_GET['dep_id']) && is_numeric($_GET['dep_id']))
    $id = $_GET['dep_id'];
  $dep= new Departamento($id);
  
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    $EXITO = false;
    mysql_query("BEGIN");
   $dep->objBuidFromPost();
   $dep->estado = Objectbase::STATUS_AC;
 //   $area_sub_area->validar();
    $dep->institucion_id=$_POST['institucion_id'];
    $dep->save();
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
      $mensaje = array('mensaje'=>'Se grabo correctamente el Area','titulo'=>'Registro de Area' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente el Area','titulo'=>'Registro de Area' ,'icono'=> 'warning_48.png');
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