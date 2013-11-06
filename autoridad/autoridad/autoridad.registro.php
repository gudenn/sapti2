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
  $smarty->assign('title','Agregar Nueva Autoridad');
  $smarty->assign('description','P&aacute;gina de registro de Autoridades');
  $smarty->assign('keywords','registro,Autoridades');

  
  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

  
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL,'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'autoridad/','name'=>'Autoridades');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'autoridad/autoridad.gestion.php','name'=>'Gesti&oacute;n Autoridades');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'autoridad/'.basename(__FILE__),'name'=>'Registro de Autoridades');
  $smarty->assign("menuList", $menuList);


  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////


  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/autoridad/lista.registro.tpl');

  //Filtro
  $filtro  = new Filtro('autoridades',__FILE__);
  
  
  
  $pertenece_autoridades = new Pertenece();
  
  $pertenece_autoridades->iniciarFiltro($filtro);
  $filtro_sql = $pertenece_autoridades->filtrar($filtro);

   //Habilitamos a un Usuario en el grupo de autoridades
  if ( isset($_GET['usuario_id_agregar']) && is_numeric($_GET['usuario_id_agregar']) )
  {
    $usuario = new Usuario($_GET['usuario_id_agregar']);
    if ($usuario->id)
      $usuario->asignarGrupo(Grupo::GR_AU);
    $_SESSION['estado'] = true;
       header("Location: autoridad.gestion.php");
    
  }
  
  $pertenece_autoridades->usuario_id = '%';
  //buscamos el grupo autoridades
  $grupo = new Grupo('', Grupo::GR_DO);
  $pertenece_autoridades->grupo_id   = $grupo->id;
  
  $o_string   = $pertenece_autoridades->getOrderString($filtro);

  //buscamos el grupo autoridades para evitar cargar duplicados
  $grupoAu     = new Grupo('', Grupo::GR_AU);
  $filtro_sql .= " AND usuario.id NOT IN (SELECT usuario_id FROM pertenece WHERE grupo_id = '{$grupoAu->id}') "; 
  
  $obj_mysql  = $pertenece_autoridades->getAll('',$o_string,$filtro_sql,TRUE,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'autoridades','',false);


  $smarty->assign("filtros"  ,$filtro);
  $smarty->assign("objs"     ,$objs_pg->objs);
  $smarty->assign("pages"    ,$objs_pg->p_pages);




  //No hay ERROR
  $smarty->assign("ERROR",'');
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