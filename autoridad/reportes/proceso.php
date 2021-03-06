<?php
try {
  define ("MODULO", "REPORTE");
  require('../_start.php');
    if(!isUserSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Reportes');
  $smarty->assign('description','Reportes');
  $smarty->assign('keywords','Reportes');
/**
   * Menu superior
   */
  
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');

  $menuList[]     = array('url'=>URL . Administrador::URL . 'reportes/'.basename(__FILE__),'name'=>'Reportes Proceso');
  $smarty->assign("menuList", $menuList);
  //CSS
  $CSS[]  = "css/style.css";
  $smarty->assign('CSS','');

  //JS
  leerClase('Semestre');
  leerClase('Proyecto');
  
   $JS[]  = URL_JS . "jquery.min.js";
   $smarty->assign('JS',$JS);
   
   $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
   $smarty->assign('lista'       ,'admin/reportes/lista.tpl');
   
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
  //lista de proyectos en procesos
   $p=$_POST['semestre_selec'];
   $semestre=new Semestre($p);
   $smarty->assign("semestre", $semestre);
   $confirmado=  Proyecto::EST6_C;
  
   $sqlr='SELECT p.id,u.nombre,s.codigo,p.nombre as titulo,CONCAT(apellido_paterno," ",apellido_materno) as apellidos,p.estado as estadop
    FROM usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe,dicta d
    WHERE u.id=e.usuario_id AND e.id=i.estudiante_id and d.semestre_id=s.id and i.dicta_id=d.id and p.tipo_proyecto="PR" and p.estado_proyecto="IN" AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id AND p.estado="AC" and s.id="'.$p.'"';
   $resultado = mysql_query($sqlr);
   $arraytribunal= array();
  
   while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
   {
 
      $arraytribunal[]=$fila;
   }
 
 
   $smarty->assign('listadocentes'  , $arraytribunal);
   $smarty->assign('sqlr'  , $sqlr);
 
 
}

catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}


  $smarty->display('admin/full-width_1.tpl');

?>
