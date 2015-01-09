<?php
try {
  define ("MODULO", "ADMIN-CONFIGURACION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  


  leerClase("Semestre");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Semestres');
  $smarty->assign('description','P&aacute;gina de gesti&oacute;n de Semestres');
  $smarty->assign('keywords','Gestion,Semestre');
  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Gesti&oacute;n de Semestre');
  $smarty->assign("menuList", $menuList);

 
  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  //$CSS[]  = URL_CSS . "pg.css";
 // $smarty->assign('CSS',$CSS);

  
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
  if (isset($_GET['activar']) && isset($_GET['semestre_id']) && is_numeric($_GET['semestre_id']) )
  {
    $semestre = new Semestre($_GET['semestre_id']);
    $semestre->activar();
    $semestre->save();
  }

  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/semestre/lista.tpl');

  //Filtro
  $filtro   = new Filtro('g_semestre',__FILE__);
  $semestre = new Semestre();
  $semestre->iniciarFiltro($filtro);
  $filtro_sql = $semestre->filtrar($filtro);

  
  $o_string   = $semestre->getOrderString($filtro);
  $obj_mysql  = $semestre->getAll('',$o_string,$filtro_sql,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'g_semestre','',false);

  $smarty->assign("filtros"  ,$filtro);
  $smarty->assign("objs"     ,$objs_pg->objs);
  $smarty->assign("pages"    ,$objs_pg->p_pages);
$smarty->assign("crear_nuevo"  ,"semestre.registro.php");
 $ERROR = ''; 
if(isset($_SESSION['estado']) && $_SESSION['estado']==1)
{
  
  
  leerClase('Html');
  $html  = new Html();
 
 
    $html = new Html();
      
      $mensaje = array('mensaje'=>'Se grab&oacute; correctamente el Semestre','titulo'=>'Registro de Semestre' ,'icono'=> 'tick_48.png');
  
      $ERROR = $html->getMessageBox ($mensaje);
   
   $_SESSION['estado']=0;
$smarty->assign("ERROR",$ERROR);
     
}
     
  $smarty->assign("URL",URL);  

}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

if (isset($_GET['tlista']) && $_GET['tlista']) //recargamos la tabla central
  $smarty->display('admin/listas.lista.tpl'); 
else
  $smarty->display('admin/full-width.tpl');


?>