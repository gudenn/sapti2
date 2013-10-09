<?php
try {
  define ("MODULO", "ESTUDIANTE-INDEX");
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
  leerClase('Visto_bueno');
  
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Estudiante::URL,'name'=>'Estudiante');
  $smarty->assign("menuList", $menuList);

  
  
  
  $estudiante_aux = getSessionEstudiante();
  $estudiante     = new Estudiante($estudiante_aux->estudiante_id);
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();
<<<<<<< HEAD
  $proyecto= new Proyecto($proyecto->id);
  
   $vistod=$proyecto->getVD();
   $vistodoc=$vistod[0]->visto_bueno_tipo;
  $vistot=$proyecto->getVT();
   $vistotu=$vistot[0]->visto_bueno_tipo;
  
  
=======

  /**
   * Menu central
   */
  leerClase('Menu');
  $menu = new Menu('');
  $menus = $menu->getestudianteIndex($proyecto);
  $smarty->assign("menus", $menus);

>>>>>>> origin/master
  $smarty->assign("estudiante", $estudiante);
  $smarty->assign("usuario", $usuario);
  
  $smarty->assign("proyecto", $proyecto);
  
  $smarty->assign("vistodoc", $vistodoc);
  $smarty->assign("vistotu", $vistotu);
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