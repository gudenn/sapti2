<?php
try {
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Reportes');
  $smarty->assign('description','Reportes');
  $smarty->assign('keywords','Reportes');
/**
   * Menu superior
   */
  
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'reportes/','name'=>'Reportes');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'reportes/'.basename(__FILE__),'name'=>'Reportes Modalidad');
  $smarty->assign("menuList", $menuList);
  //CSS
  $CSS[]  = "css/style.css";
  $smarty->assign('CSS','');

  //JS
  leerClase('Semestre');
  leerClase('Modalidad');
  
   $JS[]  = "js/ajaxbuscarperfil.js";
   $smarty->assign('JS','');
   
   $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/reportes/lista_modalidad.tpl');
   
$sql2 = "SELECT *
                FROM semestre";
   $resultsem = mysql_query($sql2);
   
   $semestre_values[] = '';
   $semestre_output[] = '- Seleccione -';
  while ($row2 = mysql_fetch_array($resultsem, MYSQL_ASSOC)) {
       $semestre_values[] = $row2['id'];
       $semestre_output[] = $row2['codigo'];
 }
  $smarty->assign("semestre_values", $semestre_values);
  $smarty->assign("semestre_output", $semestre_output);
  $smarty->assign("semestre_selected", "");
  //CREAR UN TIPO   DE DEF
 
  $sql = "SELECT *
                FROM modalidad";
   $resultsem = mysql_query($sql);
   
   $modalidad_values[] = '';
   $modalidad_output[] = '- Seleccione -';
  while ($row2 = mysql_fetch_array($resultsem, MYSQL_ASSOC)) {
       $modalidad_values[] = $row2['id'];
       $modalidad_output[] = $row2['nombre'];
 }
  $smarty->assign("modalidad_values", $modalidad_values);
  $smarty->assign("modalidad_output", $modalidad_output);
  $smarty->assign("modalidad_selected", "");
  
  
  
  echo $m=$_POST['modalidad_selec'];
   $p=$_POST['semestre_selec'];
  $semestre=new Semestre($p);
  $modalidad=new Modalidad($m);
  $smarty->assign("modalidad", $modalidad);
  $smarty->assign("semestre", $semestre);
  
    $sqlr="SELECT p.id,u.nombre,s.codigo,p.nombre as titulo,CONCAT(apellido_paterno,apellido_materno) as apellidos,p.estado as estadop,m.nombre as modalidad
FROM usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe,modalidad m
WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id=s.id AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id AND p.modalidad_id=m.id and m.id='".$m."' and s.id='".$p."'";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
  // $arraytribunal=$fila;
   
   //array('name' => $fila["id"], 'home' => $fila["nombre"],'cell' => $fila["apellidos"], 'email' => 'john@myexample.com');
   
   $arraytribunal[]=$fila;
 }
 
 $obj_mysql  = $arraytribunal;
 // $objs_pg    = new Pagination($obj_mysql, 'g_cambios','',false,10);
 $smarty->assign('listadocentes'  , $arraytribunal);
 
 
}

catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

//if (isset($_GET['tlista']) && $_GET['tlista']) //recargamos la tabla central
 // $smarty->display('admin/listas.lista.tpl'); 
//else
  $smarty->display('admin/full-width_1.tpl');

?>
