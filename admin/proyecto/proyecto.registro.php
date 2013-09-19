<?php
try {
  define ("MODULO", "PROYECTO-REGISTRO");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','SAPTI - Registro de Proyecto');
  $smarty->assign('description','Formulario de registro de Proyecto');
  $smarty->assign('keywords','SAPTI,Proyecto,Registro');

  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administrador');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'proyecto/','name'=>'Proyecto');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'proyecto/'.basename(__FILE__),'name'=>'Registro de Proyecto');
  $smarty->assign("menuList", $menuList);


  //CSS
  $CSS[]  = URL_CSS . "formulario.css";
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
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

  leerClase('Area');
  leerClase('Dicta');
  leerClase('Usuario');
  leerClase('Carrera');
  leerClase('Proyecto');
  leerClase('Semestre');
  leerClase('Modalidad');
  leerClase('Estudiante');

  $semestre   = new Semestre(false,true);
  $estudiante = new Estudiante(1);
  $estudiante->getAllObjects();
  $usuario    = $estudiante->getUsuario();
  $proyecto   = new Proyecto();

  $smarty->assign('usuario'   , $usuario);
  $smarty->assign('estudiante', $estudiante);
  $smarty->assign('proyecto'  , $proyecto);
  $smarty->assign('semestre'  , $semestre);

  //Objetivos especicicos
  $smarty->assign('base'      , '2'); // cuantos se muestran mas 1
  $smarty->assign('TOTAL'     , '20');// cuantos se van a guardas

  //carrera
  $carrera         = new Carrera();
  $carrera->estado = Objectbase::STATUS_AC;
  $carreras_resp   = $carrera->getAll();
  $carreras_ids[]  = '';
  $carreras[]      = '-- Seleccione --';
  while (isset($carreras_resp[0]) && $carreras_resp[0] && $array = mysql_fetch_array($carreras_resp[0], MYSQL_ASSOC))
  {
    $carreras[]     = $array['nombre'];
    $carreras_ids[] = $array['id'];
  }
  $smarty->assign('carreras'    ,  $carreras);
  $smarty->assign('carreras_ids',  $carreras_ids);
  //trabajo conjunto
  $smarty->assign('trabajo_conjunto', array(
                                 Proyecto::TRABAJO_CONJUNTO_SI => 'Si',
                                 Proyecto::TRABAJO_CONJUNTO_NO => 'No'));
  $smarty->assign('trabajo_conjunto_selected', ($proyecto->trabajo_conjunto==Proyecto::TRABAJO_CONJUNTO_SI)?Proyecto::TRABAJO_CONJUNTO_SI:Proyecto::TRABAJO_CONJUNTO_NO);

  //area
  $area         = new Area();
  $area->estado = Objectbase::STATUS_AC;
  $areas_resp   = $area->getAll();
  $areas_ids[]  = '';
  $areas[]      = '-- Seleccione --';
  while (isset($areas_resp[0]) && $areas_resp[0] && $array = mysql_fetch_array($areas_resp[0], MYSQL_ASSOC))
  {
    $areas[]     = $array['nombre'];
    $areas_ids[] = $array['id'];
  }
  $smarty->assign('areas'    ,  $areas);
  $smarty->assign('areas_ids',  $areas_ids);
  $smarty->assign('areas_sel',  $areas_ids[0]); //@TODO editar areas

  //Muchas Areas
  $smarty->assign('baseareas'      , '0');// cuantos se muestran mas 1
  $smarty->assign('TOTALAREAS'     , '10');// cuantos se van a guardas
  
  //modalidad
  $modalidad         = new Modalidad();
  $modalidad->estado = Objectbase::STATUS_AC;
  $modalidads_resp   = $modalidad->getAll();
  $modalidads_ids[]  = '';
  $modalidads[]      = '-- Seleccione --';
  while (isset($modalidads_resp[0]) && $modalidads_resp[0] && $array = mysql_fetch_array($modalidads_resp[0], MYSQL_ASSOC))
  {
    $modalidads[]     = $array['nombre'];
    $modalidads_ids[] = $array['id'];
  }
  $smarty->assign('modalidads'    ,  $modalidads);
  $smarty->assign('modalidads_ids',  $modalidads_ids);
  $smarty->assign('adicionales_SI',  Modalidad::DATOS_AD_SI);

  //Director de carrera
  $smarty->assign('director_carrera',  $semestre->getValor('director_carrera'));

  //Docente de la materia
  $docentes[]      = '-- Seleccione --';
  foreach ($estudiante->inscrito_objs as $inscrito) 
  {
    $dicta = new Dicta($inscrito->dicta_id);
    $docentes[] = $dicta->getNombreCompretoDocente();
  }
  $smarty->assign('docentes_materia', $docentes);
  $smarty->assign('docente_seleccionado', $proyecto->docente_materia);
  
  //Registrado por
  $administrador_aux = getSessionAdmin();
  $administrador_user  = new Usuario($administrador_aux->usuario_id);
  $smarty->assign('registrado_por', $administrador_user->getNombreCompleto());
  
  //fecha
  $smarty->assign('fecha', date('d/m/Y'));
  
  //cambio de tema
  $smarty->assign('cambio_tema', 'No');
  
  //Responsable Todos los Docentes
  $docentes_responsables = new Docente();
  $docentes_responsables->estado = Objectbase::STATUS_AC;
  $docresp_resp = $docentes_responsables->getAll();
  $docresp[]      = '-- Seleccione --';
  while (isset($docresp_resp[0]) && $docresp_resp[0] && $array = mysql_fetch_array($docresp_resp[0], MYSQL_ASSOC))
  {
    $docente_aux = new Docente($array['id']);
    $docresp[]     = $docente_aux->getNombreCompleto();
  }
  $smarty->assign('docresp'    ,  $docresp);
  $smarty->assign('docresp_sel',  $proyecto->responsable);
  
  
  
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    $EXITO = false;
    mysql_query("BEGIN");
    $semestre->objBuidFromPost();
    $semestre->estado = Objectbase::STATUS_AC;
    $semestre->validar();
    $semestre->save(TRUE/*copiarlaconfiguraciondelalctivo*/);
    $EXITO = TRUE;
    mysql_query("COMMIT");
  }
  $smarty->assign("semestre",$semestre);

  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje'=>'Se grabo correctamente el Semestre','titulo'=>'Registro de Semestre' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente el Semestre','titulo'=>'Registro de Semestre' ,'icono'=> 'warning_48.png');
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

$TEMPLATE_TOSHOW = 'admin/proyecto/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>