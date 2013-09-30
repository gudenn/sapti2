<?php
try {
  require('_start.php');
  global $PAISBOX;

  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

  //CSS
 //CSS
  $CSS[]  = URL_JS . "jQfu/css/jquery.fileupload-ui.css";
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_CSS . "spams.css";
  $CSS[]  = URL_JS  . "validate/validationEngine.jquery.css";
  $CSS[]  = URL_CSS . "box/box.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.1.9.1.js";

  //Datepicker UI
  $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";

  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  $smarty->assign('JS',$JS);
  //JS
  $JS[]  = "js/jquery.js";
  $smarty->assign('JS','');

  //CREAR UN TIPO   DE DEF
  leerClase('Tribunal');
  leerClase("Proyecto");
  leerClase("Usuario");
  leerClase("Docente");
  leerClase("Estudiante");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");
  leerClase("Modalidad");
  leerClase("Proyecto_tribunal");
  leerClase("Proyecto_estudiante");

 
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



//contruyendo el usuario
  

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
  


  $proyecto_tribunal= new Proyecto_tribunal();
   
  if ( isset($_POST['tarea']) && $_POST['tarea'] == 'grabar' )
  {
  
       echo $_POST['proyecto_tribunal_id'];
     
    
       
       $sqlls="SELECT t.id as llaveid FROM tribunal t WHERE  t.proyecto_tribunal_id=".$_POST['proyecto_tribunal_id'].";";
      $resultadoff = mysql_query($sqlls);

 $contador=0;
 
    foreach ($_POST['ids'] as $id)
     {
      echo $id;
              
     }
 
 while ($filas = mysql_fetch_array($resultadoff, MYSQL_ASSOC))
    { 
   if (isset($_POST['ids']))
   {
     echo $filas['llaveid'];
  $tribunalesw= new Tribunal((int)$filas['llaveid']);
  $tribunalesw->proyecto_tribunal_id=$_POST['proyecto_tribunal_id'];
  $tribunalesw->docente_id =$_POST['ids'][$contador];
  $tribunalesw->archivo="";
  $tribunalesw->accion="";
  $tribunalesw->estado = Objectbase::STATUS_AC;
  $tribunalesw->save();
   }
$contador++;
   }      
    
   }

   if(isset($_GET['editar']) && isset($_GET['proyecto_id']) && is_numeric($_GET['proyecto_id']) )
  {
     
       $proyectos =  new Proyecto($_GET['proyecto_id']);
      
      $estudiante= $proyectos->getEstudiante();
      $usuario =  new Usuario($estudiante->usuario_id);
      $modalidad=  new Modalidad( $proyectos->modalidad_id);
      $areaproyecto= $proyectos->getArea();
  
       $smarty->assign('proyecto'  , $proyectos);
        $smarty->assign('modalidad'  , $modalidad);
        $smarty->assign('usuario'  , $usuario);
        $smarty->assign('estudiante'  ,$estudiante); 
        $smarty->assign('area', $areaproyecto);
     
    
     
     
     
     
  $sqlr="SELECT  d.id, u.nombre, CONCAT(u.apellido_paterno, u.apellido_materno) as apellidos
FROM  usuario u ,docente d
WHERE  u.id=d.usuario_id and u.estado='AC' and  d.estado='AC' and d.id not in(
select dd.id
from  proyecto p, tribunal t ,docente dd
where     p.id=t.proyecto_id  and t.docente_id= dd.id  and p.estado='AC' and t.estado='AC' and dd.estado='AC' and p.id=".$_GET['proyecto_id'].");";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
 
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
         { 
   
   
   
        $listaareas=array();
        $lista_areas=array();
        $lista_areas[] = $fila["id"];
        $lista_areas[] =  $fila["nombre"];
        $lista_areas[] =  $fila["apellidos"];
 
 
$sqla="select  a.`nombre`
from `docente` d , `apoyo` ap , `area` a
where  d.`id`=ap.`docente_id` and a.`id`=ap.`area_id` and d.`estado`='AC' and ap.`estado`='AC' and a.`estado`='AC'and d.`id`=".$fila["id"];
 $resultadoa = mysql_query($sqla);
 
  while ($filas = mysql_fetch_array($resultadoa, MYSQL_ASSOC)) 
  {
     $listaareas[]=$filas;
  }
  $lista_areas[]=$listaareas;
  $arraytribunal[]= $lista_areas;
 }
 $smarty->assign('listadocentes'  , $arraytribunal);
  
     
     //////////////////////////seleccionados////////////////////
   $sqlselec="SELECT  d.id, u.nombre, CONCAT (u.apellido_paterno, u.apellido_materno) as apellidos
FROM  usuario u ,docente d
WHERE  u.id=d.usuario_id and u.estado='AC' and   d.id  in(
select dd.id
from  proyecto p, tribunal t ,docente dd
where   p.id=t.proyecto_id  and t.docente_id= dd.id and  p.estado='AC' and t.estado='AC' and dd.estado='AC'  and p.id=".$_GET['proyecto_id'].");";
 $resultadoselect = mysql_query($sqlselec);
 $arraytribunalselec= array();
 
 while ($filaselec = mysql_fetch_array($resultadoselect, MYSQL_ASSOC)) 
         { 
   
   
   
        $listaareas=array();
        $lista_areas=array();
        $lista_areas[] = $filaselec["id"];
        $lista_areas[] =  $filaselec["nombre"];
        $lista_areas[] =  $filaselec["apellidos"];
 
 
$sqla="select  a.`nombre`
from `docente` d , `apoyo` ap , `area` a
where  d.`id`=ap.`docente_id` and a.`id`=ap.`area_id` and d.`estado`='AC' and ap.`estado`='AC' and a.`estado`='AC'and d.`id`=".$filaselec["id"];
 $resultadoa = mysql_query($sqla);
 
  while ($filas = mysql_fetch_array($resultadoa, MYSQL_ASSOC)) 
  {
     $listaareas[]=$filas;
  }
  $lista_areas[]=$listaareas;
  $arraytribunalselec[]= $lista_areas;
 }
 $smarty->assign('listadocenteselec'  , $arraytribunalselec);
 $smarty->assign('idproyecto'  , $_GET['proyecto_id']);
     
         
      
  }
  
  

  
  
  $smarty->assign("ERROR", $ERROR);
  

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
$contenido = 'tribunal/editartribunal.tpl';
  $smarty->assign('contenido',$contenido);


$TEMPLATE_TOSHOW = 'tribunal/tribunal.3columnas.tpl';
//$TEMPLATE_TOSHOW = 'tribunal/editartribunal.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>