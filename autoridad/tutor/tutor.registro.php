<?php
try {
  define ("MODULO", "ADMIN-TUTOR");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  
  
  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');
  /**
   * Menu superior
   */
  $id     = '';
  $editar = FALSE;
  if (isset($_GET['tutor_id']) && is_numeric($_GET['tutor_id']) )
  {
    $editar = TRUE;
    $id = $_GET['tutor_id'];
  }
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'tutor/','name'=>'Tutor');
  if($editar == TRUE){
  $menuList[]     = array('url'=>URL . Administrador::URL . 'tutor/tutor.gestion.php','name'=>'Gesti&oacute;n de Tutor');
  $menuList[] = array('url' => URL . Administrador::URL . 'tutor/tutor.registro.php?tutor_id='.$id, 'name' => 'Edicion de Tutor');
  }else{
      $menuList[] = array('url' => URL . Administrador::URL . 'tutor/'. basename(__FILE__) , 'name' => 'Registro de Tutor');
  }
  $smarty->assign("menuList", $menuList);

  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');



  $smarty->assign("ERROR", '');

  $smarty->assign('columnacentro','admin/tutor/columna.centro.registro.tpl');

  //CREAR UN TUTOR
  leerClase('Tutor');
  leerClase('Usuario');
  leerClase('Estudiante');

  
  //Sexo del usuario
  $smarty->assign('sexo', array(
      Usuario::FEMENINO  => 'Femenino',
      Usuario::MASCULINO => 'Masculino'));
  $smarty->assign('sexo_selected', ($usuario->sexo==Usuario::FEMENINO)?Usuario::FEMENINO:Usuario::MASCULINO);

  if (isset($_GET['estudiante_id']) && is_numeric($_GET['estudiante_id']))
  {
     $estudiante = new Estudiante($_GET['estudiante_id']);
     $smarty->assign("estudiante",$estudiante);
  }
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

  $tutor   = new Tutor($id);
  $usuario = new Usuario($tutor->usuario_id);

  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    $EXITO = false;
    $stado=0;
    mysql_query("BEGIN");
    

    
    $usuario = new Usuario();
    $usuario->objBuidFromPost();
    $usuario->puede_ser_tutor = Usuario::PROFECIONAL;
    $usuario->estado = Objectbase::STATUS_AC;
    $es_nuevo                  = (!isset($_POST['usuario_id']) || trim($_POST['usuario_id']) == '' ) ? TRUE : FALSE;
    $usuario->validar($es_nuevo);
    $usuario->save();
    
    //usuario pertenece a un grupo
    $usuario->asignarGrupo(Grupo::GR_TU);
    
    $tutor= new Tutor();
    $tutor->objBuidFromPost();
    $tutor->usuario_id = $usuario->id;
    $tutor->estado     = Objectbase::STATUS_AC;
    $tutor->save();
    
    if (isset($_POST['estudiante_id']) && is_numeric($_POST['estudiante_id']) )
    {
      // Primero quitamos al tutor anterior
      if ( isset($_GET['cambiartutor_id']) && is_numeric($_GET['cambiartutor_id']) )
      {
        $tutoantiguo = new Tutor($_GET['cambiartutor_id']);
        $tutoantiguo->finalizarTutoria($estudiante->id);
      }
      $tutor->asignarTutoria ($_POST['estudiante_id']);
      
    }
    

    $EXITO = TRUE;
    $stado=1;
    mysql_query("COMMIT");
  }
  
  $smarty->assign('usuario',$usuario);
  $smarty->assign('tutor',$tutor);

  
  $token = sha1(URL . time());
  $_SESSION['register'] = $token;
  $smarty->assign('token',$token);
  
  
  

 //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  //$moderador=0;
  if(isset($stado))
  {
  if($stado==1){
       $_SESSION['estado']=$stado;
       //   header("Location: tutor.gestion.php");
          

  }  else {
          $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente el Tutor','titulo'=>'Registro de Tutor' ,'icono'=> 'warning_48.png');
          $ERROR = $html->getMessageBox ($mensaje);
  }
  }
     
  
  $smarty->assign("ERROR",$ERROR);

  
} 
catch(Exception $e) 
{
  mysql_query("ROLLBACK");
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'admin/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>