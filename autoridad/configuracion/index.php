<?php
try {
  define ("MODULO", "ADMIN-CONFIGURACION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

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
  $menuList[]     = array('url'=>URL.Administrador::URL.'configuracion/','name'=>'Configuraci&oacute;n');
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
  $link = Administrador::URL."configuracion/cerrarsemestre.php";
  $menu->agregarItem('Cerrar Semestre','Copiar Variables de Semestres pasados y Materias Dictadas','basicset/warning_48.png',$link);
  $link = Administrador::URL."configuracion/ordenarsemestre.php";
  $menu->agregarItem('Ordenar Semestres','Lista de todas las variables que el sistema usa','basicset/lock.png',$link);
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
  $link = Administrador::URL."configuracion/codigo_grupo.gestion.php";
  $menu->agregarItem('Gesti&oacute;n de Grupos','Lista de todos los Grupos configurados para el sistema.','basicset/book.png',$link);
  $link = Administrador::URL."configuracion/codigo_grupo.registro.php";
  $menu->agregarItem('Registro de Grupo','Registro de un nuevo Grupo.','basicset/plus_48.png',$link);
  $menus[] = $menu;
  $menu = new Menu('Modalidades');
  $link = Administrador::URL."configuracion/modalidad.gestion.php";
  $menu->agregarItem('Gesti&oacute;n de Modalidades','Lista de todas las Modalidades configuradas para el sistema.','basicset/Flag1_Green.png',$link);
  $link = Administrador::URL."configuracion/modalidad.registro.php";
  $menu->agregarItem('Registro de Modalidad','Registro de una nueva Modalidad de titulaci&oacute;n.','basicset/plus_48.png',$link);
  $menus[] = $menu;
  $menu = new Menu('T&iacute;tulos honor&iacute;ficos');
  $link = Administrador::URL."configuracion/titulo_honorifico.gestion.php";
  $menu->agregarItem('Gesti&oacute;n de T&iacute;tulos honor&iacute;ficos','Lista de todos los T&iacute;tulos honor&iacute;ficos configurados para el sistema.','basicset/licence.png',$link);
  $link = Administrador::URL."configuracion/titulo_honorifico.registro.php";
  $menu->agregarItem('Registro de T&iacute;tulos honor&iacute;ficos','Registro de una nuevos T&iacute;tulos honor&iacute;ficos.','basicset/plus_48.png',$link);
  $menus[] = $menu;
   $menus[] = $menu;
  $menu = new Menu('Lugares De Defensa');
  $link = Administrador::URL."configuracion/lugar.gestion.php";
  $menu->agregarItem('Gesti&oacute;n de Lugares de Defensa','Los Lugares de Defensa','evaluar.png',$link);
  $link = Administrador::URL."configuracion/lugar.registro.php";
  $menu->agregarItem('Registro de Lugares de Defensa','Registro de un Nuevo Lugar de Defensa','basicset/plus_48.png',$link);
  $menus[] = $menu;
  //----------------------------------//
  
  
  $smarty->assign("menus", $menus);
  

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