<?php
try {
 define ("MODULO", "REPORTE");
 require('../../_start.php');
  if(!isUserSession())
    header("Location: ../../login.php");  
  leerClase('Administrador');


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Reportes');
  $smarty->assign('description','Reportes');
  $smarty->assign('keywords','Reportes');
/**
   * Menu superior
   */
   
  /**
   * Menu superior
   */
  
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
 
  $menuList[]     = array('url'=>URL . Administrador::URL . 'reporte/'.basename(__FILE__),'name'=>'reportes');
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
  $JS[]  = URL_JS . "jquery.min.js";
  $smarty->assign('JS',$JS);
   $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
   
   
  $smarty->assign('lista'       ,'admin/reportes/reporte.proyecto.tpl');
  
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
  leerClase('Semestre');
  
  
  
 
  
  
  $p=$_POST['semestre_selec'];
  $semestre=new Semestre($p);
  $codigo=$semestre->codigo;
   $codigo;
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  if($_POST['semestre_selec']){
  
  
 $sqlr="SELECT count(*) as c
FROM  usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe,vigencia v
WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id=s.id AND e.id=pe.estudiante_id and p.tipo_proyecto='PR' AND pe.proyecto_id=p.id AND p.estado='AC' AND p.id=v.proyecto_id and s.id='".$p."'";
 $resultado = mysql_query($sqlr);
 $areglo= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
 
   $areglo[]=$fila;
 }
 
 $cont = $areglo[0]['c'];

 if ($cont!=0) {
    
 //Proyectos con defensa
  $sqlr="SELECT COUNT(*)as d
FROM proyecto p,defensa d
WHERE p.id=d.proyecto_id AND d.semestre='".$codigo."'";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
  
   $array[]=$fila;
 }
 
 $def = $array[0]['d'];
 
 $def=((double)$def/(float)$cont)*100;
 
 $smarty->assign('def'  , $def);
 
 
 //Defensas Privadas
 $sqlr="SELECT COUNT(*)as dp
FROM proyecto p,defensa d
WHERE p.id=d.proyecto_id and tipo_defensa='DPRI' AND d.semestre='".$codigo."'";
 $resultado = mysql_query($sqlr);
 $array= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
 
   $array[]=$fila;
 }
 
 $dp = $array[0]['dp'];
 
 $dp=((double)$dp/(float)$cont)*100;

 $smarty->assign('dp'  , $dp);
 
 //Defensas Publicas
 $sqlr="SELECT COUNT(*)as pu
FROM proyecto p,defensa d
WHERE p.id=d.proyecto_id and tipo_defensa='DPU'AND d.semestre='".$codigo."'";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
  
   $arraytribunal[]=$fila;
 }
 
 $pu = $arraytribunal[0]['pu'];
 
 $pu=((double)$pu/(float)$cont)*100;
 
 $smarty->assign('pu'  , $pu);

 //Proyectos con Tribunales
 $sqlr="SELECT COUNT(DISTINCT p.id) as tri
FROM proyecto p,tribunal t
WHERE p.id=t.proyecto_id and t.semestre='".$codigo."'";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
  
   $array[]=$fila;
 }
 
 $tri= $array[0]['tri'];
 $tri=((double)$tri/(double)$cont)*100;
 
 $smarty->assign('tri'  , $tri);  
 
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