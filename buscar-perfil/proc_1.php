<?php
try {
  require('_start.php');
  global $PAISBOX;

  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

  //CSS
  $CSS[]  = "css/style.css";
  $smarty->assign('CSS','');

  //JS
  $JS[]  = "js/jquery.js";
  $smarty->assign('JS','');

  //CREAR UN TIPO   DE DEF
  
  
  
 
 $q=$_POST[q];
  
  $sqlr="SELECT p.id,u.nombre,s.codigo,p.nombre as titulo,CONCAT(apellido_paterno,apellido_materno) as apellidos,p.estado as estadop
FROM usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe
WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id=s.id and p.tipo_proyecto='PR' AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id 
AND (
p.nombre LIKE  '%$q%'
OR u.nombre LIKE  '%$q%' OR u.apellido_paterno LIKE  '%$q%' OR u.apellido_materno LIKE  '%$q%' OR p.numero_asignado LIKE  '%$q%' OR s.codigo LIKE  '%$q%'
);";
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
 //$smarty->assign("objs"     ,$objs_pg->objs);
 //$smarty->assign("pages"    ,$objs_pg->p_pages);
  $q=strtoupper($q);
  $smarty->assign('q'  , $q);
 

  
  
  $smarty->assign("ERROR", $ERROR);
  

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'buscarperfil/listabusqueda.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>