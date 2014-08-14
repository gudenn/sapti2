<?php
try {
   define ("MODULO", "REPORTE");
  require('../../_start.php');
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
  $menuList[]     = array('url'=>URL . Administrador::URL . 'reporte/'.basename(__FILE__),'name'=>'Reportes');
  $smarty->assign("menuList", $menuList);
  //CSS
  $CSS[]  = "css/style.css";
  $smarty->assign('CSS','');

  //JS
  leerClase('Semestre');
  leerClase('Proyecto');
  leerClase('Materia');
  
  
   //funcion para serializar
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
   
   // Materia del estudiante
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
  
//lista de estudiantes inscritos
   $p=$_POST['semestre_selec'];
   $semestre=new Semestre($p);
   $smarty->assign("semestre", $semestre);
   $confirmado=  Proyecto::EST6_C;
  
    $sqle='u.nombre as NOMBRE ,CONCAT(u.apellido_paterno," ",u.apellido_materno) as APELLIDO  ,m.nombre as MATERIA,ev.rfinal as ESTADO
   from usuario u,estudiante e ,inscrito i ,evaluacion ev,semestre s,dicta di,materia m
   where u.id=e.usuario_id and e.id=i.estudiante_id and i.evaluacion_id=ev.id and s.id=i.semestre_id and i.dicta_id=di.id and di.materia_id=m.id and s.id="'.$p.'"';
    
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
   $smarty->assign('sqle'  , array_envia($sqle));
 
 
}

catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}


  $smarty->display('admin/full-width_1.tpl');

?>
