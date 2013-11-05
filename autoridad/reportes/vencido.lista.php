<?php
try {
 define ("MODULO", "REPORTE");
 require('../_start.php');
 

  leerClase('Docente');
  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Proyectos Vencidos');
  $smarty->assign('description','Pagina de Lista de Perfiles vencidos');
  $smarty->assign('keywords','Gestion,');

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_CSS . "editablegrid.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "tablaeditable/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "tablaeditable/tabla.vencido.lista.js";
  $smarty->assign('JS',$JS);
  
   /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Administrador::URL,'name'=>'Administracion');
  $menuList[]     = array('url'=>URL.Administrador::URL.'reportes/','name'=>'Proyecto');
  $menuList[]     = array('url'=>URL.Administrador::URL.'reportes/vencido.lista.php'.basename(__FILE__),'name'=>'Proyectos Vencidos');
  $smarty->assign("menuList", $menuList);
  
  if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) )
  {
     $iddicta = $_GET['iddicta'];
  }else{
      $iddicta=$_SESSION['iddictapro'];
  }

  $smarty->assign("iddicta", $iddicta);

  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('admin/reportes/vencido.lista.tpl');
?>