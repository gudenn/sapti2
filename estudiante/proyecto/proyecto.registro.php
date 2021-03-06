<?php

  if (!defined('MODULO')) {
    define ("MODULO", "ESTUDIANTE");
  }
  require_once('../_start.php');
  if( MODULO == 'ESTUDIANTE' && !isEstudianteSession() || MODULO == 'ADMIN-PROYECTO' && !isAdminSession() ){
    header("Location: ../login.php");
  }


try {
  /** HEADER */
  $smarty->assign('title','SAPTI - Registro de Proyecto');
  $smarty->assign('description','Formulario de registro de Proyecto');
  $smarty->assign('keywords','SAPTI,Proyecto,Registro');


  leerClase('Administrador');
  leerClase('Estudiante');
  /**
   * Menu superior
   */
  if (isAdminSession()){
    $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Estudiante');
    $menuList[]     = array('url'=>URL . Administrador::URL . 'proyecto/','name'=>'Proyecto');
    $menuList[]     = array('url'=>URL . Administrador::URL . 'proyecto/'.basename(__FILE__),'name'=>'Registro de Proyecto');
  }
  else {
    $menuList[]     = array('url'=>URL . Estudiante::URL , 'name'=>'Estudiante');
    $menuList[]     = array('url'=>URL . Estudiante::URL . 'proyecto/'.basename(__FILE__),'name'=>'Registro de Proyecto');
  }
  $smarty->assign("menuList", $menuList);


  //CSS
  $CSS[]  = URL_CSS . "formulario.css";
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  //BOX
  $CSS[]  = URL_JS . "box/box.css";


  //JS
  $JS[]  = URL_JS . "jquery.min.js";


  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  //BOX
  $JS[]  = URL_JS ."box/jquery.box.js";

  //Datepicker & Tooltips $ Dialogs UI
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  $JS[]   = URL_JS . "jquery-ui-1.10.3.custom.min.js";
  $JS[]   = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);

  leerClase('Area');
  leerClase('Dicta');
  leerClase('Docente');
  leerClase('Usuario');
  leerClase('Carrera');
  leerClase('Proyecto');
  leerClase('Formulario');
  leerClase('Semestre');
  leerClase('Sub_area');
  leerClase('Modalidad');
  leerClase('Estudiante');
  leerClase('Institucion');
  leerClase('Vigencia');

  leerClase('Objetivo_especifico');

  $semestre   = new Semestre(false,true);
  //si o si trabajamos aca con un estudiante asi que lo guardaremos en session
  $estudiante_id = false;
  if (isset($_SESSION['estudiante_id']) && is_numeric($_SESSION['estudiante_id'])){
    $estudiante_id = $_SESSION['estudiante_id'];
  }
  if (isset($_GET['estudiante_id']) && is_numeric($_GET['estudiante_id'])){
    $_SESSION['estudiante_id'] = $_GET['estudiante_id'];
    $estudiante_id             = $_GET['estudiante_id'];
  }

  if (isAdminSession()){
      $estudiante = new Estudiante($estudiante_id);
  }
  else {
      $estudiante= getSessionEstudiante();
  }

  $estudiante->getAllObjects();
  $usuario    = $estudiante->getUsuario();
  $proyecto   = $estudiante->getProyecto();


  $proyecto->getAllObjects();

  if($proyecto->estado_proyecto==Proyecto::EST6_C && !isAdminSession()){
    ?>
        <script language='JavaScript'>
          alert('Lo sentimos usted no tiene acseso al registro Perfil');
        </script>";
    <?php
    header("Location:../login.php");
    exit();//SALIMOS ASI EVITAMOS UN ELSE TAN LARGO
  }

  $numero = $proyecto->asignarNumero();
  $smarty->assign('numero'  ,$numero );

  $smarty->assign('usuario'   , $usuario);
  $smarty->assign('estudiante', $estudiante);
  $smarty->assign('proyecto'  , $proyecto);
  $smarty->assign('semestre'  , $semestre);

  $smarty->assign('tipo_moda' , 'tipo_moda');
  if ($proyecto->modalidad_id){
    $modalidad    = new Modalidad($proyecto->modalidad_id);
    $smarty->assign('tipo_moda_mostrar',($modalidad->datos_adicionales)?'Si':'No');
  }

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

  //Tutores
  $tutores = $proyecto->getTutores();
  $smarty->assign('tutores', $tutores);
  $registro_tutor[] = '-- Seleccione --';
  foreach ($tutores as $tutor) {
    $registro_tutor[] = $tutor->getNombreCompleto();
  }
  $smarty->assign('registro_tutor'    ,  $registro_tutor);


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

  //institucion
  $institucion         = new Institucion();
  $institucion->estado = Objectbase::STATUS_AC;
  $institucions_resp   = $institucion->getAll();
  $institucions_ids[]  = '';
  $institucions[]      = '-- Seleccione --';
  while (isset($institucions_resp[0]) && $institucions_resp[0] && $array = mysql_fetch_array($institucions_resp[0], MYSQL_ASSOC))
  {
    $institucions[]     = $array['nombre'];
    $institucions_ids[] = $array['id'];
  }
  $smarty->assign('instituciones'    ,  $institucions);
  $smarty->assign('instituciones_ids',  $institucions_ids);


  //Director de carrera
  $smarty->assign('director_carrera',  $semestre->getValor('Director carrera Sistemas','Director Sistemas'));

  //Docente de la materia
  $docentes[]      = '-- Seleccione --';
  foreach ($estudiante->inscrito_objs as $inscrito)
  {
    $dicta = new Dicta($inscrito->dicta_id);
    $docentes[] = $dicta->getNombreCompretoDocente();
  }
  $smarty->assign('docentes_materia', $docentes);

  //Registrado por
  if (isAdminSession()){
    $administrador_aux = getSessionAdmin();
    $administrador_user  = new Usuario($administrador_aux->usuario_id);
    $smarty->assign('registrado_por', $administrador_user->getNombreCompleto());
  }
  else {
    $smarty->assign('registrado_por', $estudiante->getNombreCompleto());
  }

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


  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token']  )
  {
    $EXITO = false;
    mysql_query("BEGIN");
    // para no re escribir los Objetivos
    // eliminaremos toos los objetivos previa mente grabados
    if ($proyecto->id){
      $proyecto->prepararParaActualizar();
    }


    // SOLO PARA CAMBIOS DE TEMA
    //$proyecto = new Proyecto();
    $proyecto->objBuidFromPost('proyecto_');
    $proyecto->estado         = Objectbase::STATUS_AC;

    $proyecto->fecha_registro = date('d/m/Y');
    $smarty->assign('proyecto'  , $proyecto);


    //proyecto_institucion_nueva
    if ( isset($_POST['proyecto_institucion_nueva']) && trim($_POST['proyecto_institucion_nueva'])!= '' )
    {
      $nuevainstitucion = new Institucion();
      $nuevainstitucion->saveFast($_POST['proyecto_institucion_nueva']);
      $proyecto->institucion_id = $nuevainstitucion->id;
    }

    //Objetivos especificos
    $contador = 0;
    foreach ($_POST['objetivo_especifico'] as $post_especifico) {
      $contador ++;
      if ( trim($post_especifico) == '' )
        continue;
      $especifico = new Objetivo_especifico();
      $especifico->descripcion = $post_especifico;
      $especifico->estado      = Objectbase::STATUS_AC;
      $especifico->validar();
      $proyecto->objetivo_especifico_objs[] = $especifico;
    }
    $proyecto->asignarEstudiante($estudiante->id);

    //areas y subareas
    $contador = 0;
    foreach ($_POST['area_activa'] as $a_activa) {
      if ( !$a_activa || !($_POST['proyecto_area_id'][$contador]) || ( !($_POST['proyecto_subarea_id'][$contador]) && trim($_POST['nueva_subarea_nombre'][$contador]) == '' ) )
        continue;
      $area_id    = $_POST['proyecto_area_id'][$contador];
      $subarea_id = $_POST['proyecto_subarea_id'][$contador];
      if (  trim($_POST['nueva_subarea_nombre'][$contador]) != '' )
      {
        $subarea = new Sub_area();
        $subarea->nombre      = $_POST['nueva_subarea_nombre'][$contador];
        $subarea->descripcion = $_POST['nueva_subarea_nombre'][$contador];
        $subarea->area_id     = $area_id;
        $subarea->estado      = Objectbase::STATUS_AC;
        $subarea->validar();
        $subarea->save();
        $subarea_id = $subarea->id;
      }
      $proyecto->asignarAreaSubArea($area_id,$subarea_id);
      $contador ++;


    }

    $proyecto->validar();

    if (isAdminSession()){
        $proyecto->tipo_proyecto =  Proyecto::TIPO_PROYECTO;
    }
    else {
        $proyecto->tipo_proyecto =  Proyecto::TIPO_PERFIL;
    }

    $proyecto->estado_proyecto= Proyecto::EST5_P;

    $proyecto->save();
    $proyecto->saveAllSonObjects(TRUE);
    $estudiante->marcarComoProyectoActual($proyecto->id);

    $proyecto->asignarVigencia();

    //guardamos datos extra
    if ( isset($_POST['telefono']) )
    {
      $usuario->telefono = $_POST['telefono'];
      Formulario::validar('telefono',$usuario->telefono,'texto','El Tel&eacute;fono',TRUE);
    }
    if ( isset($_POST['email']) )
    {
      $usuario->email = $_POST['email'];
      Formulario::validar('email',$usuario->telefono,'texto','El E-mail',TRUE);
    }
    if ( isset($_POST['email']) || isset($_POST['telefono']) )
      $usuario->save();


    $EXITO = TRUE;
    mysql_query("COMMIT");
  }// FIN GRABAR PROYECTO




  $smarty->assign("semestre",$semestre);

  //No hay ERROR
  $ERROR = '';
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje'=>'Se grab&oacute;correctamente el Proyecto','titulo'=>'Registro de Proyecto' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Hubo un problema, No se grab&oacute; correctamente el Proyecto','titulo'=>'Registro de Proyecto' ,'icono'=> 'warning_48.png');
   $ERROR = $html->getMessageBox ($mensaje);
  }
  $smarty->assign("ERROR",$ERROR);

}
catch(Exception $e){
  mysql_query("ROLLBACK");
  $smarty->assign("ERROR", handleError($e));
}
//asignamos el numero
$smarty->assign('numero'  , $proyecto->numero_asignado);

$token                = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token',$token);

$TEMPLATE_TOSHOW = 'estudiante/proyecto/registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>