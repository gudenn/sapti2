<?php
try {
  define ("MODULO", "ESTUDIANTE");
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
  $JS[]   = URL_JS . "jquery.min.js";
  $JS[]   = URL_JS . "ui/jquery-ui.min.js";
  $CSS[]  = URL_JS . "ui/overcast/jquery-ui.css";
  $CSS[]  = URL_JS . "jQfu/css/jquery.fileupload-ui.css";

  //CK Editor
  $JS[]  = URL_JS . "ckeditor/ckeditor.js";
  //BOX
  $CSS[]  = URL_JS . "box/box.css";
  $JS[]   = URL_JS . "box/jquery.box.js";
  $smarty->assign('JS',$JS);
  $smarty->assign('CSS',$CSS);

  // Escritorio del estuddinate
  leerClase('Usuario');
  leerClase('Proyecto');
  leerClase('Revision');
  leerClase('Estudiante');
  leerClase('Avance');
  $tipo='AV';
  if ( isset($_GET['revision_id']) && is_numeric($_GET['revision_id']) )
  {
    $revision = new Revision($_GET['revision_id']);
    $revision->getAllObjects();
    $smarty->assign("revision", $revision);
    $_GET['avance_id'] = $revision->avance_id;
    $tipo='CO';
    $editores = ",
                {toolbar: [ 
                  [ 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink' ],
                  [ 'FontSize', 'TextColor', 'BGColor' ]]}";
    
  }
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Estudiante::URL,'name'=>'Estudiante');
  $menuList[]     = array('url'=>URL.Estudiante::URL.Proyecto::URL,'name'=>'Proyecto Final');
$menuList[]     = array('url'=>URL.Estudiante::URL.Proyecto::URL.basename(__FILE__).'revision_id='.$_GET['revision_id'],'name'=>'Registro de Avance');
  $smarty->assign("menuList", $menuList);
  $editores = '';
  $smarty->assign("editores", $editores);
  
  $estudiante     = getSessionEstudiante();
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();
  $proyecto->getAllObjects();
  $id             = (isset($_GET['avance_id']) && is_numeric($_GET['avance_id']))?$_GET['avance_id']:'';
  $avance         = new Avance($id);
  $avance->getAllObjects();
  $avance_escpecifico= $avance->avance_objetivo_especifico_objs;
  $avance->asignarDirectorio();
  if ( isset($_POST['tarea']) && $_POST['tarea'] == 'registrar_avance' && isset($_SESSION['registrar_avance']) && isset($_POST['token']) && $_SESSION['registrar_avance'] == $_POST['token'] ){
    $EXITO = false;
    if ($proyecto->id){
      $avance = $estudiante->grabarAvance($avance_escpecifico,$tipo);
    }
      $_SESSION['estado'] = true;
      header("Location: avance.gestion.php");
      $EXITO = true;
  }
  //porcentaje de avance
  $avances = $proyecto->avance_objs;
  if (count($avances)==0) {
   
    $porcentaje = 0;
  } else {
    $ultimoreg = array_pop($avances);
    $porcentaje = $ultimoreg->porcentaje;
  }
  //porcentaje de avance por objetivos especificos
  $ulti_ava = new Avance($ultimoreg->id);
  $ulti_ava->getAllObjects();
  $ultim_obj = $ulti_ava->avance_objetivo_especifico_objs;
 
 
 
  $smarty->assign("estudiante", $estudiante);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("proyecto", $proyecto);
  $smarty->assign("avance", $avance);
  $smarty->assign("porcentaje", $porcentaje);
  $smarty->assign("ultim_obj", $ultim_obj);
  $smarty->assign("avance_escpecifico", $avance_escpecifico);
  $smarty->assign("ERROR", $ERROR);
  


  //No hay ERROR
  $ERROR = ''; 
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