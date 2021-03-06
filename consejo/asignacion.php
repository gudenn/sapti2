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
 

  
  
  
  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $CSS[]  = URL_JS . "box/box.css";
   $JS[]  = URL_JS ."box/jquery.box.js";
  //Datepicker UI
  $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";

  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";
 
   $smarty->assign('CSS',$CSS);
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
  leerClase("Consejo");
  leerClase("Notificacion");
  leerClase("Dia");
  leerClase('Html');
    
  

 $menuList[]     = array('url'=>URL.Consejo::URL,'name'=>'Consejo');
   $menuList[]     = array('url'=>URL . Consejo::URL.'listadefensa.php' ,'name'=>'Defensa');
   $smarty->assign("menuList", $menuList);
     
   
      $lugar= new Lugar();
      $lugar_sql= $lugar->getAll();

      $lugar_id= array();
      $lugar_nombre=array();
      while ($lugar_sql && $ro = mysql_fetch_array($lugar_sql[0]))
       {
         $lugar_id[]     = $ro['id'];
         $lugar_nombre[] = $ro['nombre'];
       }
        $diass= new Dia();
      //  $diass ->iniciarHorario();
    $smarty->assign("diass", $diass);

      $smarty->assign('lugar_id',$lugar_id);
      $smarty->assign('lugar_nombre',$lugar_nombre);


        $tipo= new Tipo_defensa();
        $tipo_sql= $tipo->getAll();
        $smarty->assign('accion', array(
            Defensa::DEFENSA_PUBLICA =>  "PUBLICA",
            Defensa::DEFENSA_PRIVADA =>  "PRIVADA"
                                   ));
        
        if($_GET['defensa_id'])
        {
            $defensa= new Defensa($_GET['defensa_id']);
           $proyecto =  new Proyecto($defensa->proyecto_id);
          $estudiante= $proyecto->getEstudiante();
          $usuariobuscado= new Usuario($estudiante->usuario_id);
          $smarty->assign('usuariobuscado',  $usuariobuscado);
          $smarty->assign('estudiantebuscado', $estudiante);
          $smarty->assign('proyectobuscado', $proyecto);
          $smarty->assign('defensa',  $defensa);
          $smarty->assign('proyectoarea', $proyecto->getArea());


          $sqlr="SELECT  DISTINCT(d.id), u.nombre, CONCAT (u.apellido_paterno,' ',u.apellido_materno) as apellidos
          FROM  usuario u ,docente d ,  tribunal  t
          WHERE  u.id= d.usuario_id and   d.id= t.docente_id and   t.estado='AC' and u.estado='AC'  and d.estado='AC' and t.proyecto_id= $proyecto->id;";
          $resultado = mysql_query($sqlr);
          $arraytribunal= array();

 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
{ 
       
        $lista_areas=array();
        $lista_areas[] = $fila["id"];
        $lista_areas[] =  $fila["nombre"];
        $lista_areas[] =  $fila["apellidos"];
 
      
  $arraytribunal[]= $lista_areas;
  
 }
  $smarty->assign('listadocentes'  , $arraytribunal);
          
 }

  if(isset($_GET['estudiante_id']))
  {
        $estudiante   =  new Estudiante($_GET['estudiante_id']);
        $proyecto     =  new Proyecto();
   
    $proyecto_aux  =  $estudiante->getProyecto();
    if ($proyecto_aux)
      $proyecto = $proyecto_aux;
    else
    {
      //@todo no tiene proyecto 
       echo "<script>alert('El Estudiante no Tiene Proyecto');</script>";
      
    }
  $defensa=  $proyecto->getDefensa();
   $usuariobuscado= new Usuario($estudiante->usuario_id);
   $smarty->assign('usuariobuscado',  $usuariobuscado);
   $smarty->assign('estudiantebuscado', $estudiante);
   $smarty->assign('proyectobuscado', $proyecto);
   $smarty->assign('proyectoarea', $proyecto->getArea());


 $sqlr="SELECT  DISTINCT(d.id), u.nombre, CONCAT (u.apellido_paterno,' ',u.apellido_materno) as apellidos
FROM  usuario u ,docente d ,  tribunal  t
WHERE  u.id= d.usuario_id and   d.id= t.docente_id and   t.estado='AC' and u.estado='AC'  and d.estado='AC' and t.proyecto_id= $proyecto->id;";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();

 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
{ 
       
        $lista_areas=array();
        $lista_areas[] = $fila["id"];
        $lista_areas[] =  $fila["nombre"];
        $lista_areas[] =  $fila["apellidos"];
 
      
  $arraytribunal[]= $lista_areas;
  
 }
  $smarty->assign('listadocentes'  , $arraytribunal);
    }
  
  
        
         if( isset($_POST['proyecto_id'])  && isset($_POST['tarea']) && $_POST['tarea'] =='Guardar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
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
         //    echo  $actual;
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
         $detalle_mensaje='Se le asignó la fecha de defensa ';
            if($esiste==false)
             {
              $idproyecto= $_POST['proyecto_id'];
               $proyectosestado= new Proyecto($idproyecto);
              
               $defensa= new Defensa($proyectosestado->getDefensa()->id);
              $defensa->objBuidFromPost();
                
              $defensa->fecha_asignacion= date("j/n/Y");
              $defensa->hora_asignacion=date("H:i:s");
              $defensa->fecha_defensa=$fecha;
              $defensa->hora_inicio=$horaini;
              $defensa->hora_final= $varfin;
              $defensa->tipo_defensa=$_POST['accion'];
           
              $defensa->semestre= $semestreactual->codigo;
              $defensa->estado = Objectbase::STATUS_AC;
             $defensa->save();
             $lugar= new Lugar($defensa->lugar_id);
            $detalle_mensaje .=  ' fecha : '.$defensa->fecha_asignacion;
            $detalle_mensaje .=  ' hora  : '.$defensa->hora_inicio;
            $detalle_mensaje .=  ' Lungar de defensa  : '.$lugar->nombre;
                    
                    $defensa->lugar_id;
             if($_POST['accion']==Defensa::DEFENSA_PUBLICA)
             {
        
                 //$query = "UPDATE proyecto p SET p.estado_proyecto='LD'  WHERE p.id=$idproyecto";
                // mysql_query($query);
                 
               $proyectosestado= new Proyecto($idproyecto);
               $proyectosestado->estado_proyecto=  Proyecto::EST4_DEF;
               $proyectosestado->save();
               
                       
       
             }
            
    $proyectos   = new Proyecto($idproyecto);
    $estudiante   = new Estudiante($proyectos->getEstudiante()->id);
    $notificacion= new Notificacion();
    $notificacion->objBuidFromPost();
  // $notificacion->enviarNotificaion($usuarios);
    $notificacion->proyecto_id=$_POST['proyecto_id']; 
   // $notificacion->tipo="Notificación";
    $notificacion->tipo=  Notificacion::TIPO_NOTIFICACION;
    $notificacion->fecha_envio= date("j/n/Y");
    $notificacion->asunto= "Asignación de Fechas de Defensa";
    $notificacion->detalle=$detalle_mensaje;
    $notificacion->prioridad=5;
    $notificacion->estado = Objectbase::STATUS_AC;
    $noticaciones= array('estudiantes'=>array($proyectos->getEstudiante()->id));
    $notificacion->enviarNotificaion( $noticaciones);
  
           $stado=1;
           
             }  else {
                 
                 $html = new Html();
    $mensaje = array('mensaje' => ' El docente no tiene hora disponible', 'titulo' => 'Registro de defensa', 'icono' => 'warning_48.png');
    $ERROR = $html->getMessageBox($mensaje);
           
             }
            }

  //No hay ERROR
  $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  //$moderador=0;
  if(isset($stado))
  {
  if($stado==1){
       $_SESSION['estado']=$stado;
        header("Location: proyecto.defensa.php");
          

  }  else {
          $mensaje = array('mensaje'=>'Hubo un problema, No se grab&oacute correctamente el Area','titulo'=>'Asignación de Defensa' ,'icono'=> 'warning_48.png');
          $ERROR = $html->getMessageBox ($mensaje);
  }
  }
     
  
  $smarty->assign("ERROR",$ERROR);

} 
catch(Exception $e) 
{
 
  $smarty->assign("ERROR", handleError($e));
}
$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);

$contenido = 'tribunal/asignar.tpl';
  $smarty->assign('contenido',$contenido);



$TEMPLATE_TOSHOW = 'tribunal/tribunal.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);



?>