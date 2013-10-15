<?php
try {
    define ("MODULO", "CONSEJO");
  
  require('_start.php');
    /** HEADER */
  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

   //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_CSS . "editablegrid.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "tablaeditable/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "consejo/tabla.estudiante.lista.js";
  $smarty->assign('JS',$JS);

  //CREAR UN TIPO   DE DEF
  leerClase('Tribunal');
  leerClase("Proyecto");
  leerClase("Usuario");
  leerClase("Docente");
  leerClase("Estudiante");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");
  leerClase("Consejo");
  leerClase("Proyecto_estudiante");
$menuList[]     = array('url'=>URL.Consejo::URL,'name'=>'Consejo');
  $menuList[]     = array('url'=>URL . Consejo::URL ,'name'=>'Proyectos Asignados');
 $smarty->assign("menuList", $menuList);

  $smarty->assign("ERROR", $ERROR);
  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

//$contenido = 'tribunal/listas.listas.tpl';
//$smarty->assign('contenido',$contenido);


$TEMPLATE_TOSHOW = 'tribunal/listas.listas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>