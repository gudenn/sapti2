<?php
try {
    define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: login.php"); 
  
  leerClase("Revision");
  leerClase("Observacion");
  leerClase("Docente");
  
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
    leerClase('Dicta');
    if ( isset($_SESSION['iddictapro']) && is_numeric($_SESSION['iddictapro']) )
  {
      $iddicta=$_SESSION['iddictapro'];
  }
  $dicta = new Dicta($iddicta);
     /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.proyecto-final.php','name'=>$dicta->getNombreMateria());
  $menuList[]     = array('url'=>URL.Docente::URL.'estudiante/estudiante.lista.php','name'=>'Estudiantes Inscritos');
  $menuList[]     = array('url'=>URL.Docente::URL.'revision/revision.lista.php','name'=>'Seguimiento');
  $menuList[]     = array('url'=>URL.Docente::URL.'revision/'.basename(__FILE__),'name'=>'Edicion de Observaciones');
  $smarty->assign("menuList", $menuList);
    
  $revid = false;
  if ( isset($_GET['revisiones_id']) && is_numeric($_GET['revisiones_id']) ){
  $revid=$_GET['revisiones_id'];
  $_SESSION['obs_revisiones_id']=$_GET['revisiones_id'];      
  }
  elseif (isset($_SESSION['obs_revisiones_id']) && is_numeric($_SESSION['obs_revisiones_id'])) {
      $revid = $_SESSION['obs_revisiones_id'];
    }

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
