<?php
try {
       define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php"); 

  leerClase('Estudiante');
  leerClase('Usuario');
  
  /** HEADER */
  $smarty->assign('title','Gestion de Observaciones');
  $smarty->assign('description','Pagina de gestion de Observaciones');
  $smarty->assign('keywords','Gestion,Observaciones');

  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_CSS . "editablegrid.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "tablaeditabletutor/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "tablaeditabletutor/tabla.revision.lista.js";
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

  //No hay ERROR
  $smarty->assign("ERROR",'');
  $smarty->assign("URL",URL);  
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

  $smarty->display('docente/tribunal/full-width.revision.lista.tpl');

?>