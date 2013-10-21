<?php
try {
  define ("MODULO", "CONSEJO");
  require('_start.php');
 if(!isConsejoSession())
    header("Location: login.php"); 

  leerClase('Docente');
   leerClase('Consejo');
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
  $JS[]  = URL_JS . "consejo/tabla.estudiante.lista.js";
  $smarty->assign('JS',$JS);
  
   /**
   * Menu superior
   */
 $menuList[]     = array('url'=>URL.Consejo::URL,'name'=>'Consejo');
  $menuList[]     = array('url'=>URL . Consejo::URL.'listatribunal.php' ,'name'=>'Tribunal');
  $smarty->assign("menuList", $menuList);
   $smarty->assign("menuList", $menuList);
 

  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('tribunal/listas.listas.tpl');
?>