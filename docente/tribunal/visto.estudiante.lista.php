<?php
try {
     define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php"); 

  leerClase("Evento");
  leerClase("Pagination");
  leerClase('Docente');
  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Lista de Estudiantes');
  $smarty->assign('description','P&aacute;gina de Lista de Incritos');
  $smarty->assign('keywords','Gestion,Estudiantes');

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_CSS . "editablegrid.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "tablaeditable/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "tablaeditabletribunal/visto.tabla.estudiante.lista.js";
  $smarty->assign('JS',$JS);
   $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'tribunal','name'=>'Tribunal');
  $menuList[]     = array('url'=>URL.Docente::URL.'tribunal/visto.estudiante.lista.php','name'=>'Lista Estudiante');
  $smarty->assign("menuList", $menuList);
  
  $docente=  getSessionDocente();
  $docenteid=$docente->id;
   
  $smarty->assign("docente", $docente);
  $smarty->assign("docente_ids", $docenteid);

  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('docente/tribunal/visto.estudiante.lista.tpl');
?>