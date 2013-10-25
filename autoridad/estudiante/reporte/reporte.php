<?php
try {
  require('../../_start.php');

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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'estudiante/reporte','name'=>'Reportes');
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
   
   
  $smarty->assign('lista'       ,'admin/reportes/reporte.estudiante.tpl');
  
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
  
  //Materias de estudiante
  leerClase('Materia');
  $materia     = new Materia();
  $materias    = $materia->getAll();
  $materia_values[] = '';
  $materia_output[] = '- Seleccione -';
  while ($row = mysql_fetch_array($materias[0])) 
  {
    $materia_values[] = $row['id'];
    $materia_output[] = $row['nombre'];
  }
  $smarty->assign("materia_values", $materia_values);
  $smarty->assign("materia_output", $materia_output);
  $smarty->assign("materia_selected", ""); 
  
  
  leerClase('Proyecto');
  
 
  
  
  echo $p=$_POST['semestre_selec'];
  echo $m=$_POST['materia_id'];
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
 if($_POST['semestre_selec']){
 $sqlr="select COUNT(*) as c
 from inscrito i,semestre s,materia m,dicta di
 where i.semestre_id=s.id and i.dicta_id=di.id and di.materia_id=m.id and m.id='".$m."' and s.id='".$p."'";
 $resultado = mysql_query($sqlr);
 $areglo= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
 
   $areglo[]=$fila;
 }
 
 $cont = $areglo[0]['c'];

 if ($cont!==0) {
    
  
 //Estudiantes con abandono
  $sqlr="select COUNT(*) as aba
  from inscrito i,semestre s ,evaluacion ev,materia m,dicta di
  where i.semestre_id=s.id   and i.evaluacion_id=ev.id and ev.rfinal='ABA' and i.dicta_id=di.id and di.materia_id=m.id and m.id='".$m."' and s.id='".$p."'";
  $resultado = mysql_query($sqlr);
  $array= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
 
   $array[]=$fila;
 }
 
 $post = $array[0]['aba'];
 
 $aba=((double)$post/(float)$cont)*100;

 $smarty->assign('aba'  , $aba);

 
  
 //estudiantes reprovados
 $sqlr="select COUNT(*) as rp
 from inscrito i,semestre s ,evaluacion ev,materia m,dicta di
 where i.semestre_id=s.id   and i.evaluacion_id=ev.id and ev.rfinal='RPR' and i.dicta_id=di.id and di.materia_id=m.id and m.id='".$m."' and s.id='".$p."'";
 $resultado = mysql_query($sqlr);
 $array= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
  
   $array[]=$fila;
 }
 
 $pro= $array[0]['rp'];
 $rp=((double)$pro/(double)$cont)*100;
 
 $smarty->assign('rp'  , $rp);  
 
 
 
 //Esatudiantes Aprovados
  $sqlr="select COUNT(*) as ap
  from inscrito i,semestre s ,evaluacion ev,materia m,dicta di
  where i.semestre_id=s.id   and i.evaluacion_id=ev.id and ev.rfinal='APR' and i.dicta_id=di.id and di.materia_id=m.id and m.id='".$m."' and s.id='".$p."'";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
 
   $arraytribunal[]=$fila;
 }
 
 $camb  = $arraytribunal[0]['ap'];
 $ap=((double)$camb/(double)$cont)*100;

 $smarty->assign('ap'  , $ap); 

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