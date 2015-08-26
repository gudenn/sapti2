<?php
try {
  define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: login.php");  


  leerClase("Area");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Foro de Docentes');
  $smarty->assign('description','Temas de Foro');
  $smarty->assign('keywords','Gesti&acoute;n,Areas');

  leerClase('Usuario');
  leerClase('Docente');
  leerClase('Forotema');
  $docente = getSessionDocente(); 

  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Docente::URL , 'name'=>'Asignaturas');
  $menuList[]     = array('url'=>URL . Docente::URL .'foro/' , 'name'=>'FORO');
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
  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);
  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  $smarty->assign('mascara'     ,'docente/foro/listas.mascara.tpl');
  $smarty->assign('lista'       ,'docente/foro/lista.tpl');

  //Filtro
  $filtro   = new Filtro('g_ftema',__FILE__);
  $objeto = new Forotema();
  $objeto->iniciarFiltro($filtro);
  $filtro_sql = $objeto->filtrar($filtro);

  
  $o_string   = $objeto->getOrderString($filtro);
  $obj_mysql  = $objeto->getAll('',$o_string,$filtro_sql,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'g_ftema','',false);

  //para obtener el nombre de los que pubican
  $usuario = new Usuario();

  $smarty->assign("filtros"  ,$filtro);
  $smarty->assign("usuario"  ,$usuario);
  $smarty->assign("forotema" ,$objeto);
  $smarty->assign("objs"     ,$objs_pg->objs);
  $smarty->assign("pages"    ,$objs_pg->p_pages);
  $smarty->assign("crear_nuevo"  ,"tema.registro.php");
  $ERROR = ''; 

 
  if(isset($_SESSION['estado']) && $_SESSION['estado'] == 1) {
    leerClase('Html');
    $html = new Html();
    $mensaje = array('mensaje' => 'Se grab&oacute; correctamente el Tema', 'titulo' => 'Registro de Tema', 'icono' => 'tick_48.png');
    $ERROR = $html->getMessageBox($mensaje);
    $_SESSION['estado'] = 0;
    $smarty->assign("ERROR", $ERROR);
  }

  //No hay ERROR
 //$smarty->assign("ERROR",'');
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