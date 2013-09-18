<?php
try {
  require('_start.php');
  if(!isDocenteSession())
    header("Location: login.php"); 

  leerClase("Estudiante");
  leerClase("Usuario");

  /** HEADER */
  $smarty->assign('title','Gestion de Observaciones');
  $smarty->assign('description','Pagina de gestion de Observaciones');
  $smarty->assign('keywords','Gestion,Observaciones');

  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_CSS . "tablaeditableevaluacion.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "tablaeditable/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "tablaeditable/tabla.revision.lista.revisor.js";
  $JS[]  = URL_JS . "tablaeditable/tabla.revision.lista.evaluacion.js";
  $smarty->assign('JS',$JS);

    if (isset($_GET['id_estudiante'])) 
  $id_estudiante=$_GET['id_estudiante'];
  $docente=  getSessionDocente();
  $docente_ids=$docente->id;
  
  $estudiante     = new Estudiante($id_estudiante);
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();

  $smarty->assign("usuario", $usuario);
  $smarty->assign("proyecto", $proyecto);
  
    $sql1="SELECT re.id as 'id_re', pr.nombre as 'nombrep', pr.id as 'id_pr', re.fecha_revision as 'fecha', COUNT(ob.revision_id) as num
FROM docente dt, proyecto pr, revision re, observacion ob
WHERE dt.id='".$docente_ids."'
AND pr.id='".$proyecto_ids."'
AND re.proyecto_id=pr.id
AND re.id=ob.revision_id
GROUP BY ob.revision_id";
 $resultado1 = mysql_query($sql1);

  //No hay ERROR
  $smarty->assign("ERROR",'');
  $smarty->assign("URL",URL);  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('docente/full-width.proyecto.evaluacion.tpl');
?>