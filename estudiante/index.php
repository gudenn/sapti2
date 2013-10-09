<?php
try {
  define ("MODULO", "ESTUDIANTE");
  require('_start.php');
  if(!isEstudianteSession())
    header("Location: login.php");  

  
  /** HEADER */
  $smarty->assign('title','Sistema SAPTI - Estudiante');
  $smarty->assign('description','Entorno de trabajo del Estudiante');
  $smarty->assign('keywords','Estudiante,SAPTI');

  //CSS
  $CSS[]  = URL_CSS . "dashboard.css";
  $CSS[]  = URL_CSS . "academic/3_column.css";


  //JS
  $JS[]  = URL_JS ."jquery.min.js";

  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);

  // Escritorio del estuddinate
  leerClase('Usuario');
  leerClase('Proyecto');
  leerClase('Estudiante');
  
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Estudiante::URL,'name'=>'Estudiante');
  $smarty->assign("menuList", $menuList);

  
  
  
  $usuario_aux    = getSessionUser();
  $usuario        = new Usuario($usuario_aux->id);
  $usuario->getAllObjects();
  $estudiante     = new Estudiante();
  if (isset($usuario->estudiante_objs[0]))
    $estudiante = $usuario->estudiante_objs[0];
  $proyecto       = $estudiante->getProyecto();

  /**
   * Menu central
   */
  leerClase('Menu');
  $menu = new Menu('');
  $menus = $menu->getestudianteIndex($proyecto);
  $smarty->assign("menus", $menus);

  $smarty->assign("estudiante", $estudiante);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("proyecto", $proyecto);
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