<?php
try {
  define ("MODULO", "ADMIN-PROYECTO");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  leerClase("Usuario");
  leerClase("Estudiante");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");
  leerClase("Proyecto_estudiante");

  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Proyectos Finales');
  $smarty->assign('description','P&aacute;gina de Gesti&oacute;n de Proyectos Finales');
  $smarty->assign('keywords','Gesti&oacute;n,Proyectos Finales');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'proyecto/','name'=>'Gesti&oacute;n Proyectos Finales');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'estudiante/'.basename(__FILE__),'name'=>'Gesti&oacute;n de Proyectos Finales');
  $smarty->assign("menuList", $menuList);
//CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  
   $JS[]  = URL_JS . "jquery.min.js";


  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  //BOX
  $CSS[]  = URL_JS . "box/box.css";
  $JS[]  = URL_JS ."box/jquery.box.js";
  //Datepicker & Tooltips $ Dialogs UI
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  $JS[]   = URL_JS . "jquery-ui-1.10.3.custom.min.js";
  $JS[]   = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);


  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/proyecto_estudiante/proyecto.lista.tpl');


  //Filtro
  $filtro     = new Filtro('g_proyectogestion',__FILE__);
  $proyecto   = new Proyecto_estudiante();
  $proyecto->iniciarFiltro($filtro);
  $filtro_sql = $proyecto->filtrar($filtro);

  $proyecto->estudiante_id = '%';
  $proyecto->proyecto_id   = '%';
  
  
  $o_string   = $proyecto->getOrderString($filtro);
  $obj_mysql  = $proyecto->getAll('',$o_string,$filtro_sql,FALSE,TRUE);
  $objs_pg    = new Pagination($obj_mysql[0], 'g_proyectogestion','',false);

  $smarty->assign("filtros"  ,$filtro);
  $smarty->assign("objs"     ,$objs_pg->objs);
  $smarty->assign("pages"    ,$objs_pg->p_pages);

  $smarty->assign("URL",URL);  
  $smarty->assign("ERROR", $ERROR);

}
catch(Exception $e) {
  $smarty->assign("ERROR", handleError($e));
}

if (isset($_GET['tlista']) && $_GET['tlista']) //recargamos la tabla central
  $smarty->display('admin/listas.lista.tpl'); 
else
  $smarty->display('admin/full-width.tpl');


?>