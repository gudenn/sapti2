<?php
try {
  define ("MODULO", "ADMIN-ESTUDIANTE");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','SAPTI - Registro Estudiantes');
  $smarty->assign('description','Formulario de registro de estudiantes');
  $smarty->assign('keywords','SAPTI,Estudiantes,Registro');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'estudiante/','name'=>' Estudiantes');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'estudiante/'.basename(__FILE__),'name'=>'Registro de estudiante');
  $smarty->assign("menuList", $menuList);

  
  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');


  $smarty->assign("ERROR", '');


  //CREAR UN ESTUDIANTE
  leerClase('Grupo');
  leerClase('Usuario');
  leerClase('Estudiante');
  leerClase('Proyecto');
  leerClase('Materia');
  leerClase('Proyecto_dicta');
  leerClase('Proyecto_estudiante');

  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['estudiante_id']) && is_numeric($_GET['estudiante_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['estudiante_id'];
  }

  $estudiante = new Estudiante($id);
  $usuario    = new Usuario($estudiante->usuario_id);
  
  $smarty->assign("usuario"   , $usuario);
  $smarty->assign("estudiante", $estudiante);
  
  //Asignar Semestre al estudiante
  leerClase('Semestre');
  $semestre     = new Semestre();
  $semestres    = $semestre->getAll();
  $semestre_values[] = '';
  $semestre_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($semestres[0])) 
  {
    $semestre_values[] = $row['id'];
    $semestre_output[] = $row['codigo'];
    if ($row['activo'])
      $semestre_selected = $row['id'];
  }
  $smarty->assign("semestre_values", $semestre_values);
  $smarty->assign("semestre_output", $semestre_output);
  $smarty->assign("semestre_selected", $semestre_selected); 
  
  //Asignar Materia al estudiante
  leerClase('Materia');
  $materia     = new Materia();
  $materias    = $materia->getAll();
  $materia_values[] = '';
  $materia_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($materias[0])) 
  {
    $materia_values[] = $row['id'];
    $materia_output[] = $row['nombre'];
  }
  $smarty->assign("materia_values", $materia_values);
  $smarty->assign("materia_output", $materia_output);
  $smarty->assign("materia_selected", "");  
  
  //Sexo del usuario
  $smarty->assign('sexo', array(
      Usuario::FEMENINO  => 'Femenino',
      Usuario::MASCULINO => 'Masculino'));
  $smarty->assign('sexo_selected', ($usuario->sexo==Usuario::FEMENINO)?Usuario::FEMENINO:Usuario::MASCULINO);
  
   
  //Asignar titulo al usuario
  leerClase('Titulo_honorifico');
  $titulo_h     = new Titulo_honorifico();
  $titulo_hs    = $titulo_h->getAll();
  $titulo_h_values[] = '';
  $titulo_h_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($titulo_hs[0])) 
  {
    $titulo_h_values[] = $row['nombre'];
    $titulo_h_output[] = $row['nombre'];
  }
  $smarty->assign("titulo_h_values", $titulo_h_values);
  $smarty->assign("titulo_h_output", $titulo_h_output);
  
  if (!$editar)
    $columnacentro = 'admin/estudiante/columna.centro.estudiante-registro.tpl';
  else
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
    $usuario->asignarGrupo(Grupo::GR_ES);
    

    $estudiante->estado     = Objectbase::STATUS_AC;
    $estudiante->usuario_id = $usuario->id;
    $estudiante->validar($es_nuevo);
    $estudiante->save();
    
    if ( isset($_POST['dicta_id']) && isset($_POST['semestre_id']) && is_numeric($_POST['dicta_id']) && is_numeric($_POST['semestre_id']) ) {
      $materia = new Materia($_POST['materia_id']);
      $estudiante->crearProyectoInicial($_POST['dicta_id'], $materia->tipo);
      $estudiante->inscribirEstudianteDicta($_POST['semestre_id'], $_POST['dicta_id']);
      
    }
    
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
      $mensaje = array('mensaje'=>'Se grabo correctamente el Estudiante','titulo'=>'Registro de Estudiante' ,'icono'=> 'tick_48.png');
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

$TEMPLATE_TOSHOW = 'admin/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>