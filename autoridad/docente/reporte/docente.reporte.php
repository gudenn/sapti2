<?php
try {
  define ("MODULO", "REPORTE");
  require('../../_start.php');
  if(!isUserSession())
    header("Location: ../../login.php");  
  /** HEADER */
  $smarty->assign('title','Reportes');
  $smarty->assign('description','Reportes');
  $smarty->assign('keywords','Reportes');
/**
   * Menu superior
   */
  
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
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
   
   $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
   $smarty->assign('lista'       ,'admin/reportes/lista.docente.tpl');
   
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
   $p=$_POST['semestre_selec'];
   $semestre=new Semestre($p);
   $smarty->assign("semestre", $semestre);
   $confirmado=  Proyecto::EST6_C;
  
   $sqlr='select u.nombre as NOMBRE ,CONCAT(u.apellido_paterno," ",u.apellido_materno) as APELLIDO ,m.nombre as MATERIA,COUNT(materia_id) as INSCRITOS
   from usuario u, docente d ,dicta di,materia m ,inscrito i ,evaluacion ev ,semestre s
   where u.id=d.usuario_id and di.docente_id=d.id and di.materia_id=m.id and i.dicta_id=di.id and ev.id=i.evaluacion_id and s.id=di.semestre_id and s.id="'.$p.'"
   GROUP BY m.nombre';
   $resultado = mysql_query($sqlr);
   $docentes= array();
  
   while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
   {
 
      $docentes[]=$fila;
   }
   //$sql=
 
   $smarty->assign('listadocentes'  , $docentes);
   $smarty->assign('sqlr'  , array_envia($sqlr));
 
 
}

catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}


  $smarty->display('admin/full-width_1.tpl');

?>
