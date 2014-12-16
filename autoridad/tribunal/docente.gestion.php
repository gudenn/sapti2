<?php
try {
  define ("MODULO", "ADMIN-DOCENTE");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  
  
  
  
  
  leerClase("Usuario");
  leerClase("Docente");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");
  leerClase('Dicta');


  $ERROR = '';

   /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Docentes');
  $smarty->assign('description','P&aacute;gina de Gesti&oacute;n de Docente');
  $smarty->assign('keywords','Gesti&oacute;n,Docentes');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'docente/','name'=>' Docentes');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'docente/'.basename(__FILE__),'name'=>'Gesti&oacute;n de Docente');
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
  if (isset($_GET['eliminar']) && isset($_GET['docente_id']) && is_numeric($_GET['docente_id']) )
  {
    $docente = new Docente($_GET['docente_id']);
    $usaurio    = new Usuario($docente->usuario_id);
    $usaurio->delete();
    $docente->delete();
  }

  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  
  $smarty->assign('lista'       ,'admin/docente/docente.lista.tpl');

  //Filtro
  $filtro     = new Filtro('g_docente',__FILE__);
  $docente = new Docente();
  $docente->iniciarFiltro($filtro);
  $filtro_sql = $docente->filtrar($filtro);
 
 
 
  $docente->usuario_id = '%';
  
  $o_string   = $docente->getOrderString($filtro);
  $obj_mysql  = $docente->getAll('',$o_string,$filtro_sql,TRUE,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'g_docente','',false,10);

  $smarty->assign("filtros"  ,$filtro);
  $smarty->assign("objs"     ,$objs_pg->objs);
  $smarty->assign("pages"    ,$objs_pg->p_pages);
 $smarty->assign("crear_nuevo"  ,"docente.registro.php");
 $ERROR = ''; 
 
  if(isset($_SESSION['estado']) && $_SESSION['estado']>=1)
  {
    leerClase('Html');
    $html    = new Html();
    if ($_SESSION['estado']=1)
      $mensaje = array('mensaje'=>"Se grabaron correctamente los {$_SESSION['estado']} El Tribunal",'titulo'=>'Registro de Tribunal' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Se grabo correctamente el Tribunal','titulo'=>'Registro de Tribunal' ,'icono'=> 'tick_48.png');
    $ERROR   = $html->getMessageBox ($mensaje);
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