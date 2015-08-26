<?php
try {
  define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php");  

  leerClase("Filtro");
  leerClase("Forotema");
  leerClase("Pagination");
  leerClase("Formulario");
  leerClase("Fororespuesta");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Respuestas');
  $smarty->assign('description','P&aacute;gina de gesti&oacute;n de Respuestas');
  $smarty->assign('keywords','Gesti&acoute;n,Respuestas');

  leerClase('Docente');
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
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.js";
  $smarty->assign('JS',$JS);

  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  $smarty->assign('mascara'     ,'docente/fororespuesta/listas.mascara.tpl');
  $smarty->assign('lista'       ,'docente/fororespuesta/lista.tpl');

  //Son las subareas de un area asi que si o si tenemos una area
  $forotema_id = false;
  if (isset($_SESSION['forotema_id']) && is_numeric($_SESSION['forotema_id']))
    $forotema_id = $_SESSION['forotema_id'];
  if (isset($_GET['forotema_id']) && is_numeric($_GET['forotema_id']))
  {
    $_SESSION['forotema_id'] = $_GET['forotema_id'];
    $forotema_id             = $_GET['forotema_id'];
  }
  $forotema = new Forotema($forotema_id);
  $smarty->assign("forotema"  ,$forotema);

  
  //Filtro
  $filtro   = new Filtro('g_forotema',__FILE__);
  $objeto   = new Fororespuesta();
  $objeto->forotema_id = $forotema->id;
  $objeto->iniciarFiltro($filtro);
  $filtro_sql = $objeto->filtrar($filtro);

  $usuario = new Usuario();
  
  $o_string   = $objeto->getOrderString($filtro);
  if ($orderby === ""){
    $orderby = "ORDER BY {$this->getTableName()}.{$this->getIdlabel()} ASC";
  }
  $obj_mysql  = $objeto->getAll('',$o_string,$filtro_sql,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'g_forotema','',false,3);

  $smarty->assign("crear_nuevo"  ,"respuesta.registro.php?forotema_id={$forotema->id}");
  $smarty->assign("filtros"      ,$filtro);
  $smarty->assign("usuario"      ,$usuario);
  $smarty->assign("objs"         ,$objs_pg->objs);
  $smarty->assign("pages"        ,$objs_pg->p_pages);

  if(isset($_SESSION['estado']) && $_SESSION['estado'] == 1) {
    leerClase('Html');
    $html = new Html();
    $mensaje = array('mensaje' => 'Se grab&oacute; correctamente el su respuesta', 'titulo' => 'Registro de Respuesta', 'icono' => 'tick_48.png');
    $ERROR = $html->getMessageBox($mensaje);
    $_SESSION['estado'] = 0;
    $smarty->assign("ERROR", $ERROR);
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