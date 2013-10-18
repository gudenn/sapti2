<?php
try {
  define ("MODULO", "ADMIN-PERFIL");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Estudiantes');
  $smarty->assign('description','Gesti&oacute;n de Estudiantes');
  $smarty->assign('keywords','Gesti&oacute;n de Estudiantes');

  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');

 /**
  * Clases
  */
  leerClase('Administrador');
  leerClase('Semestre');
  leerClase('Proyecto');
  $semestre=new Semestre();

  $activo=  $semestre->getActivo();
  echo $activo->s;

  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Administrador::URL,'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'pendientes/','name'=>'Formularios Pendientes');
  
  
  $smarty->assign("menuList", $menuList);
  
  
   $estado=  Proyecto::EST5_P;
 
   $sqlr="SELECT count(*)as c
FROM usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe
WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id=s.id AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id and p.estado_proyecto='".$estado."' and p.estado='AC'";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
 
   $arraytribunal[]=$fila;
 }
 
 
 //$cantp=  sizeof($arraytribunal);
  $cantp=$arraytribunal[0]['c'];
 
 
 



  /**
   * Menu central
   */
  //----------------------------------//
  leerClase('Menu');
 
  $menu = new Menu('Pendientes');
  $link = Administrador::URL."pendientes/pendientes.gestion.php";

  $menu->agregarItem('Gesti&oacute;n de Formularios Pendientes','Confirmar Formularios Pendientes','basicset/people.png',$link,$cantp);
  $link = Administrador::URL."estudiante/estudiante.registro.php";
   
  $menus[] = $menu;
  
  //----------------------------------//
  
  
  $smarty->assign("menus", $menus);

  
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