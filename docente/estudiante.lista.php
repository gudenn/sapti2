<?php
try {
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
  $CSS[]  = URL_CSS . "tablaeditableevaluacion.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "tablaeditable/jquery-1.6.4.min.js";
  $JS[]  = URL_JS . "tablaeditable/jquery-ui-1.8.16.custom.min.js";
  $JS[]  = URL_JS . "tablaeditable/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "tablaeditable/tabla.estudiante.lista.js";
  $smarty->assign('JS',$JS);
  
   /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Docente');
  $menuList[]     = array('url'=>URL.Docente::URL.basename(__FILE__),'name'=>'Estudiantes Registrados');
  $smarty->assign("menuList", $menuList);
  
  $docente=  getSessionDocente();
  //$docenteid=$docente->id;
  $docenteid=4;
  
  $smarty->assign("docente_ids", $docenteid);

  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('docente/full-width.estudiante.lista.tpl');
?>