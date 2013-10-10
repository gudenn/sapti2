<?php
try {
   define ("MODULO", "DOCENTE-TRIBUNAL");
  require('_start.php');
  if(!isDocenteSession())
    header("Location: login.php"); 

  leerClase("Evento");
  leerClase("Pagination");
  leerClase('Docente');
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
  $JS[]  = URL_JS . "tablaeditabletribunal/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "tablaeditabletribunal/tabla.estudiante.lista.js";
  $smarty->assign('JS',$JS);
  

  
  $docente=  getSessionDocente();
  $docenteid=$docente->id;
   
  $smarty->assign("docente_ids", $docenteid);

  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('docente_tribunal/full-width.estudiante.lista.tpl');
?>