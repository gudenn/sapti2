<?php
try {
    define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: login.php");


  /** HEADER */
  $smarty->assign('title','Proyecto Final - Detalle de Avance ');
  $smarty->assign('description','Detalle de avance en Proyecto Final');
  $smarty->assign('keywords','Proyecto Final,detalle,avance');

  //CSS
  $CSS[]  = URL_JS . "ui/overcast/jquery-ui.css";
  //$CSS[]  = URL_JS . "jQfu/css/demo.css";
  $CSS[]  = URL_JS . "jQfu/css/jquery.fileupload-ui.css";
  $CSS[]  = URL_CSS . "academic/3_column.css";
  //BOX
  $CSS[]  = URL_JS . "box/box.css";
  
  $smarty->assign('CSS',$CSS);

  
  //FileUpload
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "ui/jquery-ui.min.js";

  //CK Editor
  $JS[]  = URL_JS . "ckeditor/ckeditor.js";
  //BOX
  $JS[]  = URL_JS ."box/jquery.box.js";
  $smarty->assign('JS',$JS);

  // Escritorio del estuddinate
  leerClase('Usuario');
  leerClase('Proyecto');
  leerClase('Estudiante');
  leerClase('Avance');

  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Estudiante::URL,'name'=>'Estudiante');
  $menuList[]     = array('url'=>URL.Estudiante::URL.Proyecto::URL,'name'=>'Proyecto Final');
  $menuList[]     = array('url'=>URL.Estudiante::URL.Proyecto::URL.basename(__FILE__),'name'=>'Detalle de Avance');
  $smarty->assign("menuList", $menuList);

  
  $estudiante     = new Estudiante(1);
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();
  $id             = (isset($_GET['avance_id']) && is_numeric($_GET['avance_id']))?$_GET['avance_id']:'';
  $avance         = new Avance(2);
  $avance->asignarDirectorio();

  $smarty->assign("estudiante", $estudiante);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("proyecto", $proyecto);
  $smarty->assign("avance", $avance);
  $smarty->assign("ERROR", $ERROR);
  


  //No hay ERROR
  $ERROR = ''; 
  $smarty->assign("ERROR",$ERROR);
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'docente/revision/full-width.avance.detalle.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>