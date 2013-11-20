<?php
try {
  define ("MODULO", "ADMIN-CARTAS");
  require('../_start.php');
  if(!isUserSession())
    header("Location: ../login.php");  

  leerClase("Carta");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Cartas');
  $smarty->assign('description','Gesti&oacute;n de Cartas para el Sistema');
  $smarty->assign('keywords','Cartas,Semestre');
  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'carta/','name'=>'Cartas SAPTI');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'carta/'.basename(__FILE__),'name'=>'Gesti&oacute;n de Cartas');
  $smarty->assign("menuList", $menuList);


  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/carta/lista.tpl');

  //Filtro
  $filtro   = new Filtro('autori_carta',__FILE__);
  if (isset($_GET['todos']))
    $filtro->clearFiltro();
  $carta = new Carta();
  $carta->iniciarFiltro($filtro);
  $filtro_sql = $carta->filtrar($filtro);

  
  $o_string   = $carta->getOrderString($filtro);
  
  $carta->proyecto_id     = '%';
  $carta->modelo_carta_id = '%';
  
  $obj_mysql  = $carta->getAll('',$o_string,$filtro_sql,TRUE,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'autori_carta','',false);

  $smarty->assign("carta"         ,$carta);
  $smarty->assign("filtros"       ,$filtro);
  $smarty->assign("objs"          ,$objs_pg->objs);
  $smarty->assign("pages"         ,$objs_pg->p_pages);

  $ERROR = ''; 
  /*
  if(isset($_SESSION['estado']) && $_SESSION['estado']==1)
  {
    leerClase('Html');
    $html = new Html();
    $mensaje = array('mensaje'=>'Se grabo correctamente el Modelo de Carta','titulo'=>'Registro de Modelo de Carta' ,'icono'=> 'tick_48.png');
    $ERROR = $html->getMessageBox ($mensaje);
    $_SESSION['estado']=0;
  }
  */


  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
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