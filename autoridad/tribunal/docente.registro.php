<?php
try {
  define ("MODULO", "ADMIN-DOCENTE");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title', 'Registro de Tribunal');
  $smarty->assign('description', 'P&aacute;gina de Registro de Tribunal');
  $smarty->assign('keywords', 'Registro,Tribunal');
  /**
   * Menu superior
   */
  $id     = '';
  $editar = FALSE;
  if ( isset($_GET['docente_id']) && is_numeric($_GET['docente_id']) )
  {
    $editar = TRUE;
    $id     = $_GET['docente_id'];
  }
  
  $menuList[] = array('url' => URL . Administrador::URL, 'name' => 'Administraci&oacute;n');
  $menuList[] = array('url' => URL . Administrador::URL . 'tribunal/', 'name' => ' Tribunal');
  if($editar == TRUE){
  $menuList[]     = array('url'=>URL . Administrador::URL . 'tribunal/docente.gestion.php','name'=>'Gesti&oacute;n de Tribunal');
  $menuList[] = array('url' => URL . Administrador::URL . 'tribunal/docente.registro.php?docente_id='.$id, 'name' => 'Edicion de Tribunal Externo');
  }else{
      $menuList[] = array('url' => URL . Administrador::URL . 'tribunal/'. basename(__FILE__) , 'name' => 'Registro de Tribunal Externo');
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
    $columnacentro = 'admin/tribunal/columna.centro.registro-docente.tpl';
  else
    $columnacentro = 'admin/tribunal/columna.centro.docente-registro-editar.tpl';
  $smarty->assign('columnacentro',$columnacentro);

  $smarty->assign("docente", $docente);

  $smarty->assign("usuario", $usuario);
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token']) {


    $EXITO = false;
    $stado=0;
    mysql_query("BEGIN");
    $usuario->objBuidFromPost();
    $usuario->estado           = Objectbase::STATUS_AC;
    $usuario->puede_ser_tutor  = 0;
    $es_nuevo                  = (!isset($_POST['usuario_id']) || trim($_POST['usuario_id']) == '' ) ? TRUE : FALSE;
    $usuario->validar($es_nuevo);
    $usuario->tribunal=  Usuario::TRIBUNAL;
    $usuario->save();

    $usuario->asignarGrupo(Grupo::GR_DO);
    $usuario->asignarGrupo(Grupo::GR_TR);

    $docente->objBuidFromPost();
    $docente->estado     = Objectbase::STATUS_AC;
    $docente->usuario_id = $usuario->id;
    $docente->configuracion_area=0;
    $docente->configuracion_horario=0;
    $es_nuevo                  = (!isset($_POST['usuario_id']) || trim($_POST['usuario_id']) == '' ) ? TRUE : FALSE;
    //$usuario->validar($es_nuevo);
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
          $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente el Tribunal','titulo'=>'Registro de Tribunal' ,'icono'=> 'warning_48.png');
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