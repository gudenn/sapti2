<?php
try {
 define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession() && !isTutorSession() )
    header("Location: ../login.php"); 

  leerClase("Evento");
  leerClase("Pagination");
  leerClase('Docente');
  leerClase("Usuario");
  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Lista de Estudiantes');
  $smarty->assign('description','P&aacute;gina de Lista de Incritos');
  $smarty->assign('keywords','Gestion,Estudiantes');
//BOX
  $CSS[]  = URL_JS . "box/box.css";

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_CSS . "editablegrid.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
    $JS[]  = URL_JS ."box/jquery.box.js";
  $JS[]  = URL_JS . "tablaeditabletutor/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "tablaeditabletutor/tabla.estudiante.lista.js";
   $smarty->assign('JS',$JS);
  
   /**
   * Menu superior
   */

  $menuList[]     = array('url'=>URL.Docente::URL.'tutor','name'=>'Tutor');
 $menuList[]     = array('url'=>URL.Docente::URL.'tutor/estudiante.lista.php','name'=>'Lista Estudiante de Proyectos');
 $smarty->assign("menuList", $menuList);

  $docente=  getSessionDocente();
  $docenteid=$docente->id;
  $tutor= getSessionUser()->getTutor();
  //var_dump($tutor);
  
  
  $smarty->assign("docente_ids",$docente->usuario_id);
  $smarty->assign("tutor",$tutor);

  //No hay ERROR
    $ERROR = ''; 
if(isset($_SESSION['estado']) && $_SESSION['estado']==1)
{
  
  
  leerClase('Html');
  $html  = new Html();
 
 
    $html = new Html();
      
      $mensaje = array('mensaje'=>'Se grab&oacute; correctamente','titulo'=>'Visto Bueno' ,'icono'=> 'tick_48.png');
  
      $ERROR = $html->getMessageBox ($mensaje);
$_SESSION['estado']=1;
$smarty->assign("ERROR",$ERROR);     
}
  
  
  
  
  
  
  
//  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('docente/tutor/full-width.estudiante.lista.tpl');
?>