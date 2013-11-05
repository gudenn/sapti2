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
  $smarty->assign('title','Agregar Nuevo Consejo');
  $smarty->assign('description','P&aacute;gina de registro de Consejo');
  $smarty->assign('keywords','registro,Consejos');

  
  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

  
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL,'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'autoridad/','name'=>'Autoridades');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'autoridad/consejo.gestion.php','name'=>'Gesti&oacute;n Consejos');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'autoridad/'.basename(__FILE__),'name'=>'Registro Consejo');
  $smarty->assign("menuList", $menuList);


  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////


  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/autoridad/consejo.lista.registro.tpl');

  //Filtro
  $filtro  = new Filtro('consejos_asignar',__FILE__);
  
  
  
  $pertenece_autoridades = new Pertenece();
  
  $pertenece_autoridades->iniciarFiltro($filtro);
  $filtro_sql = $pertenece_autoridades->filtrar($filtro);

  //Habilitamos a un Usuario en el grupo de Consejos
  if ( isset($_GET['usuario_id_agregar']) && is_numeric($_GET['usuario_id_agregar']) )
  {
    $usuario = new Usuario($_GET['usuario_id_agregar']);
    if ($usuario->id)
      $usuario->asignarGrupo(Grupo::GR_CO);
    $_SESSION['estado'] = true;
       header("Location: consejo.gestion.php");
    
  }
  
  $pertenece_autoridades->usuario_id = '%';
  //Todos pueden ser consejo
  //$grupo = new Grupo('', Grupo::GR_DO);
  //$pertenece_autoridades->grupo_id   = $grupo->id;
  
  $o_string   = $pertenece_autoridades->getOrderString($filtro);

  //buscamos el grupo Consejos para evitar cargar duplicados
  $grupoAu     = new Grupo('', Grupo::GR_CO);
  $grupoEs     = new Grupo('', Grupo::GR_ES);
  $grupoDo     = new Grupo('', Grupo::GR_DO);
  $filtro_sql .= " AND ( pertenece.grupo_id = '{$grupoEs->id}' OR  pertenece.grupo_id = '{$grupoDo->id}' ) "; 
  $filtro_sql .= " AND usuario.id NOT IN (SELECT usuario_id FROM pertenece WHERE grupo_id = '{$grupoAu->id}') "; 
  
  $obj_mysql  = $pertenece_autoridades->getAll('',$o_string,$filtro_sql,TRUE,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'consejos_asignar','',false);


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