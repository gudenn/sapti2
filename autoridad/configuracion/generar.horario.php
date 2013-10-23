<?php
try {
  define ("MODULO", "ADMIN-CONFIGURACION");
  require('../_start.php');
  

  /** HEADER */
  $smarty->assign('title','SAPTI - Registro Horarios');
  $smarty->assign('description','Horarios dis ponibles para las defensas');
  $smarty->assign('keywords','SAPTI,Materia,Registro');

  leerClase('Administrador');
  leerClase('Hora');
  leerClase('Dia');
  
  $diass= new Dia();
  $smarty->assign("diass", $diass);
  
  
  
  
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Registro de Materia');
  $smarty->assign("menuList", $menuList);



  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');


  $smarty->assign("ERROR", '');
  $smarty->assign('columnacentro','admin/dia/horario.tpl');
  
  
  
} 
catch(Exception $e) 
{
  mysql_query("ROLLBACK");
  $smarty->assign("ERROR", handleError($e));
}

$token                = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token',$token);

$TEMPLATE_TOSHOW = 'admin/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>