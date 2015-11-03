<?php
try {
  define ("MODULO", "ADMIN-TUTOR");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  


  /** HEADER */
  leerClase("Tutor");
  leerClase("Usuario");
  leerClase("Estudiante");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");
  leerClase('Semestre');


  $ERROR ='';

  /** HEADER */
  $smarty->assign('title','Enviar Solicitud');
  $smarty->assign('description','P&aacute;gina de listado de tutores');
  $smarty->assign('keywords','Docentes');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'tutor/','name'=>'Tutor');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'tutor/'.basename(__FILE__),'name'=>'Posibles tutores');
  $smarty->assign("menuList", $menuList);

  
  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

  $smarty->assign('cabecera_file' ,'admin/tutor/cabecera.listaasignacion.tpl');
  $smarty->assign('mascara'       ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'         ,'admin/tutor/lista.tutores.tpl');

  if ( isset($_GET['cambiartutor_id']) && is_numeric($_GET['cambiartutor_id']) )
  {
    $smarty->assign('cambiartutor_id'  ,$_GET['cambiartutor_id']);
    $tutor  = new Tutor($_GET['cambiartutor_id']);
    $smarty->assign('tutor'            ,$tutor);
  }


  //si o si trabajamos aca con un estudiante asi que lo guardaremos en session
  $estudiante_id = false;
  if (isset($_SESSION['estudiante_id']) && is_numeric($_SESSION['estudiante_id']))
    $estudiante_id = $_SESSION['estudiante_id'];
  if (isset($_GET['estudiante_id']) && is_numeric($_GET['estudiante_id']))
  {
    $_SESSION['estudiante_id'] = $_GET['estudiante_id'];
    $estudiante_id             = $_GET['estudiante_id'];
  }
  $estudiante = new Estudiante($estudiante_id);
  $proyecto   = $estudiante->getProyecto();
  
  // Asignamos al tutor al estudiante
  if ( $proyecto && isset($_GET['asignar']) && $_GET['asignar'] && isset($_GET['usuario_id']) && is_numeric($_GET['usuario_id']) )
  {
    $EXITO = false;
    mysql_query("BEGIN");

    // Primero quitamos al tutor anterior
    if ( isset($_GET['cambiartutor_id']) && is_numeric($_GET['cambiartutor_id']) )
    {
      $tutoantiguo = new Tutor($_GET['cambiartutor_id']);
      $tutoantiguo->finalizarTutoria($estudiante->id);
    }
    
    $usuario = new Usuario($_GET['usuario_id']);
    $usuario->getAllObjects();

    if ( !sizeof($usuario->tutor_objs) )
    {
      $nuevotutor = new Tutor();
      $nuevotutor->usuario_id = $usuario->id;
      $nuevotutor->estado     = Objectbase::STATUS_AC;
      $nuevotutor->save();
      $usuario->tutor_objs[]  = $nuevotutor;
    }
    else
    {
      $nuevotutor = $usuario->tutor_objs[0];
    }
    $se_asigno_correctamente = $nuevotutor->asignarTutoria($estudiante->id);
    
    $EXITO = TRUE;
    mysql_query("COMMIT");


  }
  
  
  
  $proyecto_tutores = $proyecto->getThisObjects('proyecto_tutor_objs',  get_class($proyecto) );
  // buscamos que no se repitan los tutores
  $usuariost_id = '';
  foreach ($proyecto_tutores as $proyecto_tutor) 
  {
    $tutor = new Tutor($proyecto_tutor->tutor_id);
    $usuariost_id .= $tutor->usuario_id . ',';
  }
  if ($usuariost_id != '')
  {
    $usuariost_id = rtrim($usuariost_id, ',');
    $usuariost_id = " AND usuario.id NOT IN ($usuariost_id) ";
  }
  
  
  $smarty->assign("estudiante" ,$estudiante);
  if ( isset($_GET['cambiartutor_id']) && is_numeric($_GET['cambiartutor_id']) )
    $smarty->assign("crear_nuevo"  ,"tutor.registro.php?estudiante_id={$estudiante->id}&cambiartutor_id=".$_GET['cambiartutor_id']);
  else
    $smarty->assign("crear_nuevo"  ,"tutor.registro.php?estudiante_id={$estudiante->id}");

  

  //Filtro
  $filtro     = new Filtro('listaposiblestutores',__FILE__);
  $usuario    = new Usuario();
  $usuario->iniciarFiltro($filtro);
  $filtro_sql = $usuario->filtrar($filtro);
  if ($usuariost_id)
    $filtro_sql = $usuariost_id . $filtro_sql;

  $o_string   = $usuario->getOrderString($filtro);
  $usuario->puede_ser_tutor = Usuario::PROFECIONAL;
  $obj_mysql  = $usuario->getAll('',$o_string,$filtro_sql,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'listaposiblestutores','',false);

  $semestre                = new Semestre(' ',1);
  $maximo_tutorias_activas = $semestre->getValor('M&aacute;ximo Tutor&iacute;as Activas', 5);
  $smarty->assign("max_tutorias"    ,$maximo_tutorias_activas);

  
  $tutor                     = new Tutor();
  $smarty->assign("tutor"    ,$tutor);
  $smarty->assign("filtros"  ,$filtro);
  $smarty->assign("objs"     ,$objs_pg->objs);
  $smarty->assign("pages"    ,$objs_pg->p_pages);

  
  

  
  //No hay ERROR
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO)) {
    $ir = "tutor.gestion.php?estudiante_id=$estudiante_id";
    $_SESSION['se_asigno_correctamente'] = $se_asigno_correctamente;
    $_SESSION['nuevotutor'] = $nuevotutor->getNombreCompleto();
    $_SESSION['estado'] = 1;
    header("Location: $ir");  
  }
  $smarty->assign("ERROR",$ERROR);


  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
  $smarty->assign("URL",URL); 
  $smarty->assign("cerrar",'../tutor/');
  
} 
catch(Exception $e) 
{
  mysql_query("ROLLBACK");
  $smarty->assign("ERROR", handleError($e));
}

if (isset($_GET['tlista']) && $_GET['tlista']) //recargamos la tabla central
  $smarty->display('admin/listas.lista.tpl'); 
else
  $smarty->display('admin/full-width.tpl');
?>