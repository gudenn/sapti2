<?php
try {
  define ("MODULO", "ESTUDIANTE");
  require('_start.php');
  if(!isEstudianteSession())
    header("Location: ../login.php");  

  leerClase('Estudiante');
  
  /** HEADER */
  $smarty->assign('title','SAPTI - Registro Estudiantes');
  $smarty->assign('description','Formulario de registro de estudiantes');
  $smarty->assign('keywords','SAPTI,Estudiantes,Registro');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Estudiante::URL,'name'=>'Estudiante');
  $menuList[]     = array('url'=>URL . Estudiante::URL . basename(__FILE__),'name'=>'Editar mi cuenta');
  $smarty->assign("menuList", $menuList);

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  /////css del calendario
  

  //JS
  $JS[]  = URL_JS . "jquery.min.js";

  //Datepicker & Tooltips $ Dialogs UI
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  $JS[]   = URL_JS . "jquery-ui-1.10.3.custom.min.js";
  $JS[]   = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";

  //Validation
  $CSS[] = URL_JS . "/validate/validationEngine.jquery.css";
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  //BOX
  $CSS[] = URL_JS . "box/box.css";
  $JS[]  = URL_JS . "box/jquery.box.js";

  
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);


  $smarty->assign("ERROR", '');


  //CREAR UN ESTUDIANTE
  leerClase('Grupo');
  leerClase('Usuario');
  leerClase('Estudiante');
  leerClase('Proyecto');
  leerClase('Materia');
  leerClase('Proyecto_dicta');
  leerClase('Proyecto_estudiante');

  
  $editar = TRUE;
  $estudiante = getSessionEstudiante();
  $usuario    = new Usuario($estudiante->usuario_id);
  
  $smarty->assign("usuario"   , $usuario);
  $smarty->assign("estudiante", $estudiante);
  
  
  //Sexo del usuario
  $smarty->assign('sexo', array(
      Usuario::FEMENINO  => 'Femenino',
      Usuario::MASCULINO => 'Masculino'));
  $smarty->assign('sexo_selected', ($usuario->sexo==Usuario::FEMENINO)?Usuario::FEMENINO:Usuario::MASCULINO);
  

  
  $columnacentro = 'admin/estudiante/columna.centro.estudiante-registro-editar.tpl';
  $smarty->assign('columnacentro',$columnacentro);
  
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar'  && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    $EXITO = false;
    mysql_query("BEGIN");
    $usuario->objBuidFromPost();
    $estudiante->objBuidFromPost();
    $usuario->estado = Objectbase::STATUS_AC;
    $es_nuevo        = (!isset($_POST['usuario_id'])||trim($_POST['usuario_id'])=='' )?TRUE:FALSE;
    $usuario->validar($es_nuevo);
    $usuario->save();
    
    //usuario pertenece a un grupo
    //$usuario->asignarGrupo(Grupo::GR_ES);
    

    $estudiante->estado     = Objectbase::STATUS_AC;
    $estudiante->usuario_id = $usuario->id;
    $estudiante->validar($es_nuevo);
    $estudiante->save();

    
    $EXITO = true;
    mysql_query("COMMIT");
  }

  

  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje'=>'Se actualiz&oacute; correctamente la informaci&oacute;n del Estudiante','titulo'=>'Registro de Estudiante' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente el Estudiante','titulo'=>'Registro de Estudiante' ,'icono'=> 'warning_48.png');
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

$TEMPLATE_TOSHOW = 'estudiante/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>