<?php
try {
    define ("MODULO", "TRIBUNAL");
  
  require('_start.php');
   /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

  //CSS
   //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  
  $smarty->assign('CSS',$CSS);

  //JS
 $JS[]  = URL_JS . "jquery.min.js";

  //Datepicker UI
  $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";

  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  $smarty->assign('JS',$JS);
  //CREAR UNA DEFENSA
  leerClase('Carrera');
  leerClase('Consejo');
  leerClase('Usuario');
  leerClase('Estudiante');
  leerClase('Proyecto');
  $carrera = new Carrera();
  
  $menuList[]     = array('url'=>URL.Consejo::URL,'name'=>'Consejo');
  $menuList[]     = array('url'=>URL . Consejo::URL ,'name'=>'Asignar Fechas de Defensa');
  $smarty->assign("menuList", $menuList);
 
  
  $smarty->assign("carrera", $carrera);
  // $modalidad->objBuidFromPost();
  //$modalidad->save();
   $proyecto= new Proyecto();
    $proyecto_mysql  = $proyecto->getAll();
 $listasignacion= array();
 while ($proyecto_mysql && $row = mysql_fetch_array($proyecto_mysql[0]))
 {
    $datos= array();
  $proyec= new Proyecto($row['id']);
  
  if($proyec->getTotalVB()!=0 &&  $proyec->estado_proyecto!="LD")
  {
  if(($proyec->getTribunales())==($proyec->getTotalVB()))
  {
      
   $estudiantes= $proyec->getEstudiante();
   $usuarios= new Usuario($estudiantes->usuario_id);

     $datos["id"]=$estudiantes->id;
    $datos["nombre"]=$usuarios->nombre;
     $datos["apellidos"]=$usuarios->getNombreCompleto();
      $datos["nombreproyecto"]=$proyec->nombre;
      
      
     $listasignacion[]=$datos;
  }  
  }
 }
  /**
  
 $sql="select   pe.`estudiante_id` as id, u.nombre  , CONCAT(u.`apellido_paterno`, u.`apellido_materno`) as apellidos , p.`nombre`  as nombreproyecto
from `proyecto` p , `proyecto_estudiante` pe, `estudiante` e, `usuario` u
where p.`id`=pe.`proyecto_id`  and pe.`estudiante_id`=e.`id`  and e.`usuario_id`=u.`id`;
";
    $resultado   =  mysql_query($sql);
    $listasignacion= array();
 
 while ($fila = mysql_fetch_array($resultado)) 
 {
     $listasignacion[]=$fila;
    
 }
   
   */
  $smarty->assign('listasignacion',$listasignacion);
    
  
 
  if ( isset($_POST['tarea']) && $_POST['tarea'] == 'grabar' )
  {
    $carrera->objBuidFromPost();
    $carrera->save();
  }

  
  
  $smarty->assign("ERROR", $ERROR);
  

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$contenido = 'tribunal/listadefensa.tpl';
  $smarty->assign('contenido',$contenido);
  

$TEMPLATE_TOSHOW = 'tribunal/tribunal.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>