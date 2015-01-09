<?php
try {
  define ("MODULO", "ADMIN-ESTUDIANTE-GESTION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  


  

  leerClase("Usuario");
  leerClase("Estudiante");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Estudiantes');
  $smarty->assign('description','P&aacute;gina de Gesti&oacute;n de Estudiantes');
  $smarty->assign('keywords','Gesti&oacute;n,Estudiantes');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'estudiante/','name'=>' Estudiantes');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'estudiante/'.basename(__FILE__),'name'=>'Gesti&oacute;n de Estudiantes');
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

  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  if (isset($_GET['eliminar']) && isset($_GET['estudiante_id']) && is_numeric($_GET['estudiante_id']) )
  {
    $estudiante = new Estudiante($_GET['estudiante_id']);
    $usaurio    = new Usuario($estudiante->usuario_id);
    $usaurio->delete();
    $estudiante->delete();
  }

  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/estudiante/estudiante.lista.tpl');

  //Filtro
  $filtro     = new Filtro('g_estudiantetod',__FILE__);
  $estudiante = new Estudiante();
  $estudiante->iniciarFiltro($filtro);
  $filtro_sql = $estudiante->filtrar($filtro);

  $estudiante->usuario_id = '%';
  
  
  $o_string   = $estudiante->getOrderString($filtro);
  $obj_mysql  = $estudiante->getAll('',$o_string,$filtro_sql,TRUE,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'g_estudiantetod','',false);

  $smarty->assign("filtros"  ,$filtro);
  $smarty->assign("objs"     ,$objs_pg->objs);
  $smarty->assign("pages"    ,$objs_pg->p_pages);
  $smarty->assign("crear_nuevo"  ,"estudiante.registro.php");

  if (isset($_SESSION['estado']) && $_SESSION['estado'] == 1) {
    leerClase('Html');
    $html    = new Html();
    $mensaje = array('mensaje' => 'Se grab&oacute; correctamente el Estudiante', 'titulo' => 'Registro de Estudiante', 'icono' => 'tick_48.png');
    $ERROR   = $html->getMessageBox($mensaje);
    $_SESSION['estado'] = 0;
  }
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