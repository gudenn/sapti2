<?php
try {
    define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession() && !isTutorSession() )
    header("Location: ../login.php"); 
  
  leerClase("Revision");
  leerClase("Observacion");
  leerClase("Docente");
  leerClase("Proyecto");
  
    /** HEADER */
  $smarty->assign('title','Modificacion de Observaciones');
  $smarty->assign('description','Formulario de Modificacion de Observaciones');
  $smarty->assign('keywords','SAPTI,Observaciones,Registro');

  //CSS
  $CSS[]  = URL_JS . "calendar/css/eventCalendar.css";
  $CSS[]  = URL_JS . "calendar/css/eventCalendar_theme.css";
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_CSS . "editablegrid.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "tablaeditable/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "tablaeditable/tabla.observacion-editar.js";
    //Validation
  $JS[]  = URL_JS . "calendar/js/jquery.eventCalendar.js";
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";
  $JS[]  = URL_JS . "jquery.addfield.js";
  $smarty->assign('JS',$JS);

  if ( isset($_GET['revisiones_id']) && is_numeric($_GET['revisiones_id']) ){
  $revid=$_GET['revisiones_id'];     
  }
  if ( isset($_GET['avance']) && is_numeric($_GET['avance']) ){
  $id=$_GET['avance'];     
  }
  $revision=new Revision($revid);
  $proyecto=new Proyecto($revision->proyecto_id);
  $estuid=$revision->getEstudiante();
     /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Asignaturas');
    $menuList[]     = array('url'=>URL.Docente::URL.'tutor','name'=>'Tutor');
    if($proyecto->tipo_proyecto==Proyecto::TIPO_PERFIL){
    $menuList[]     = array('url'=>URL.Docente::URL.'tutor/perfil.seguimiento.lista.php','name'=>'Lista Estudiantes de Perfil');
    }else {
    $menuList[]     = array('url'=>URL.Docente::URL.'tutor/seguimiento.lista.php','name'=>'Lista Estudiantes de Proyecto');
    }
    $menuList[]     = array('url'=>URL.Docente::URL.'tutor/revision.lista.php?id_estudiante='.$estuid,'name'=>'Seguimiento Estudiante');
    $menuList[]     = array('url'=>URL.Docente::URL.'tutor/avance.detalle.php?avance_id='.$id.'&estudiente_id='.$estuid,'name'=>'Detalle de Avance');
  $menuList[]     = array('url'=>URL.Docente::URL.'revision/observacion.editar.revision.php?revisiones_id='.$revid,'name'=>'Edicion de Observaciones');
    $smarty->assign("menuList", $menuList); $smarty->assign("menuList", $menuList);
  
    
  $resul = "
      SELECT ob.observacion as obser, pr.nombre as nomp, us.nombre as nom,CONCAT(us.apellido_paterno,us.apellido_materno) as ap, re.fecha_revision as fere, proe.id as idestu
FROM observacion ob, revision re, proyecto pr, docente doc, proyecto_estudiante proe, usuario us
WHERE ob.revision_id=re.id
AND re.proyecto_id=pr.id
AND pr.id=proe.proyecto_id
AND re.revisor=doc.id
AND doc.usuario_id=us.id
AND ob.revision_id='".$revid."' 
          ";
   $sql = mysql_query($resul);
while ($fila1 = mysql_fetch_array($sql, MYSQL_ASSOC)) {
   $arrayobser[]=$fila1;
 }
    
  $smarty->assign("arrayobser", $arrayobser);
  $smarty->assign("revisionesid", $revid);
  $smarty->assign("revision", $revision);

  $columnacentro = 'docente/revision/columna.centro.observacion.editar.revision.tpl';
  $smarty->assign('columnacentro',$columnacentro);

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
$TEMPLATE_TOSHOW = 'docente/docente.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>
