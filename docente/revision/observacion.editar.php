<?php
try {
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: login.php"); 
  
  leerClase("Revision");
  leerClase("Observacion");
  
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
    
  if ( isset($_GET['revisiones_id']) && is_numeric($_GET['revisiones_id']) )
  $revid=$_GET['revisiones_id'];

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

  $docente=  getSessionDocente();
  $docente_ids=$docente->id;

  $smarty->assign("revisionesid", $revid);
  
  $idestu=$arrayobser[0]['idestu'];
    if(isset($_POST['borrar'])){
      
    $revision    = new Revision($revid);
    $resul = "select id from observacion where revision_id =".$revid." ";
    $sql=mysql_query($resul);
    $a=0;
    $sql1=array();
  while($res=mysql_fetch_row($sql)) {
      $sql1[$a]=$res[0];
      $a=$a+1;
    }
    foreach ($sql1 as $array2){
    $observacion = new Observacion($array2);
    $observacion->delete();
    }
    $revision->delete();
    
      $url="revision.lista.php?id_estudiante=$idestu";
      $ir = "Location: $url";
      header($ir);
  };
  $columnacentro = 'docente/revision/columna.centro.observacion-editar.tpl';
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
