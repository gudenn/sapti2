<?php
try {
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: login.php");  
  
  leerClase("Evento");
  leerClase("Pagination");
  leerClase('Docente');
  
  /** HEADER */
  $smarty->assign('title','SAPTI - Inscripcion de Estudiantes');
  $smarty->assign('description','Formulario de Inscripcion de Estudiantes');
  $smarty->assign('keywords','SAPTI,Estudiantes,Inscripcion');

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_CSS . "editablegrid.css";
  $CSS[]  = URL_JS . "ventanasmodales/simplemodal.css";
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";


   // Agregan el js
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "jquery-ui-1.10.3.custom.min.js";
  $JS[]  = URL_JS . "tablaeditable/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "tablaeditable/tabla.evento.lista.js";
  $JS[]  = URL_JS . "ventanasmodales/jquery.simplemodal-1.4.4.js";
  $JS[]  = URL_JS . "ventanasmodales/evento.edicion.js";
  
    //Datepicker UI
  $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
  $smarty->assign('JS',$JS);
  $smarty->assign('CSS',$CSS);
  
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Docente');
  $menuList[]     = array('url'=>URL.Docente::URL.basename(__FILE__),'name'=>'Edicion de Eventos');
  $smarty->assign("menuList", $menuList);
  
  if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) )
  {
     $iddicta = $_GET['iddicta'];
  }
  
  if (isset($_GET['eliminar']) && isset($_GET['evento_id']) && is_numeric($_GET['evento_id']) )
  {
    $evento = new Evento($_GET['evento_id']);
    $evento->delete();
  }
  $smarty->assign('iddicta' ,$iddicta);
  $smarty->assign('columnacentro' ,'docente/calendario/evento.lista.tpl');  
  //No hay ERROR
  $smarty->assign("ERROR",'');
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('docente/calendario/docente.3columnas.evento.tpl');
?>