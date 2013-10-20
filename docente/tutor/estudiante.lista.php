<?php
try {
 define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php"); 

  leerClase("Evento");
  leerClase("Pagination");
  leerClase('Docente');
  leerClase("Usuario");
  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Lista de Estudiantes');
  $smarty->assign('description','Pagina de Lista de Incritos');
  $smarty->assign('keywords','Gestion,Estudiantes');

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_CSS . "editablegrid.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "tablaeditabletutor/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "tablaeditabletutor/tabla.estudiante.lista.js";
   $smarty->assign('JS',$JS);
  
   /**
   * Menu superior
   */
 
  $menuList[]     = array('url'=>URL.Docente::URL.'tutor','name'=>'Tutor');
 $menuList[]     = array('url'=>URL.Docente::URL.'tutor/estudiante.lista.php','name'=>'Lista Estudiante');
 $smarty->assign("menuList", $menuList);

  $docente=  getSessionDocente();
  $docenteid=$docente->id;
  
  $smarty->assign("docente_ids",$docente->usuario_id);

  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('docente/tutor/full-width.estudiante.lista.tpl');
?>