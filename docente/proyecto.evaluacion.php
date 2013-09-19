<?php
try {
  require('_start.php');
  if(!isDocenteSession())
    header("Location: login.php"); 

  leerClase("Estudiante");
  leerClase("Usuario");
  leerClase("Evaluacion");

  /** HEADER */
  $smarty->assign('title','Gestion de Observaciones');
  $smarty->assign('description','Pagina de gestion de Observaciones');
  $smarty->assign('keywords','Gestion,Observaciones');

  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_CSS . "editablegrid.css";
  $CSS[]  = URL_JS . "ventanasmodales/simplemodaldetalle.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "tablaeditable/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "tablaeditable/tabla.revision.lista.revisor.js";
  $JS[]  = URL_JS . "ventanasmodales/observacion.detalle.js";
  $JS[]  = URL_JS . "ventanasmodales/jquery.simplemodal-1.4.4.js";
  $smarty->assign('JS',$JS);

    if (isset($_GET['id_estudiante'])) 
  $id_estudiante=$_GET['id_estudiante'];
  $docente=  getSessionDocente();
  $docente_ids=$docente->id;
  
  $estudiante     = new Estudiante($id_estudiante);
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();
  $evaluacion     = new Evaluacion(1);

  $smarty->assign("usuario", $usuario);
  $smarty->assign("proyecto", $proyecto);
  $smarty->assign("evaluacion", $evaluacion);
  
     if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    $evaluacion->objBuidFromPost();
    $evaluacion->save();
    }

  //No hay ERROR
  $smarty->assign("ERROR",'');
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

  $token                = sha1(URL . time());
  $_SESSION['register'] = $token;
  $smarty->assign('token',$token);
  $smarty->display('docente/full-width.proyecto.evaluacion.tpl');
?>