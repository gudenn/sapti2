<?php
try {
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Reportes');
  $smarty->assign('description','Reportes');
  $smarty->assign('keywords','Reportes');
/**
   * Menu superior
   */
  
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'reportes/','name'=>'Reportes');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'reportes/'.basename(__FILE__),'name'=>'Reportes Cambios');
  $smarty->assign("menuList", $menuList);
  //CSS
  $CSS[]  = "css/style.css";
  $smarty->assign('CSS','');

  //JS
  leerClase('Semestre');
  
  $JS[]  = "js/ajaxbuscarperfil.js";
  $smarty->assign('JS','');
   
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
  
  echo $p=$_POST['semestre_selec'];
  $semestre=new Semestre($p);
  $smarty->assign("semestre", $semestre);
  
  $sqlr="SELECT p.id, u.nombre,s.codigo,CONCAT(apellido_paterno,apellido_materno) as apellidos, COUNT( * ) AS cantidadcambios, c.tipo,p.nombre as titulo,p.estado as estadop
  FROM usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe, cambio c
  WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id=s.id AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id AND p.estado='AC'and p.tipo_proyecto='PR'AND c.proyecto_id=p.id and s.id='".$p."'
  GROUP BY p.id, c.tipo";
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
