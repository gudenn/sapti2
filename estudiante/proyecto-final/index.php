<?php
try {
  define ("MODULO", "ESTUDIANTE");
  require('../_start.php');
  if(!isEstudianteSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

  //CSS
  $CSS[]  = URL_CSS . "dashboard.css";
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = "js/jquery.js";
  $smarty->assign('JS','');

  // Escritorio del estuddinate
  leerClase('Usuario');
  leerClase('Materia');
  leerClase('Docente');
  leerClase('Estudiante');
  
  $estudiante     = getSessionEstudiante();
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();
  $dicta          = $estudiante->getDicta();
  $materia        = new Materia($dicta->materia_id);
  $docente        = new Docente($dicta->docente_id);
  
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Estudiante::URL,'name'=>'Estudiante');
  $menuList[]     = array('url'=>URL.Estudiante::URL.Proyecto::URL,'name'=>'Proyecto Final');
  $smarty->assign("menuList", $menuList);

  /**
   * Menu central
   */
   
  leerClase('Menu');
  $menu = new Menu('');
 

  $menus = $menu->getestudianteProyectoFinalIndex($proyecto);
  $smarty->assign("menus", $menus);
  
  
  $smarty->assign("columnacentrodetalle", 'estudiante/columna.detalle.tpl');
  $smarty->assign("estudiante", $estudiante);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("proyecto", $proyecto);
  $smarty->assign("docente", $docente);
  $smarty->assign("materia", $materia);
  $smarty->assign("ERROR", $ERROR);
  

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'estudiante/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>