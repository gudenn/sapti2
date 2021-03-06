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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'reportes/'.basename(__FILE__),'name'=>'Reportes Cambios');
  $smarty->assign("menuList", $menuList);
  //CSS
  $CSS[]  = "css/style.css";
  $smarty->assign('CSS','');

  //JS
   leerClase('Semestre');
   $JS[]  = URL_JS . "jquery.min.js";
   $smarty->assign('JS',$JS);
   
  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/reportes/lista_cambio.tpl');
   
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
  
  $p=$_POST['semestre_selec'];
  $semestre=new Semestre($p);
  $smarty->assign("semestre", $semestre);
  
  $sqlr="SELECT u.id,p.id, u.nombre,s.codigo,s.id,CONCAT(apellido_paterno,' ',apellido_materno) as apellidos, COUNT( * ) AS cantidadcambios, c.tipo,p.nombre as titulo,p.estado as estadop,e.numero_cambio_leve as cambioleve,e.numero_cambio_total as cambiototal
  FROM usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe, cambio c,dicta d
  WHERE u.id=e.usuario_id AND e.id=i.estudiante_id and d.semestre_id=s.id and i.dicta_id=d.id AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id and i.estado_inscrito='AC' AND p.estado='AC'and p.tipo_proyecto='PR' and p.estado_proyecto='IN' AND c.proyecto_id=p.id and s.id='".$p."'
  GROUP BY c.tipo,u.id";
  $resultado = mysql_query($sqlr);
  $arraytribunal= array();
  
  while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
  {
 
   $arraytribunal[]=$fila;
  }
 
   
   $smarty->assign('listadocentes'  , $arraytribunal);
 
 
  }
      catch(Exception $e) 
  {
      $smarty->assign("ERROR", handleError($e));
  }
      $smarty->display('admin/full-width_1.tpl');
?>
