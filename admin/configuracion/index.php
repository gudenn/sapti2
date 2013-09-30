<?php
try {
  require('../_start.php');
  if(!isAdminSession())
    header("Location: login.php");  

  /** HEADER */
  $smarty->assign('title','Configuraci&oacute;n de SAPTI');
  $smarty->assign('description','Configuraci&oacute;n de SAPTI');
  $smarty->assign('keywords','Configuraci&oacute;n de SAPTI');

  //CSS
  $CSS[]  = URL_CSS . "dashboard.css";
  $CSS[]  = URL_CSS . "academic/3_column.css";

  //JS
  $JS[]  = "js/jquery.min.js";
  $smarty->assign('JS','');
  $smarty->assign('CSS',$CSS);

 /**
  * Clases
  */
  leerClase('Administrador');

  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Administrador::URL,'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL.Administrador::URL.'estudiante/','name'=>'Configuraci&oacute;n');
  $smarty->assign("menuList", $menuList);

  /**
   * Menu central
   */
  //----------------------------------//
  leerClase('Menu');
  $menu = new Menu('Cronograma');
  $link = Administrador::URL."configuracion/cronograma.gestion.php";
  $menu->agregarItem('Gesti&oacute;n de Cronograma','Lista completa de todos eventos para el Semestre','basicset/calendar_48.png',$link);
  $link = Administrador::URL."configuracion/cronograma.registro.php";
  $menu->agregarItem('Registro de un Evento','Registro de un nuevo evento para el semestre actual','basicset/timetable.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Semestre');
  $link = Administrador::URL."configuracion/semestre.gestion.php";
  $menu->agregarItem('Gesti&oacute;n de Semestre','Lista de todos semestres y opciones de configuraci&oacute;n de semestres','basicset/database.png',$link);
  $link = Administrador::URL."configuracion/semestre.registro.php";
  $menu->agregarItem('Registro de un Semestre','Registro de un nuevo Semestre.','basicset/plus_48.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Variables de Semestre');
  $link = Administrador::URL."configuracion/configuracion_semestral.gestion.php";
  $menu->agregarItem('Variables de Semestre','Lista de todas las variables que el sistema usa','basicset/lock.png',$link);
  $menus[] = $menu;
  $menu = new Menu('&Aacute;rea');
  $link = Administrador::URL."configuracion/area.gestion.php";
  $menu->agregarItem('Gesti&oacute;n de Areas','Lista de todos las areas configuradas para el sistema','basicset/database.png',$link);
  $link = Administrador::URL."configuracion/area.registro.php";
  $menu->agregarItem('Registro de &Aacute;rea','Registro de una nueva &Aacute;rea.','basicset/plus_48.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Carreras');
  $link = Administrador::URL."configuracion/carrera.gestion.php";
  $menu->agregarItem('Gesti&oacute;n de Carreras','Lista de todas las carreras configuradas para el sistema.','basicset/licence.png',$link);
  $link = Administrador::URL."configuracion/carrera.registro.php";
  $menu->agregarItem('Registro de Carrera','Registro de una nueva Carrera.','basicset/plus_48.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Helpdesk');
  $link = Administrador::URL."configuracion/helpdesk.gestion.php?todos";
  $menu->agregarItem('Gesti&oacute;n de Helpdesk','Gesti&oacute;n de Helpdesk para el sistema SAPTI.','basicset/helpdesk_48.png',$link);
  $link = Administrador::URL."configuracion/helpdesk.gestion.php?estado_helpdesk=".Helpdesk::EST01_RECIEN;
  // CONTADOR //
  $helpdesk   = new Helpdesk();
  $pendientes = Helpdesk::EST01_RECIEN;
  $pendientes = $helpdesk->contar(" estado_helpdesk = '{$pendientes}' ");
  // -CONTADOR //
  $menu->agregarItem('Helpdesk Pedientes','Registro de una nueva Carrera.','basicset/tag.png',$link,$pendientes);
  $menus[] = $menu;
  $menu = new Menu('Instituciones');
  $link = Administrador::URL."configuracion/institucion.gestion.php";
  $menu->agregarItem('Gesti&oacute;n de Instituciones','Lista de todas las instituciones configuradas para el sistema.','basicset/home.png',$link);
  $link = Administrador::URL."configuracion/institucion.registro.php";
  $menu->agregarItem('Registro de Instituci&oacute;n','Registro de una nueva  Instituci&oacute;n.','basicset/plus_48.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Materias');
  $link = Administrador::URL."configuracion/materia.gestion.php";
  $menu->agregarItem('Gesti&oacute;n de Materias','Lista de todas las Materias configuradas para el sistema.','basicset/book.png',$link);
  $link = Administrador::URL."configuracion/materia.registro.php";
  $menu->agregarItem('Registro de Mat&eacute;ria','Registro de una nueva Mat&eacute;ria.','basicset/plus_48.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Modalidades');
  $link = Administrador::URL."configuracion/modalidad.gestion.php";
  $menu->agregarItem('Gesti&oacute;n de Modalidades','Lista de todas las Modalidades configuradas para el sistema.','basicset/Flag1_Green.png',$link);
  $link = Administrador::URL."configuracion/modalidad.registro.php";
  $menu->agregarItem('Registro de Modalidad','Registro de una nueva Modalidad de titulaci&oacute;n.','basicset/plus_48.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Turnos');
  $link = Administrador::URL."configuracion/turno.gestion.php";
  $menu->agregarItem('Gesti&oacute;n de Turnos','Los turnos para los horarios.','basicset/timetable.png',$link);
  $link = Administrador::URL."configuracion/turno.registro.php";
  $menu->agregarItem('Registro de Turno','Registro de un nuevo Turno.','basicset/plus_48.png',$link);
  $menus[] = $menu;
  //----------------------------------//
  
  
  $smarty->assign("menus", $menus);
  

  var_dump($pendientes);
  $smarty->assign("pendientes", $pendientes);
  
  $smarty->assign("columnacentro", 'admin/configuracion/columna.centro.tpl');

  
  $smarty->assign("ERROR", $ERROR);
  

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'admin/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>