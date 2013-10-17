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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'reportes/'.basename(__FILE__),'name'=>'Proyectos vencidos');
  $smarty->assign("menuList", $menuList);
  //CSS
  $CSS[]  = "css/style.css";
  $smarty->assign('CSS','');

  //JS
   leerClase('Semestre');
  
   $JS[]  = "js/ajaxbuscarperfil.js";
   $smarty->assign('JS','');
   
   $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
   $smarty->assign('lista'       ,'admin/reportes/lista_vencido.tpl');
  
  
   
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
  
  //fecha de hoy para comparar
   $fechahoy=  date('Y-m-d');
  

    $sqlr="SELECT p.id,u.nombre,s.codigo,CONCAT(apellido_paterno,apellido_materno) as apellidos ,p.nombre as titulo
    FROM  usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe,vigencia v
    WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id=s.id AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id and p.tipo_proyecto='PE' AND p.estado='AC' AND p.id=v.proyecto_id AND ('".$fechahoy."'>=v.fecha_fin)and s.id='".$p."'";
   
    $resultado = mysql_query($sqlr);
    $array= array();
  
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
    {
 
                  $array[]=$fila;
    }
 
     $obj_mysql  = $array;
     $smarty->assign('listavencido'  , $array);
 
 
}

catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

//if (isset($_GET['tlista']) && $_GET['tlista']) //recargamos la tabla central
 // $smarty->display('admin/listas.lista.tpl'); 
//else
  $smarty->display('admin/full-width_1.tpl');

?>
