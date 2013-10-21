<?php
try {
    define ("MODULO", "CONSEJO");
  
  require('_start.php');
  if(!isConsejoSession())
  header("Location: login.php"); 
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
  
  
  
  
        
         if( isset($_POST['proyecto_id'])  && isset($_POST['tarea']) && $_POST['tarea'] =='Guardar')
            {
          $semestre= new Semestre();
          $semestreactual=   $semestre->getActivo();
          $proyecto=  new Proyecto($_POST['proyecto_id']);
       
       
         $horaini=$_POST['hora_ini'];
         $minutoini=$_POST['minuto_ini'];
           
           $horaini=$horaini.":".$minutoini;
          // echo $var;
              $horafin=$_POST['hora_fin'];
           $minutofin=$_POST['minuto_fin'];
           $varfin=$horafin.":".$minutofin;
           $fecha=  $_POST['fecha_defensa'];
         
        //   echo $fecha;
           $esiste= FALSE;
           $listatribunales= array();
           
         $listatribunales=  $proyecto->getIdTribunles();
             echo  $actual;
          foreach ($listatribunales  as $valor)
         {
           
           //echo $valor;
                $sql="select  d.id
               from   tribunal t, proyecto  p,   defensa  d
                  where   t.proyecto_id=p.id  and p.id= d.proyecto_id";
                $resultado   =  mysql_query($sql);
          while ($filadoc = mysql_fetch_array( $resultado, MYSQL_ASSOC))
            {   
            
            $defensa= new Defensa($filadoc['id']);
            
            if(($defensa->fecha_defensa==$fecha)  &&  ($defensa->hora_inicio==$horaini))
            {
              $esiste=true;
              
            }
            
             
            
          
            }  
         
            
         }
      
        // echo  
         
            if($esiste==false)
             {
              $idproyecto= $_POST['proyecto_id'];
               $defensa= new Defensa();
              $defensa->objBuidFromPost();
             
              $defensa->fecha_asignacion= date("j/n/Y");
              $defensa->hora_asignacion=date("H:i:s");
              $defensa->fecha_defensa=$fecha;
              $defensa->hora_inicio=$horaini;
              $defensa->hora_final= $varfin;
              $defensa->tipo_defensa=$_POST['accion'];;
           
              $defensa->semestre= $semestreactual->codigo;
              $defensa->estado = Objectbase::STATUS_AC;
              $defensa->save();
             
        $query = "UPDATE proyecto p SET p.estado_proyecto='LD'  WHERE p.id=$idproyecto";
     mysql_query($query);
            
    $proyectos   = new Proyecto($idproyecto);
    $estudiante   = new Estudiante($proyectos->getEstudiante()->id);
    $notificacion= new Notificacion();
    $notificacion->objBuidFromPost();
  // $notificacion->enviarNotificaion($usuarios);
    $notificacion->proyecto_id=$_POST['proyecto_id']; 
    $notificacion->tipo="Notificación";
    $notificacion->fecha_envio= date("j/n/Y");
    $notificacion->asunto= "Asignación de Fechas de Defensa";
    $notificacion->detalle="Asignación de Fechas de Defensa";
    $notificacion->prioridad=5;
    $notificacion->estado = Objectbase::STATUS_AC;
    $noticaciones= array('estudiantes'=>array($proyectos->getEstudiante()->id));
    $notificacion->enviarNotificaion( $noticaciones);
  
             }  else {
            echo " El docent no tiene hoara disponible";
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

$contenido = 'tribunal/asignar.tpl';
  $smarty->assign('contenido',$contenido);



$TEMPLATE_TOSHOW = 'tribunal/tribunal.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>