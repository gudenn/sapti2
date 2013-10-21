<?php
try {
  define ("MODULO", "ADMIN-DOCENTE");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title', 'Registro de Docentes');
  $smarty->assign('description', 'Pagina de Registro de Docente');
  $smarty->assign('keywords', 'Registro,Docentes');
  /**
   * Menu superior
   */
  $menuList[] = array('url' => URL . Administrador::URL, 'name' => 'Administraci&oacute;n');
  $menuList[] = array('url' => URL . Administrador::URL . 'docente/', 'name' => ' Docentes');
  $menuList[] = array('url' => URL . Administrador::URL . 'docente/' . basename(__FILE__), 'name' => 'Registro de Docente');
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





  leerClase('Semestre');
  $semestre = new Semestre();
  $semestre->getActivo();
  $semestrecod = $semestre->id;



  //CREAR UN DOCENTE
  leerClase('Docente');
  leerClase('Usuario');


  //Sexo del usuario
  $smarty->assign('sexo', array(
      Usuario::FEMENINO => 'Femenino',
      Usuario::MASCULINO => 'Masculino'));
  $smarty->assign('sexo_selected', ($usuario->sexo == Usuario::FEMENINO) ? Usuario::FEMENINO : Usuario::MASCULINO);
  //Asignar titulo al usuario
  leerClase('Titulo_honorifico');
  $titulo_h = new Titulo_honorifico();
  $titulo_hs = $titulo_h->getAll();
  $titulo_h_values[] = '';
  $titulo_h_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($titulo_hs[0])) {
    $titulo_h_values[] = $row['nombre'];
    $titulo_h_output[] = $row['nombre'];
  }
  $smarty->assign("titulo_h_values", $titulo_h_values);
  $smarty->assign("titulo_h_output", $titulo_h_output);

  $editar = FALSE;
  
  if (isset($_GET['docente_id']) && is_numeric($_GET['docente_id'])){
       $editar = TRUE;
    $id = $_GET['docente_id'];
    
    
  }
  $docente = new Docente($id);
  $docente->usuario_id;
  $usuario = new Usuario($docente->usuario_id);



  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token']) {


    $EXITO = false;
    mysql_query("BEGIN");
    $usuario->objBuidFromPost();
    $usuario->estado           = Objectbase::STATUS_AC;
    $usuario->puede_ser_tutor  = 1;
    $es_nuevo                  = (!isset($_POST['usuario_id']) || trim($_POST['usuario_id']) == '' ) ? TRUE : FALSE;
    $usuario->validar($es_nuevo);
    $usuario->save();

    leerClase('Grupo');
    $usuario->asignarGrupo(Grupo::GR_DO);

    $docente->objBuidFromPost();
    $docente->estado     = Objectbase::STATUS_AC;
    $docente->usuario_id = $usuario->id;
    $docente->save();

    //tambien creamos su usuario docente
    $usuario->getAllObjects();
    if ( !isset($usuario->tutor_objs) || !isset($usuario->tutor_objs[0]) )
    {
      leerClase('Tutor');
      $tutor = new Tutor();
      $tutor->estado     = Objectbase::STATUS_AC;
      $tutor->usuario_id = $usuario->id;
      $tutor->save();
    }
            
    $EXITO = TRUE;
    mysql_query("COMMIT");
  }


 if (!$editar)
    $columnacentro = 'admin/docente/columna.centro.registro-docente.tpl';
  else
    $columnacentro = 'admin/docente/columna.centro.docente-registro-editar.tpl';
  $smarty->assign('columnacentro',$columnacentro);

  $smarty->assign("docente", $docente);

  $smarty->assign("usuario", $usuario);
  //No hay ERROR
  $ERROR = '';
  leerClase('Html');
  $html = new Html();
  if (isset($EXITO)) {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje' => 'Se grabo correctamente el Docente', 'titulo' => 'Registro de Docente', 'icono' => 'tick_48.png');
    else
      $mensaje = array('mensaje' => 'Hubo un problema, No se grabo correctamente el docente', 'titulo' => 'Registro de Docente', 'icono' => 'warning_48.png');
    $ERROR = $html->getMessageBox($mensaje);
  }
  $smarty->assign("ERROR", $ERROR);
} catch (Exception $e) {
  $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'admin/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>