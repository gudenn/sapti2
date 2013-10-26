<?php
try {
  define ("MODULO", "ADMIN-ESTUDIANTE-REPORTE");
  require('../../_start.php');
  if(!isAdminSession())
    header("Location: ../../login.php");  
  require('_start.php');
   
  

  
  
  
  
  leerClase("Usuario");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");
  leerClase('Administrador');


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Reportes');
  $smarty->assign('description','Reportes');
  $smarty->assign('keywords','Reportes');
   /**
   * Menu superior
   */
  
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'reportes/','name'=>'Reportes');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'reportes/'.basename(__FILE__),'name'=>'Reportes De Estadisticos');
  $smarty->assign("menuList", $menuList);

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  //$CSS[]  = URL_CSS . "pg.css";
  $smarty->assign('CSS',$CSS);
  
    
  //Datepicker UI
  $JS[]  = URL_JS ."reporte/jquery-1.4.2.min.js";
  $JS[]  = URL_JS ."reporte/jquery.js";
  $JS[]  = URL_JS . "reporte/highcharts.js";
  $JS[]  = URL_JS . "reporte/themes/grid.js"; 
  
  
  $JS[]  = URL_JS . "reporte/modules/exporting.js";
     
  $smarty->assign('JS',$JS);
  
  
  
  $smarty->assign('JS',$JS);
  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
   
   
  $smarty->assign('lista'       ,'admin/reportes/reporte.tpl');
  
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
  
  
  leerClase('Proyecto');
  
 
  
  
  $p=$_POST['semestre_selec'];;
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  if($_POST['semestre_selec']){
  
  
 $sqlr="SELECT count(*) as c
 FROM  usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe,vigencia v
 WHERE u.id=e.usuario_id and e.id=i.estudiante_id and i.semestre_id=s.id and e.id=pe.estudiante_id and pe.proyecto_id=p.id and p.es_actual=1 and s.id='".$p."'";
 $resultado = mysql_query($sqlr);
 $areglo= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
 
   $areglo[]=$fila;
 }
 
 $cont = $areglo[0]['c'];

 if ($cont!==0) {
    
  
 //proyecots postergados
  $sqlr="SELECT count(*) as p 
  FROM  usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe,vigencia v
  WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id=s.id AND e.id=pe.estudiante_id and p.tipo_proyecto='PE' AND pe.proyecto_id=p.id AND p.estado='AC' AND p.id=v.proyecto_id AND v.estado_vigencia='PO' and s.id='".$p."'";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
 
   $arraytribunal[]=$fila;
 }
 
 $post = $arraytribunal[0]['p'];
 
 $pos=((double)$post/(float)$cont)*100;

 $smarty->assign('pos'  , $pos);

 
  
 //proyecots con prorroga
 $sqlr="SELECT count(*)as pr
 FROM  usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe,vigencia v
 WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id=s.id AND e.id=pe.estudiante_id and p.tipo_proyecto='PE' AND pe.proyecto_id=p.id AND p.estado='AC' AND p.id=v.proyecto_id AND v.estado_vigencia='PR' and s.id='".$p."'";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
  
   $arraytribunal[]=$fila;
 }
 
 $pro= $arraytribunal[0]['pr'];
 $pr=((double)$pro/(double)$cont)*100;
 
 $smarty->assign('pr'  , $pr);  
 
 
 
 //proyecots con cambio
  $sqlr="SELECT  COUNT( * ) AS cam
 FROM usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe, cambio c
 WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id=s.id AND e.id=pe.estudiante_id and p.tipo_proyecto='PE' AND pe.proyecto_id=p.id AND p.estado='AC'AND c.proyecto_id=p.id and s.id='".$p."'";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
 
   $arraytribunal[]=$fila;
 }
 
 $camb  = $arraytribunal[0]['cam'];
 $cam=((double)$camb/(double)$cont)*100;

 $smarty->assign('cam'  , $cam); 

//vencidos
  $fechahoy=  date('Y-m-d');
  $sqlr="SELECT count(*) as vencido
   FROM  usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe,vigencia v
   WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id=s.id AND e.id=pe.estudiante_id and p.tipo_proyecto='PE' AND pe.proyecto_id=p.id AND p.estado='AC' AND p.id=v.proyecto_id AND ('".$fechahoy."'>=v.fecha_fin)and s.id='".$p."'";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
 
   $arraytribunal[]=$fila;
 }
 
  $ve = $arraytribunal[0]['vencido'];
 

     $v=((double)$ve/(double)$cont)*100;
     
 
 
 $smarty->assign('v'  , $v);
 }
}

  //No hay ERROR
  $smarty->assign("ERROR",'');
  $smarty->assign("URL",URL); 
 

}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
 $smarty->display('admin/full-width_1.tpl');


?>