<?php
try {
  define ("MODULO", "ADMIN-CONFIGURACION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  


  leerClase("Configuracion_semestral");
  leerClase("Semestre");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Configuraci&oacute;n Semestral');
  $smarty->assign('description','P&aacute;gina de gesti&oacute;n de Configuraci&oacute;n Semestral');
  $smarty->assign('keywords','Gesti&acoute;n,Configuraci&oacute;n Semestral');
  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Configuraci&oacute;n Semestral');
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

  $semestre_id = false;
  if (isset($_SESSION['semestre_id']) && is_numeric($_SESSION['semestre_id']))
    $semestre_id = $_SESSION['semestre_id'];
  if (isset($_GET['semestre_id']) && is_numeric($_GET['semestre_id']))
  {
    $_SESSION['semestre_id'] = $_GET['semestre_id'];
    $semestre_id             = $_GET['semestre_id'];
  }
  $semestre = new Semestre($semestre_id);
  if (!$semestre_id)
    $semestre->getActivo ();
  $smarty->assign("semestre"  ,$semestre);
  
  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/configuracion_semestral/lista.tpl');

  //Filtro
  $filtro   = new Filtro('g_configuracions',__FILE__);
  $objeto = new Configuracion_semestral();
 
  $objeto->iniciarFiltro($filtro);
  $filtro_sql = $objeto->filtrar($filtro);
 $objeto->semestre_id=$semestre->id;
  
  $o_string   = $objeto->getOrderString($filtro);
  $obj_mysql  = $objeto->getAll('',$o_string,$filtro_sql,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'g_configuracions','',false);

  $smarty->assign("crear_nuevo"  ,"configuracion_semestral.registro.php?semestre_id={$semestre->id}");
  $smarty->assign("filtros"  ,$filtro);
  $smarty->assign("objs"     ,$objs_pg->objs);
  $smarty->assign("pages"    ,$objs_pg->p_pages);

 $ERROR = ''; 
if(isset($_SESSION['estado']) && $_SESSION['estado']==1)
{
  
  
  leerClase('Html');
  $html  = new Html();
 
 
    $html = new Html();
      
      $mensaje = array('mensaje'=>'Se grab&oacute; correctamente la Configuracion','titulo'=>'Registro de Configuracion' ,'icono'=> 'tick_48.png');
  
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