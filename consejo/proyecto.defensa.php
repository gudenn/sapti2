<?php
try {
  define ("MODULO", "CONSEJO");
  require('_start.php');
 //if(!isDocenteSession())
  //  header("Location: ../login.php"); 
  leerClase('Docente');
  leerClase('Consejo');
  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Lista de Estudiantes');
  $smarty->assign('description','P&aacute;gina de Lista de Incritos');
  $smarty->assign('keywords','Gestion,Estudiantes');

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
 $CSS[]  = URL_CSS . "editablegrid.css";
 // $CSS[] = '../css/editablegrid.css';
 
  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  //BOX
  $CSS[]  = URL_JS . "box/box.css";
  $JS[]  = URL_JS ."box/jquery.box.js";
   $JS[]  = URL_JS . 'tablaeditable/editablegrid-2.0.1.js';
  $JS[]  =URL_JS . 'consejo/proyecto.defensa.js';
  $smarty->assign('JS',$JS);
   $smarty->assign('CSS',$CSS);

  
   /**
   * Menu superior
   */
   $menuList[]     = array('url'=>URL.Consejo::URL,'name'=>'Consejo');
   $menuList[]     = array('url'=>URL . Consejo::URL.'proyecto.defensa.php' ,'name'=>'Defensa');
   $smarty->assign("menuList", $menuList);
 
$ERROR = ''; 
if(isset($_SESSION['estado']) && $_SESSION['estado']==1)
{
  
  
  leerClase('Html');
  $html  = new Html();
 
 
    $html = new Html();
      
      $mensaje = array('mensaje'=>'Se grabo correctamente','titulo'=>'Registro de Defensa;' ,'icono'=> 'tick_48.png');
  
      $ERROR = $html->getMessageBox ($mensaje);
   
   $_SESSION['estado']=0;
$smarty->assign("ERROR",$ERROR);
     
}
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('tribunal/proyecto.defensa.tpl');
?>