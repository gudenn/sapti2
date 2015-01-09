<?php
try {
  define ("MODULO", "ADMIN-CARTAS");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  leerClase("Modelo_carta");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Modelos de Carta');
  $smarty->assign('description','Gesti&oacute;n de Modelos de Carta para el Sistema');
  $smarty->assign('keywords','Modelos de Carta,Semestre');
  leerClase('Administrador');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Gesti&oacute;n de Modelos de Carta');
  $smarty->assign("menuList", $menuList);


  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/modelo_carta/lista.tpl');

  //Filtro
  $filtro   = new Filtro('g_modelo_carta',__FILE__);
  if (isset($_GET['todos']))
    $filtro->clearFiltro();
  $modelo_carta = new Modelo_carta();
  $modelo_carta->iniciarFiltro($filtro);
  $filtro_sql = $modelo_carta->filtrar($filtro);

  
  $o_string   = $modelo_carta->getOrderString($filtro);
  $obj_mysql  = $modelo_carta->getAll('',$o_string,$filtro_sql,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'g_modelo_carta','',false);

  $smarty->assign("modelo_carta"  ,$modelo_carta);
  $smarty->assign("filtros"       ,$filtro);
  $smarty->assign("objs"          ,$objs_pg->objs);
  $smarty->assign("pages"         ,$objs_pg->p_pages);
  $smarty->assign("crear_nuevo"   ,"modelo_carta.registro.php");

  $ERROR = ''; 
  if(isset($_SESSION['estado']) && $_SESSION['estado']==1)
  {
    leerClase('Html');
    $html = new Html();
    $mensaje = array('mensaje'=>'Se grab&oacute; correctamente el Modelo de Carta','titulo'=>'Registro de Modelo de Carta' ,'icono'=> 'tick_48.png');
    $ERROR = $html->getMessageBox ($mensaje);
    $_SESSION['estado']=0;
  }


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