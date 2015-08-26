<?php
try {
  define ("MODULO", "ADMIN-DOCENTE");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title', 'Registro de Docentes');
  $smarty->assign('description', 'P&aacute;gina de Registro de Docente');
  $smarty->assign('keywords', 'Registro,Docentes');
  
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['docente_id']) && is_numeric($_GET['docente_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['docente_id'];
  }
  /**
   * Menu superior
   */
  $menuList[] = array('url' => URL . Administrador::URL, 'name' => 'Administraci&oacute;n');
  $menuList[] = array('url' => URL . Administrador::URL . 'docente/', 'name' => ' Docentes');
  if($editar == TRUE){
  $menuList[]     = array('url'=>URL . Administrador::URL . 'docente/docente.gestion.php','name'=>'Gesti&oacute;n de Docente');
  $menuList[] = array('url' => URL . Administrador::URL . 'docente/docente.registro.php?docente_id='.$id, 'name' => 'Edicion de Docente');
  }else{
      $menuList[] = array('url' => URL . Administrador::URL . 'docente/'. basename(__FILE__) , 'name' => 'Registro de Docente');
  }
  $smarty->assign("menuList", $menuList);

  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');


  $smarty->assign("ERROR", '');





  leerClase('Semestre');
  $semestre = new Semestre();
  $semestre->getActivo();
  $semestrecod = $semestre->id;



  //CREAR UN DOCENTE
  leerClase('Docente');
  leerClase('Usuario');
  leerClase('Grupo');


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

  $docente = new Docente($id);
  $usuario    = new Usuario($docente->usuario_id);
  
  if (!$editar)
    $columnacentro = 'admin/docente/columna.centro.registro-docente.tpl';
  else
    $columnacentro = 'admin/docente/columna.centro.docente-registro-editar.tpl';
  $smarty->assign('columnacentro',$columnacentro);


  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token']) {


    $EXITO = false;
    $stado=0;
    mysql_query("BEGIN");
    $usuario->objBuidFromPost();
    $usuario->estado           = Objectbase::STATUS_AC;
    $usuario->puede_ser_tutor  = 1;
    $es_nuevo                  = (!isset($_POST['usuario_id']) || trim($_POST['usuario_id']) == '' ) ? TRUE : FALSE;
    $usuario->validar($es_nuevo);
    $usuario->save();

    $usuario->asignarGrupo(Grupo::GR_DO);

    $docente->objBuidFromPost();
    $docente->estado     = Objectbase::STATUS_AC;
    $docente->usuario_id = $usuario->id;
    $docente->configuracion_area=0;
    $docente->configuracion_horario=0;
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
    $stado=1;
    mysql_query("COMMIT");
  }


 

  $smarty->assign("docente", $docente);

  $smarty->assign("usuario", $usuario);
  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  //$moderador=0;
  if(isset($stado))
  {
  if($stado==1){
       $_SESSION['estado']=$stado;
          header("Location: docente.gestion.php");
          

  }  else {
          $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente el Docente','titulo'=>'Registro de Docente' ,'icono'=> 'warning_48.png');
          $ERROR = $html->getMessageBox ($mensaje);
  }
  }
     
  
  $smarty->assign("ERROR",$ERROR);

} catch (Exception $e) {
 mysql_query("ROLLBACK");
 $smarty->assign("ERROR", handleError($e));
}

$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);


$TEMPLATE_TOSHOW = 'admin/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>