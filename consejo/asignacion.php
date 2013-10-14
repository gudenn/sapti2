<?php
try {
    define ("MODULO", "CONSEJO");
  
  require('_start.php');
  
  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  $CSS[]  = URL_CSS . "spams.css";
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
  leerClase("Proyecto_estudiante");
  leerClase("Lugar");
  leerClase("Tipo_defensa");
  leerClase("Defensa");
  leerClase("Semestre");
    
  
  
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
  

$lugar= new Lugar();
$lugar_sql= $lugar->getAll();

$lugar_id= array();
$lugar_nombre=array();
while ($lugar_sql && $ro = mysql_fetch_array($lugar_sql[0]))
 {
   $lugar_id[]     = $ro['id'];
   $lugar_nombre[] = $ro['nombre'];
 }

$smarty->assign('lugar_id',$lugar_id);
$smarty->assign('lugar_nombre',$lugar_nombre);


$tipo= new Tipo_defensa();
$tipo_sql= $tipo->getAll();

$smarty->assign('accion', array(
    Defensa::DEFENSA_PUBLICA =>  "PUBLICA",
      Defensa::DEFENSA_PRIVADA =>  "PRIVADA"
                           ));

  if(isset($_GET['estudiante_id']))
  {
    
  //  echo $_GET['estudiante_id'];
      $estudiante = new Estudiante($_GET['estudiante_id']);
      
       $proyecto     = new Proyecto();
   
    $proyecto_aux = $estudiante->getProyecto();
    if ($proyecto_aux)
      $proyecto = $proyecto_aux;
    else
    {
      //@todo no tiene proyecto 
       echo "<script>alert('El Estudiante no Tiene Proyecto');</script>";
      
    }
      
     $usuariobuscado= new Usuario($estudiante->usuario_id);
   $smarty->assign('usuariobuscado',  $usuariobuscado);
   $smarty->assign('estudiantebuscado', $estudiante);
   $smarty->assign('proyectobuscado', $proyecto);
   
   $smarty->assign('proyectoarea', $proyecto->getArea());


 $sqlr="SELECT  DISTINCT(d.id), u.nombre, CONCAT (u.apellido_paterno,u.apellido_materno) as apellidos
FROM  usuario u ,docente d ,  tribunal  t
WHERE  u.`id`= d.`usuario_id` and   d.`id`= t.`docente_id` and   t.estado='AC' and u.`estado`='AC'  and d.`estado`='AC' and t.`proyecto_id`=1;";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();

 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
{ 
       
        $lista_areas=array();
        $lista_areas[] = $fila["id"];
        $lista_areas[] =  $fila["nombre"];
        $lista_areas[] =  $fila["apellidos"];
 
       $listatiempo=array();

        $sqltiempo="select  d.`id` , d.`nombre` , t.`nombre` as nombreturno
        from `dia` d, `horario_doc` hd , `turno` t
        where  d.`id`=hd.`dia_id` and hd.`turno_id`=t.`id` and  d.`estado`='AC' and hd.`estado`='AC'and t.`estado`='AC' and hd.`docente_id`=".$fila["id"].";";
        $resultadotiempo= mysql_query($sqltiempo);
 
  while ($filatiempo = mysql_fetch_array($resultadotiempo, MYSQL_ASSOC)) 
  {
     $listatiempo[]=$filatiempo;
  }
  //$lista_tiempo[]= $listatiempo;
  $lista_areas[]= $listatiempo;
  $arraytribunal[]= $lista_areas;
  
 }
  $smarty->assign('listadocentes'  , $arraytribunal);
      
  }
  
  
  
  
        
         if( isset($_POST['tarea']) && $_POST['tarea'] =='Guardar')
            {
          $semestre= new Semestre();
       $semestreactual=   $semestre->getActivo();
            // echo "Hola eli";
             /*
             echo  $_POST['estudiante_id'];
     
              */
      $horaini=$_POST['hora_ini'];
         $minutoini=$_POST['minuto_ini'];
           
           $var=$horaini.":".$minutoini;
           echo $var;
           $horafin=$_POST['hora_fin'];
           $minutofin=$_POST['minuto_fin'];
           $varfin=$horafin.":".$minutofin;
            $idproyecto= $_POST['proyecto_id'];
               $defensa= new Defensa();
              $defensa->objBuidFromPost();
             
              $defensa->fecha_asignacion= date("j/n/Y");
              $defensa->hora_asignacion=date("H:i:s");
              $defensa->fecha_defensa=$_POST['fecha_defensa'];
              $defensa->hora_inicio=$var;
              $defensa->hora_final= $varfin;
              //$defensa->tipo_defensa_id=tipo_defensa_id;
              //$defensa->lugar_id=1;
           //   $defensa->proyecto_id;
              
              $defensa->semestre= $semestreactual->codigo;
              $defensa->estado = Objectbase::STATUS_AC;
              $defensa->save();
             
   $query = "UPDATE proyecto p SET p.estado_proyecto='LD'  WHERE p.id=$idproyecto";
  mysql_query($query);
            }

  
  $smarty->assign("ERROR", $ERROR);
  

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$contenido = 'tribunal/asignar.tpl';
  $smarty->assign('contenido',$contenido);



$TEMPLATE_TOSHOW = 'tribunal/tribunal.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>