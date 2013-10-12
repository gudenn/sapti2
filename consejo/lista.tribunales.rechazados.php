<?php
try {
    define ("MODULO", "TRIBUNAL");
  
  require('_start.php');
  
  /** HEADER */
  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

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

  //CREAR UN TIPO   DE DEF
  leerClase('Tribunal');
  leerClase("Proyecto");
  leerClase("Usuario");
  leerClase("Docente");
  leerClase("Estudiante");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");
  leerClase("Consejo");
  leerClase("Proyecto_estudiante");
$menuList[]     = array('url'=>URL.Consejo::URL,'name'=>'Consejo');
  $menuList[]     = array('url'=>URL . Consejo::URL ,'name'=>'Proyectos Asignados');
  $smarty->assign("menuList", $menuList);
 
  
   $proyectostribunales= array();
    $proyec= new Proyecto();
    //var_dump( $proyec->getProyectoAsignados());
   
   $usuario = new Usuario();
//$smarty->assign('rows', $rows);

 $usuario_id     = array();
 $usuario_nombre = array();
$sql="select   DISTINCT(p.id) ,u.nombre , CONCAT(u.apellido_paterno , u.apellido_materno) apellidos, p.nombre as nombreproyecto
from  usuario  u,  estudiante e  , proyecto_estudiante  pe , proyecto  p , tribunal t
where    u.id= e.usuario_id  and e.id= pe.estudiante_id  and pe.proyecto_id= p.id and p.id= t.proyecto_id
and t.accion='RE';";
 $resultado= mysql_query($sql);
 $arraytribunal= array();
 
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
   
   $arraytribunal[]=$fila;
 }

$smarty->assign('arraytribunal'  , $arraytribunal);

 while ($usuario_mysql && $row = mysql_fetch_array($usuario_mysql[0]))
 {
   $usuario_id[]     = $row['id'];
   $usuario_nombre[] = $row['nombre'];
   $rows=$row;
 }
 
 $rows = array();
$usuario = new Usuario();
//$smarty->assign('rows', $rows);
 $usuario_mysql  = $usuario->getAll();
 $usuario_id     = array();
 $usuario_nombre = array();
 while ($usuario_mysql && $row = mysql_fetch_array($usuario_mysql[0]))
 {
   $usuario_id[]     = $row['id'];
   $usuario_nombre[] = $row['nombre'];
   $rows=$row;
 }
// $smarty->assign('filas'  , $rows);
$smarty->assign('usuario_id'  , $usuario_id);
$smarty->assign('usuario_nombre', $usuario_nombre);


$proyecto= new Proyecto();
$proyecto_sql= $proyecto->getAll();
$proyecto_id= array();
$proyecto_nombre=array();
while ($proyecto_sql && $rows = mysql_fetch_array($proyecto_sql[0]))
 {
   $proyecto_id[]     = $rows['id'];
   $proyecto_nombre[] = $rows['nombre_proyecto'];
 }


$smarty->assign('proyecto_id',$proyecto_id);
$smarty->assign('proyecto_nombre',$proyecto_nombre);
  

  if(isset($_POST['buscar']))
  {
   echo   $_POST['codigosis'];
    $estudiante = new Estudiante(false,$_POST['codigosis']);
    $proyecto   = new Proyecto();
    $proyecto_aux = $estudiante->getProyecto();
    if ($proyecto_aux)
      $proyecto = $proyecto_aux;
    else
    {
      //@todo no tiene proyecto 
      
    }
  
    $usuariobuscado= new Usuario($estudiante->usuario_id);
  //echo  $estudiante->i;
  //  var_dump( $proyecto->getArea());
   // echo $estudiante->codigo_sis;
     $smarty->assign('usuariobuscado',  $usuariobuscado);
    $smarty->assign('estudiantebuscado', $estudiante);
     $smarty->assign('proyectobuscado', $proyecto);
      $smarty->assign('proyectoarea', $proyecto->getArea());  
      
   // return $proyecto;
    //$proyecto->getProyectoAprobados();
    
  //  var_dump($proyecto->getProyectoAprobados());
   // $
   
    
  }
  
   if ( isset($_POST['tarea']) && $_POST['tarea'] == 'grabar' )
  {
     
     /**
      $proyecto_tribunal->objBuidFromPost();
      $proyecto_tribunal->estado = Objectbase::STATUS_AC;
      $proyecto_tribunal->save();
    */
     if (isset($_POST['ids']))
     foreach ($_POST['ids'] as $id)
     {
       echo $id;
               $tribunal= new Tribunal();
          //     $smarty->assign("tribunal",$tribunal);
             
               $tribunal->usuario_id =$id;
                $tribunal->estado = Objectbase::STATUS_AC;
               //$tribunal->proyecto_tribunal_id=$proyecto_tribunal->id;;
                $tribunal->objBuidFromPost();
               $tribunal->save();
     }
   }

  
  
  $smarty->assign("ERROR", $ERROR);
  

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$contenido = 'tribunal/lista.rechazados.tpl';
$smarty->assign('contenido',$contenido);


$TEMPLATE_TOSHOW = 'tribunal/tribunal.3columnas.tpl';

$smarty->display($TEMPLATE_TOSHOW);

?>