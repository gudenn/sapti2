<?php
try {
    define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php");


  /** HEADER */
  $smarty->assign('title','Detalle de Avance');
  $smarty->assign('description','Detalle de avance del Proyecto');
  $smarty->assign('keywords','Proyecto Final,detalle,avance,perfil');

  //CSS
  $CSS[]  = URL_JS . "ui/overcast/jquery-ui.css";
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
  leerClase('Dicta');
   leerClase('Tribunal');

    if( isset($_GET['estudiente_id']) && is_numeric($_GET['estudiente_id']) ){
       $estuid=$_GET['estudiente_id'];
  }  else {
      header("Location: ../index.php");
  }
    if( isset($_GET['avance_id']) && is_numeric($_GET['avance_id']) ){
       $id=$_GET['avance_id'];
  }  else {
      header("Location: ../index.php");
  }
  date_default_timezone_set('America/La_Paz');
  $usuarioss= getSessionUser();
 // $docente= getSessionDocente();
   $estudiante     = new Estudiante($estuid);
   $proyecto       = $estudiante->getProyecto();
   
  $usuario        = $estudiante->getUsuario();
 
  $tribunalacitivo=   $proyecto->getTribunal($docente->id);
  $tribunalacitivo->id;

     /**
   * Menu superior
   */
    $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
    $menuList[]     = array('url'=>URL.Docente::URL.'tribunal','name'=>'Tribunal');
    if($proyecto->tipo_proyecto==Proyecto::TIPO_PERFIL){
    $menuList[]     = array('url'=>URL.Docente::URL.'tribunal/perfil.seguimiento.lista.php','name'=>'Lista Estudiantes de Perfil');
    }else {
    $menuList[]     = array('url'=>URL.Docente::URL.'tribunal/seguimiento.lista.php','name'=>'Lista Estudiantes de Proyecto');
    }
    $menuList[]     = array('url'=>URL.Docente::URL.'tribunal/revision.lista.php?id_estudiante='.$estuid,'name'=>'Seguimiento Estudiante');
    $menuList[]     = array('url'=>URL.Docente::URL.'tribunal/avance.detalle.php?avance_id='.$id.'&estudiente_id='.$estuid,'name'=>'Detalle de Avance');
    $smarty->assign("menuList", $menuList); $smarty->assign("menuList", $menuList);
  
  $rev1=new Revision();
  $avance         = new Avance($id);
  $avance->asignarDirectorio();
  $avance->cambiarEstadoVisto();

    $resulrev = "SELECT re.id
FROM avance av, revision re
WHERE re.avance_id=av.id
AND av.id='".$avance->id."'
AND re.revisor_tipo='TR'
AND re.revisor='".$tribunalacitivo->docente_id."'
AND re.estado_revision='".$rev1::E3_RESPONDIDO."'
";
   $sqlrev = mysql_query($resulrev);
while ($fila1rev = mysql_fetch_array($sqlrev, MYSQL_ASSOC)) {
   $obserrev=$fila1rev['id'];
 }
 
  $resul = "
       SELECT *
FROM observacion ov
WHERE ov.revision_id='".$obserrev."'
";
   $sql = mysql_query($resul);
while ($fila1 = mysql_fetch_array($sql, MYSQL_ASSOC)) {
   $obser[]=$fila1;
 }
    $obsertabla='no';
  if(mysql_num_rows($sql)>0){
      $obsertabla='si';
      $revision1=new Revision($obserrev);
  }
    $observacion1=new Observacion();

    if (isset($_POST['observaciones'])) 
    $observaciones=$_POST['observaciones'];
    $revision->fecha_revision=date("d/m/Y");
    $avance->cambiarEstadoVisto();

    if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    $observacion = new Observacion();
    $revision = new Revision();
    $revision->crearRevisionDocente($tribunalacitivo->id, $proyecto->id, 'TR');
    $revision->objBuidFromPost();
    $revision->avance_id=$avance->id;
    $revision->save();
    
    foreach ($observaciones as $obser_array){
    $observacion->objBuidFromPost();
    $observacion->crearObservacion($obser_array, $revision->id);
    }
    $avance->cambiarEstadoCorregido();
    $revision->notificacionRevision($estudiante->id, $proyecto->id, $usuarioss->getNombreCompleto());
    $ir = "Location: revision.lista.php?id_estudiante=".$estuid;
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
           $revisionnuevo->crearRevisionDocente($tribunalacitivo->docente_id, $proyecto->id, 'TR');
           $revisionnuevo->avance_id=$avance->id;
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
           $revision1->estadoAprobado();
           $avance->cambiarEstadoCorregido();
           $revision1->notificacionRevision($estudiante->id, $proyecto->id, $usuarioss->getNombreCompleto());
           $ir = "Location:observacion.editar.revision.php?iddicta=".$iddicta."&revisiones_id=".$revisionnuevo->id."";
           header($ir);
           }else {
                   $revision1->estadoAprobado();
                   $avance->cambiarEstadoCorregido();
                   $ir = "Location:seguimiento.lista.php";
                   header($ir);
                }
           }  else {
           $revision1->fechaAprobacion();
           $desaprobados=$revision1->listaObservaciones();
           if(count($desaprobados)>0){
           $revisionnuevo = new Revision();
           $revisionnuevo->crearRevisionDocente($tribunalacitivo->docente_id, $proyecto->id,'TR');
           $revisionnuevo->avance_id=$avance->id;
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
           $revision1->estadoAprobado();
           $revision1->notificacionRevision($estudiante->id, $proyecto->id, $usuarioss->getNombreCompleto());
           $avance->cambiarEstadoCorregido();   
           $ir = "Location:observacion.editar.revision.php?iddicta=".$iddicta."&revisiones_id=".$revisionnuevo->id;
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
  $smarty->assign("iddicta", $iddicta);
  $smarty->assign("ERROR", $ERROR);
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $token = sha1(URL . time());
  $_SESSION['register'] = $token;
  $smarty->assign('token',$token);
  
$TEMPLATE_TOSHOW = 'docente/tribunal/full-width.avance.detalle.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>