<?php
try {
  define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php"); 

  leerClase('Docente');
  leerClase('Dicta');
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
  $JS[]  = URL_JS . "tablaeditable/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "tablaeditable/tabla.estudiante.lista.js";
  $smarty->assign('JS',$JS);
  
  if ( isset($_SESSION['iddictapro']) && is_numeric($_SESSION['iddictapro']) )
  {
     $iddicta = $_SESSION['iddictapro'];
  }
  $dicta=new Dicta($iddicta);
   /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.proyecto-final.php','name'=>$dicta->getNombreMateria());
  $menuList[]     = array('url'=>URL.Docente::URL.'estudiante/'.basename(__FILE__),'name'=>'Estudiantes Inscritos');
  $smarty->assign("menuList", $menuList);

  $smarty->assign("iddicta", $iddicta);

  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('docente/estudiante/full-width.estudiante.lista.tpl');
?>