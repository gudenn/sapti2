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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'reportes/'.basename(__FILE__),'name'=>'Reportes Proyectos Defensa');
  $smarty->assign("menuList", $menuList);
  //CSS
  $CSS[]  = "css/style.css";
  $smarty->assign('CSS','');

  //JS
  leerClase('Semestre');
  leerClase('Proyecto');
  
   $JS[]  = "js/ajaxbuscarperfil.js";
   $smarty->assign('JS','');
   
   $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
   $smarty->assign('lista'       ,'admin/reportes/lista.proyecto.tpl');
   
   function array_envia($url_array) 
           {
               $tmp = serialize($url_array);
               $tmp = urlencode($tmp);
           
               return $tmp;
           };
   
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
   echo $p=$_POST['semestre_selec'];
   $semestre=new Semestre($p);
   $smarty->assign("semestre", $semestre);
   $confirmado=  Proyecto::EST6_C;
  
   $sqlr='SELECT DISTINCT u.nombre AS NOMBRE,CONCAT(apellido_paterno," ",apellido_materno) as APELLIDO,p.nombre as PROYECTO,p.estado_proyecto as ESTADO,s.codigo as GESTION
    FROM usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe
    WHERE u.id=e.usuario_id AND e.id=i.estudiante_id and p.tipo_proyecto="PR" and p.estado_proyecto="LD" AND i.semestre_id=s.id AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id AND p.estado="AC" and s.id="'.$p.'"';
   $resultado = mysql_query($sqlr);
   $arraytribunal= array();
  
   while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
   {
 
      $arraydefensa[]=$fila;
   }
 
 
   $smarty->assign('listaproyectos'  , $arraydefensa);
   $smarty->assign('sqlr'  , array_envia($sqlr));
 
 
}

catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}


  $smarty->display('admin/full-width_1.tpl');

?>
