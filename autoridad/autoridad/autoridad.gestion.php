<?php
try {
  define ("MODULO", "ADMIN-AUTORIDAD");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  
  
  
  leerClase("Pertenece");
  leerClase("Grupo");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Autoridades');
  $smarty->assign('description','Gesti&oacute;n de Autoridades');
  $smarty->assign('keywords','Gesti&oacute;n,Autoridades');

  
  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

  
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL,'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'autoridad/','name'=>'Autoridades');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'autoridad/autoridad.gestion.php','name'=>'Gesti&oacute;n Autoridades');
  $smarty->assign("menuList", $menuList);


  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////


  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/autoridad/lista.tpl');

  //Filtro
  $filtro  = new Filtro('autoridades_gestion',__FILE__);
  
  
  
  $pertenece_autoridades = new Pertenece();
  
  $pertenece_autoridades->iniciarFiltro($filtro);
  $filtro_sql = $pertenece_autoridades->filtrar($filtro);

   //Habilitamos a un Usuario en el grupo de autoridades
  if ( isset($_GET['usuario_id_quitar']) && is_numeric($_GET['usuario_id_quitar']) )
  {
    $usuario = new Usuario($_GET['usuario_id_quitar']);
    if ($usuario->id)
      $usuario->quitarGrupo(Grupo::GR_AU);
    leerClase('Html');
    $html               = new Html();
    $mensaje            = array('mensaje'=>'Se quito correctamente la Autoridad','titulo'=>'Registro de Autoridad' ,'icono'=> 'tick_48.png');
    $ERROR              = $html->getMessageBox ($mensaje);
  }
  
  $pertenece_autoridades->usuario_id = '%';
  //buscamos el grupo autoridades
  $grupo = new Grupo('', Grupo::GR_AU);
  $pertenece_autoridades->grupo_id   = $grupo->id;
  
  $o_string   = $pertenece_autoridades->getOrderString($filtro);

  //buscamos el grupo autoridades para evitar cargar duplicados
  //$grupoAu     = new Grupo('', Grupo::GR_AU);
  //$filtro_sql .= " AND usuario.id IN (SELECT usuario_id FROM pertenece WHERE grupo_id = '{$grupoAu->id}') "; 
  
  $obj_mysql  = $pertenece_autoridades->getAll('',$o_string,$filtro_sql,TRUE,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'autoridades_gestion','',false);


  $smarty->assign("filtros"  ,$filtro);
  $smarty->assign("objs"     ,$objs_pg->objs);
  $smarty->assign("pages"    ,$objs_pg->p_pages);
  $smarty->assign("crear_nuevo"  ,"autoridad.registro.php");



  // mostramos el mensaje de que se grabo correctamente el avance
  if(isset($_SESSION['estado']) && $_SESSION['estado'])
  {
    leerClase('Html');
    $html               = new Html();
    $mensaje            = array('mensaje'=>'Se asigno correctamente la nueva Autoridad','titulo'=>'Registro de Autoridad' ,'icono'=> 'tick_48.png');
    $ERROR              = $html->getMessageBox ($mensaje);
    $_SESSION['estado'] = 0;
  }
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