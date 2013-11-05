<?php
try {
  define ("MODULO", "REPORTE"); 
  require('../../_start.php');
  if(!isUserSession())
  

  
  
  
  
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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'tutor/reporte','name'=>'Tutor');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'reporte/'.basename(__FILE__),'name'=>'Reportes Estadisticos');
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
   
   
  $smarty->assign('lista'       ,'admin/reportes/reporte.tutor.tpl');
  
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
  
 
  
  
   
 $sqlr="SELECT count(*) as c
FROM proyecto p
WHERE p.tipo_proyecto='PR' AND p.estado_proyecto='CO'";
 $resultado = mysql_query($sqlr);
 $areglo= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
 
   $areglo[]=$fila;
 }
 
 $cont = $areglo[0]['c'];

 if ($cont!=0) {
    
  
 
 //Consulta Aceptados
  $sqlr='select count(*) as ac 
from usuario u,tutor t ,proyecto_tutor pt,proyecto p 
where u.id=t.usuario_id and pt.tutor_id=t.id  and pt.proyecto_id=p.id and pt.estado_tutoria="AC"
';
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
 
   $arraytribunal[]=$fila;
 }
 
 $post = $arraytribunal[0]['ac'];
 
 $ac=((double)$post/(float)$cont)*100;

 $smarty->assign('ac'  , $ac);

 ///Consulta Rechazados
   $sqlr='select count(*) as re
        from usuario u,tutor t ,proyecto_tutor pt,proyecto p 
        where u.id=t.usuario_id and pt.tutor_id=t.id  and pt.proyecto_id=p.id and pt.estado_tutoria="RE"';

 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
  
   $arraytribunal[]=$fila;
 }
 
 $pro= $arraytribunal[0]['re'];
 $pr=((double)$pro/(double)$cont)*100;
 
 $smarty->assign('pr'  , $pr);  
 
 
 
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