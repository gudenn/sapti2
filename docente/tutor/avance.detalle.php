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
  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  //BOX
  $CSS[]  = URL_JS . "box/box.css";
  $CSS[]  = URL_JS . "ventanasmodales/simplemodaldetalle.css";
  $smarty->assign('CSS',$CSS);

  
  //FileUpload
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "ui/jquery-ui.min.js";

  //CK Editor
  $JS[]  = URL_JS . "ckeditor/ckeditor.js";
  //BOX
  $JS[]  = URL_JS ."box/jquery.box.js";
    //Datepicker UI
  $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
    //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";
  $JS[]  = URL_JS . "jquery.addfield.js";
  $JS[]  = URL_JS . "ventanasmodales/jquery.simplemodal-1.4.4.js";
  $smarty->assign('JS',$JS);

  // Escritorio del estuddinate
  leerClase('Usuario');
  leerClase('Proyecto');
  leerClase('Estudiante');
  leerClase('Avance');
  leerClase('Revision');
  leerClase('Observacion');
  leerClase('Docente');

  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Estudiante::URL,'name'=>'Estudiante');
  $menuList[]     = array('url'=>URL.Estudiante::URL.Proyecto::URL,'name'=>'Proyecto Final');
  $menuList[]     = array('url'=>URL.Estudiante::URL.Proyecto::URL.basename(__FILE__),'name'=>'Detalle de Avance');
  $smarty->assign("menuList", $menuList);

  if(isset($_GET['estudiante_id']) && is_numeric($_GET['estudiante_id']))
      $estuid=$_GET['estudiante_id'];
  $estudiante     = new Estudiante($estuid);
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();
  $id             = (isset($_GET['avance_id']) && is_numeric($_GET['avance_id']))?$_GET['avance_id']:'';
  $avance         = new Avance($id);
  $avance->asignarDirectorio();
  $avance->cambiarEstadoVisto();
  $resul = "
       SELECT *
FROM observacion ov
WHERE ov.revision_id='".$avance->revision_id."'
";
   $sql = mysql_query($resul);
while ($fila1 = mysql_fetch_array($sql, MYSQL_ASSOC)) {
   $obser[]=$fila1;
 }
    $obsertabla='no';
  if(mysql_num_rows($sql)>0){
      $obsertabla='si';
      $revision1=new Revision($avance->revision_id);
  }
    $observacion1=new Observacion();
  
    $docente = getSessionDocente();
    if (isset($_POST['observaciones'])) 
    $observaciones=$_POST['observaciones'];
    $revision->fecha_revision=date("d/m/Y");

    if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    $observacion = new Observacion();
    $revision = new Revision();
    $revision->crearRevisionDocente($docente->usuario_id, $proyecto->id);
    $revision->objBuidFromPost();
    $revision->save();
    
    foreach ($observaciones as $obser_array){
    $observacion->objBuidFromPost();
    $observacion->crearObservacion($obser_array, $revision->id);
    }
    $avance->cambiarEstadoCorregido();
    $ir = "Location: ../tutor/revision.corregido.lista.php?id_estudiante=".$estudiante->id."";
        header($ir);
    }
    
        if (isset($_POST['tarea']) && $_POST['tarea'] == 'aprobar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
           if (isset($_POST['seleccion'])) 
           $seleccion=$_POST['seleccion'];
           if(count($seleccion)>0){
           foreach ($seleccion as $obs){
           $obsapro = new Observacion($obs);
           $obsapro->cambiarEstadoAprobado();
            }
           $revision1->fechaAprobacion();
           $desaprobados=$revision1->listaDesaprobados();
           if(count($desaprobados)>0){
           $revisionnuevo = new Revision();
           $revisionnuevo->crearRevisionDocente($docente->usuario_id, $proyecto->id);
           $revisionnuevo->save();
           foreach ($desaprobados as $des) {
               $obsermodes=new Observacion($des);
               $obsermodes->objBuidFromPost();
               $obsermo = new Observacion();
               $obsermo->objBuidFromPost();
               $obsermo->crearObservacion($obsermodes->observacion, $revisionnuevo->id);
               $obsermodes->save();
               $obsermo->save();
               $obsermodes->cambiarEstadoRechazado();
           }  
           }
           $avance->cambiarEstadoCorregido();   
           $ir = "Location: ../revision/observacion.editar.revision.php?revisiones_id=".$revisionnuevo->id."";
           header($ir);
           }  else {
           $revision1->fechaAprobacion();
           $desaprobados=$revision1->listaObservaciones();
           if(count($desaprobados)>0){
           $revisionnuevo = new Revision();
           $revisionnuevo->crearRevisionDocente($docente->usuario_id, $proyecto->id);
           $revisionnuevo->save();
           foreach ($desaprobados as $des) {
               $obsermodes=new Observacion($des);
               $obsermodes->objBuidFromPost();
               $obsermo = new Observacion();
               $obsermo->objBuidFromPost();
               $obsermo->crearObservacion($obsermodes->observacion, $revisionnuevo->id);
               $obsermodes->save();
               $obsermo->save();
               $obsermodes->cambiarEstadoRechazado();
           }}
           $avance->cambiarEstadoCorregido();   
           $ir = "Location: ../revision/observacion.editar.revision.php?revisiones_id=".$revisionnuevo->id."";
           header($ir);
           }
     }

  $smarty->assign("revision", $revision);
  $smarty->assign("obsertabla", $obsertabla);
  $smarty->assign("observacion1", $observacion1);
  $smarty->assign("obser", $obser);
  $smarty->assign("estudiante", $estudiante);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("proyecto", $proyecto);
  $smarty->assign("avance", $avance);
  $smarty->assign("ERROR", $ERROR);
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $token = sha1(URL . time());
  $_SESSION['register'] = $token;
  $smarty->assign('token',$token);
  
$TEMPLATE_TOSHOW = 'docente/tutor/full-width.avance.detalle.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>