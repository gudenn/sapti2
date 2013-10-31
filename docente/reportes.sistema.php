<?php
try {
    define ("MODULO", "DOCENTE");
  require('_start.php');
  if(!isDocenteSession())
    header("Location: login.php"); 
  
  leerClase("Evento");
  leerClase("Pagination");
  leerClase('Docente');
  
  /** HEADER */
  $smarty->assign('title','Reportes del Sistema');
  $smarty->assign('description','Generar Reportes de las Asignaturas del Sistema');
  $smarty->assign('keywords','Gestion,Reportes,Sistema');

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $smarty->assign('JS',$JS);
  
   /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'reportes.sistema.php','name'=>'Reportes de Sistema');
  $smarty->assign("menuList", $menuList);

  $docenteid=getSessionDocente();
  
     $sql1 = "SELECT di.id as dic, CONCAT(ma.nombre, ' ',cg.nombre) as mat
FROM dicta di, docente dt, materia ma, codigo_grupo cg, semestre se
WHERE di.docente_id=dt.id
AND di.materia_id=ma.id
AND di.codigo_grupo_id=cg.id
AND di.semestre_id=se.id
AND se.activo=1
AND dt.id='".$docenteid->id."'
ORDER BY ma.nombre, cg.nombre
";
   $resultmate = mysql_query($sql1);
   
   $materia_values[] = '';
   $materia_output[] = '- Seleccione -';
  while ($row1 = mysql_fetch_array($resultmate, MYSQL_ASSOC)) {
       $materia_values[] = $row1['dic'];
       $materia_output[] = $row1['mat'];
 }
  $smarty->assign("materia_values", $materia_values);
  $smarty->assign("materia_output", $materia_output);
  $smarty->assign("materia_selected", "");
  
   $tiporeporte_values[] = '';
   $tiporeporte_output[] = '- Seleccione -';
  
       $tiporeporte_values[] = 0;
       $tiporeporte_values[] = 1;
       $tiporeporte_values[] = 2;
       $tiporeporte_output[] = 'Lista de Estudiantes Inscritos';
       $tiporeporte_output[] = 'Lista de Estudiantes Evaluados';
       $tiporeporte_output[] = 'Lista de Estudiantes Aprobados';
 
  //$smarty->assign("tiporeporte_values", $tiporeporte_values);
  //$smarty->assign("tiporeporte_output", $tiporeporte_output);
  //$smarty->assign("tiporeporte_selected", "");

  //No hay ERROR
  $smarty->assign("ERROR",'');
  $smarty->assign("URL",URL);  

}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('docente/full-width.reportes.sistema.tpl');
?>