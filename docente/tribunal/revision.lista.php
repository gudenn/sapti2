<?php
try {
    define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: login.php"); 

  leerClase('Estudiante');
  leerClase('Usuario');
  leerClase('Docente');
  
  /** HEADER */
  $smarty->assign('title','Gestion de Observaciones');
  $smarty->assign('description','P&aacute;gina de gestion de Observaciones');
  $smarty->assign('keywords','Gestion,Observaciones');

  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_CSS . "editablegrid.css";
  $CSS[]  = URL_JS . "ventanasmodales/simplemodaldetalle.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "tablaeditable/editablegrid-2.0.1.js";
   $JS[]  = URL_JS . "tablaeditabletutor/tabla.revision.lista.js";
  $JS[]  = URL_JS . "ventanasmodales/observacion.detalle.js";
  $JS[]  = URL_JS . "ventanasmodales/avance.detalle.modal.js";
  $JS[]  = URL_JS . "ventanasmodales/jquery.simplemodal-1.4.4.js";
  $smarty->assign('JS',$JS);
  
     /**
   * Menu superior
   */
   $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'tribunal','name'=>'Tribunal');
  $menuList[]     = array('url'=>URL.Docente::URL.'tribunal/visto.estudiante.lista.php','name'=>'Lista Estudiante');
  $smarty->assign("menuList", $menuList);
  
  
  if(isset($_GET['id_estudiante'])  && is_numeric($_GET['id_estudiante']))
  $estudiante     = new Estudiante($_GET['id_estudiante']);
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();

  $smarty->assign("usuario", $usuario);
  $smarty->assign("estudiante", $estudiante);
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