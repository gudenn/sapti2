<?php
try {
  define ("MODULO", "REPORTE");
  require('_start.php');

  leerClase("Usuario");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");


  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Reportes');
  $smarty->assign('description','Reportes');
  $smarty->assign('keywords','Reportes');
/**
   * Menu superior
   */
  leerClase('Administrador');
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'reportes/reportemodalidad.php'.basename(__FILE__),'name'=>'Reportes De Estadist&iacute;cos');
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
   
   
  $smarty->assign('lista'       ,'admin/reportes/reportemodalidad.tpl');
  
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
  
  $proyecto=new Proyecto();
  
  

  
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////
  $p=$_POST['semestre_selec'];;
  if($_POST['semestre_selec']){
      
      
 $sqlr="SELECT count(*) as c
   FROM usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe
   WHERE u.id=e.usuario_id AND e.id=i.estudiante_id and p.tipo_proyecto='PR'  AND i.semestre_id=s.id AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id AND p.estado='AC' and s.id='".$p."'";
 $resultado = mysql_query($sqlr);
 $areglo= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
 
   $areglo[]=$fila;
 }
 
 $num = $areglo[0]['c'];

 if ($num!=0) {
  
 $p=$_POST['semestre_selec'];
 $sqlr="SELECT Count(*)as d
 FROM usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe,modalidad m
 WHERE u.id=e.usuario_id and p.tipo_proyecto='PR' AND e.id=i.estudiante_id AND i.semestre_id=s.id AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id and p.modalidad_id=m.id and m.nombre='Adcripcion'  AND p.estado='AC' and s.id='".$p."'";
 $resultado = mysql_query($sqlr);
 $arraylista= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
 
   $arraylista[]=$fila;
 }
 
 $cont = $arraylista[0]['d'];
  
 $cont=(double)(($cont/$num)*100);
 $smarty->assign('cont'  , $cont);

 $sqlr="SELECT Count(*)as c
FROM usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe,modalidad m
WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id=s.id and p.tipo_proyecto='PR' AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id and p.modalidad_id=m.id and m.nombre='Trabajo Dirijido'  AND p.estado='AC'  and s.id='".$p."'";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
  
   $arraytribunal[]=$fila;
 }
 
 $post = $arraytribunal[0]['c'];
 $post=(double)(($post/$num))*100;
  $smarty->assign('post'  , $post);
  
  
  $sqlr="SELECT Count(*)as d
FROM usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe,modalidad m
WHERE u.id=e.usuario_id and p.tipo_proyecto='PR' AND e.id=i.estudiante_id AND i.semestre_id=s.id AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id and p.modalidad_id=m.id and m.nombre='Proyecto de Grado'  AND p.estado='AC'  and s.id='".$p."'";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
  
   $arraytribunal[]=$fila;
 }
 
 $pro = $arraytribunal[0]['d'];
 $pro=(double)(($pro/$num)*100);
  $smarty->assign('pro'  , $pro);
 
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