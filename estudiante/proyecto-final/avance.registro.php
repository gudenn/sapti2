<?php
try {
  define ("MODULO", "ESTUDIANTE-PROYECTO-AVANCE-REGISTRO");
  require('../_start.php');
  if(!isEstudianteSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Proyecto Final - Registro Avances');
  $smarty->assign('description','Registro de avance en Proyecto Final');
  $smarty->assign('keywords','Proyecto Final,registro,avance');

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  
  //FileUpload
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "ui/jquery-ui.min.js";
  $CSS[]  = URL_JS . "ui/overcast/jquery-ui.css";
  //$CSS[]  = URL_JS . "jQfu/css/demo.css";
  $CSS[]  = URL_JS . "jQfu/css/jquery.fileupload-ui.css";

  //CK Editor
  $JS[]  = URL_JS . "ckeditor/ckeditor.js";
  //BOX
  $CSS[]  = URL_JS . "box/box.css";
  $JS[]  = URL_JS ."box/jquery.box.js";
  $smarty->assign('JS',$JS);
  $smarty->assign('CSS',$CSS);

  // Escritorio del estuddinate
  leerClase('Usuario');
  leerClase('Proyecto');
  leerClase('Revision');
  leerClase('Estudiante');
  leerClase('Avance');

  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Estudiante::URL,'name'=>'Estudiante');
  $menuList[]     = array('url'=>URL.Estudiante::URL.Proyecto::URL,'name'=>'Proyecto Final');
  $menuList[]     = array('url'=>URL.Estudiante::URL.Proyecto::URL.basename(__FILE__),'name'=>'Registro de Avance');
  $smarty->assign("menuList", $menuList);
  $editores = '';
          
          
          
  if ( isset($_GET['revision_id']) && is_numeric($_GET['revision_id']) )
  {
    $revision = new Revision($_GET['revision_id']);
    $revision->getAllObjects();
    $smarty->assign("revision", $revision);
    
    
    $editores = ",
                {toolbar: [ 
                  [ 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink' ],
                  [ 'FontSize', 'TextColor', 'BGColor' ]]}";
    
  }
  $smarty->assign("editores", $editores);
  
  $estudiante_aux = getSessionEstudiante();
  $estudiante     = new Estudiante($estudiante_aux->estudiante_id);
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();
  $id             = (isset($_GET['avance_id']) && is_numeric($_GET['avance_id']))?$_GET['avance_id']:'';
  $avance         = new Avance($id);
  $avance->asignarDirectorio();

  if ( isset($_POST['tarea']) && $_POST['tarea'] == 'registrar_avance' && isset($_SESSION['registrar_avance']) && isset($_POST['token']) && $_SESSION['registrar_avance'] == $_POST['token']  )
  {
    $EXITO = false;
    if ($proyecto->id)
      $avance = $estudiante->grabarAvance();
    $EXITO = true;
  }

  
  $smarty->assign("estudiante", $estudiante);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("proyecto", $proyecto);
  $smarty->assign("avance", $avance);
  $smarty->assign("ERROR", $ERROR);
  


  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje'=>'Se grabo correctamente el Avance','titulo'=>'Registro de Avance' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente el Avance','titulo'=>'Registro de Avance' ,'icono'=> 'warning_48.png');
   $ERROR = $html->getMessageBox ($mensaje);
  }
  $smarty->assign("ERROR",$ERROR);
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$token                = sha1(URL . time());
$_SESSION['registrar_avance'] = $token;
$smarty->assign('token',$token);

$TEMPLATE_TOSHOW = 'estudiante/full-width.avance.registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>