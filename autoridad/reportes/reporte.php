<?php
try {
  define ("MODULO", "REPORTE");
  require('../_start.php');
  if(!isUserSession())
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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'reportes/'.basename(__FILE__),'name'=>'Reportes De Estad&iacute;sticos');
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
  if(isset($_POST['tarea']) && $_POST['tarea'] == 'registrar'){
  
  
 $sqlr="SELECT count(*) as c
FROM proyecto p
WHERE p.tipo_proyecto='PR' AND p.estado_proyecto='IN'";
 $resultado = mysql_query($sqlr);
 $areglo= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
 
   $areglo[]=$fila;
 }
 
 $cont = $areglo[0]['c'];

 if ($cont!=0) {
    
  
 //proyecots postergados
 $sqlr="SELECT count(*) as p
 FROM vigencia v ,proyecto p
 WHERE v.estado_vigencia='PO'and p.id=v.proyecto_id and p.estado_proyecto='IN'";
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
 $sqlr="SELECT count(*) as pr
 FROM vigencia v ,proyecto p
 WHERE v.estado_vigencia='PR'and p.id=v.proyecto_id and p.estado_proyecto='IN'";
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
  $sqlr=" SELECT count(*) as cam
 FROM proyecto p,cambio c
 WHERE p.id=c.proyecto_id and p.estado_proyecto='IN'";
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
 FROM vigencia v ,proyecto p
 WHERE  p.id=v.proyecto_id and p.estado_proyecto='IN' AND ('".$fechahoy."'>=v.fecha_fin)";
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