<?php
try {
  require('../../_start.php');
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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'docente/','name'=>'Docente');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'reporte/docente'.basename(__FILE__),'name'=>'Reportes');
  $smarty->assign("menuList", $menuList);
  //CSS
  $CSS[]  = "css/style.css";
  $smarty->assign('CSS','');

  //JS
  leerClase('Semestre');
  leerClase('Proyecto');
  
   $JS[]  = "js/ajaxbuscarperfil.js";
   $smarty->assign('JS','');
   
     function array_envia($url_array) 
           {
               $tmp = serialize($url_array);
               $tmp = urlencode($tmp);
           
               return $tmp;
           };
   
   $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
   $smarty->assign('lista'       ,'admin/reportes/lista.estudiante.tpl');
   
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
  
   $sqlr='select u.nombre as NOMBRE ,CONCAT(u.apellido_paterno," ",u.apellido_materno) as APELLIDO  ,m.nombre as MATERIA,ev.rfinal as ESTADO
   from usuario u,estudiante e ,inscrito i ,evaluacion ev,semestre s,dicta di,materia m
   where u.id=e.usuario_id and e.id=i.estudiante_id and i.evaluacion_id=ev.id and s.id=i.semestre_id and i.dicta_id=di.id and di.materia_id=m.id and s.id="'.$p.'"';
   $resultado = mysql_query($sqlr);
   $estudiante= array();
  
   while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
   {
 
      $estudiante[]=$fila;
   }
 
 
   $smarty->assign('estudiante'  , $estudiante);
   $smarty->assign('sqlr'  , array_envia($sqlr));
 
 
}

catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}


  $smarty->display('admin/full-width_1.tpl');

?>
