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
  $CSS[]  = URL_JS . "ui/overcast/jquery-ui.css";
  //$CSS[]  = URL_JS . "jQfu/css/demo.css";
  $CSS[]  = URL_JS . "jQfu/css/jquery.fileupload-ui.css";
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_CSS . "spams.css";
  $CSS[]  = URL_JS  . "validate/validationEngine.jquery.css";
  //include '../js/box/jquery.box.js';
  $CSS[]  = '../js/box/box.css';;
  
 // $JS[]  = '../js/box/jquery.box.js';
  $smarty->assign('CSS',$CSS);
  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  
  //CK Editor
  $JS[]  = URL_JS . "ckeditor/ckeditor.js";
  //BOX
  $JS[]  = '../js/box/jquery.box.js';
  
  $smarty->assign('JS',$JS);

  //Leendo las clases para 
  leerClase('Tribunal');
  leerClase("Proyecto");
  leerClase("Usuario");
  leerClase("Docente");
  leerClase("Estudiante");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");
  leerClase("Proyecto_estudiante");
  leerClase("Notificacion");
  leerClase("Notificacion_tribunal");
  leerClase("Automatico");
  leerClase("Consejo");
  leerClase("Semestre");
   
  $menuList[]     = array('url'=>URL.Consejo::URL,'name'=>'Consejo');
  $menuList[]     = array('url'=>URL . Consejo::URL ,'name'=>'Asignaci&oacute;n');
  $smarty->assign("menuList", $menuList);

 
 $editores = ",
                {toolbar: [ 
                  [ 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink' ],
                  [ 'FontSize', 'TextColor', 'BGColor' ]]}";
  
  $smarty->assign("editores", $editores);
  
  if(isset($_POST['buscar']) && isset($_POST['codigosis']))
  {
  // echo   $_POST['codigosis'];
    $sqldelite='DELETE  FROM automatico';
    mysql_query($sqldelite);
    
    
    $estudiante   = new Estudiante(false,$_POST['codigosis']);
   
    $proyecto     = new Proyecto();
   
    $proyecto_aux = $estudiante->getProyecto();
    if ($proyecto_aux)
      $proyecto = $proyecto_aux;
    else
    {
      //@todo no tiene proyecto 
       echo "<script>alert('El Estudiante no Tiene Proyecto');</script>";
      
    }
    
    if($proyecto->estado_proyecto!='TA')
    {
    
    $tutores= $proyecto->getTutores();
    
    $arraytutores= array();
    foreach ($tutores as $valor)
    {
       $arraytutores[]=  new Usuario($valor->usuario_id);
    }
    
 $array =$proyecto ->getVigencia();

    
   $proyeareas=$proyecto->getArea();
   $usuariobuscado= new Usuario($estudiante->usuario_id);
   $smarty->assign('usuariobuscado',  $usuariobuscado);
   $smarty->assign('estudiantebuscado', $estudiante);
   $smarty->assign('proyectobuscado', $proyecto);
   $smarty->assign('proyectoarea', $proyecto->getArea());
   $smarty->assign('tutores', $arraytutores);

   
    $array=  $proyecto->getArea();
    $idareaproyecto=$array[0]->id;
    echo $idareaproyecto;
  
if(sizeof($array)>0)
{
  //lista de los docentes q apoyan en el area del proyecto
  $arraylistadoc= array();
  
  ///////arrray aux///////////
  $arraconten=array();
 
//LISTA DOCENTES  que apoyan a la area del proyecto
  //array 
  
$sqldoc="select  DISTINCT d.id AS iddoc, a.area_id as idarea
from docente  d, apoyo a
WHERE  d.id=a.docente_id  and a.area_id=1";
 $resultadodoc = mysql_query($sqldoc);
while ($filadoc = mysql_fetch_array($resultadodoc, MYSQL_ASSOC))
 {
  
  
$sql="select  DISTINCT (d.`id`) as iddia, hd.`docente_id` as iddocente
from  horario_doc hd, dia  d , turno t
where  hd.`dia_id`=d.`id` and hd.`turno_id`=t.`id` and hd.`docente_id`=".$filadoc['iddoc'].";";

$resuldia = mysql_query($sql);
while ($filadia = mysql_fetch_array($resuldia, MYSQL_ASSOC))
{
  
  $sqlpeso="select  DISTINCT (d.id), t.peso  as pesos
from  horario_doc hd ,dia d, turno  t
where  hd.dia_id=d.id and hd.turno_id=t.id  and hd.docente_id=".$filadia['iddocente']."  and d.id=".$filadia['iddia'].";";
          
  $pesodia=0;
  $resulpeso = mysql_query($sqlpeso);
 // var_dump($resulpeso);
while ($filapeso = mysql_fetch_array($resulpeso, MYSQL_ASSOC))
{
  
  $pesodia=$pesodia + $filapeso['pesos'];
  
}

                $automatico=new Automatico();
                $automatico->objBuidFromPost();
                $automatico->area_id=$filadoc['idarea'];
                $automatico->docente_id=$filadoc['iddoc'];
                $automatico->valor_tiempo=$pesodia;
                $automatico->valor_area=100;
                $automatico->dia=$filadia['iddia'];
                $automatico->save();

}
  
            
                   
 }
 ///////////////array aux no docente//////////
 $arrayno = array();
 $sqldocno="SELECT  DISTINCT(d.id) as iddoc
from  `docente` d
where  d.`id` not in
(select  DISTINCT d.id
from docente  d, apoyo a
where  d.id=a.docente_id  and a.area_id=".$idareaproyecto.");";
 $resultadodocno = mysql_query($sqldocno);
while ($filadocno = mysql_fetch_array($resultadodocno, MYSQL_ASSOC))
 {  
$sqlsig="select  DISTINCT (d.`id`) as iddia, hd.`docente_id` as iddocente
from  horario_doc hd, dia  d , turno t
where  hd.`dia_id`=d.`id` and hd.`turno_id`=t.`id` and hd.`docente_id`=".$filadocno['iddoc'].";";

$resuldiasig = mysql_query($sqlsig);

if(mysql_fetch_lengths($resuldiasig)>0)
{
while ($filadiasig = mysql_fetch_array($resuldiasig, MYSQL_ASSOC))
{
   
  $sqlpesosig="select  DISTINCT (d.id), t.peso  as pesos
from  horario_doc hd ,dia d, turno  t
where  hd.dia_id=d.id and hd.turno_id=t.id  and hd.docente_id=".$filadiasig['iddocente']."  and d.id=".$filadiasig['iddia'].";";
          
  $pesodiasig=0;
  $resulpesosig = mysql_query($sqlpesosig);
 // var_dump($resulpeso);
while ($filapesosig = mysql_fetch_array($resulpesosig, MYSQL_ASSOC))
{
  
  $pesodiasig=$pesodiasig + $filapesosig['pesos'];
  
}

  
  
  
  
                $automatico=new Automatico();
                $automatico->objBuidFromPost();
                $automatico->docente_id=$filadocno['iddoc'];
                $automatico->area_id=0;
                $automatico->valor_area=50;
       
                $automatico->dia=$filadiasig['iddia'];
                $automatico->valor_tiempo=$pesodiasig;
                $automatico->save();
 
 
  
}
}else
{
  

                $automatico=new Automatico();
                $automatico->objBuidFromPost();
                $automatico->docente_id=$filadocno['iddoc'];
                $automatico->area_id=0;
                $automatico->valor_area=50;
                $automatico->dia=0;
                $automatico->valor_tiempo=9;
                 $automatico->numero_aceptados=0;
                 $automatico->save();
       
 
}
 }

    $tutores= $proyecto->getTutores();
    $arraytutores= array();
    foreach ($tutores as $valor)
    {
      
$sqlp="select  d.id
from usuario  u, docente  d
where   u.id=d.usuario_id  and  u.id=$valor->usuario_id;";  
  $resulp = mysql_query($sqlp);
while ($filap = mysql_fetch_array($resulp, MYSQL_ASSOC))
{
  $vars=$filap['id'];
$sqldeliteau="
delete from `automatico`  where  docente_id=$vars;";
 mysql_query($sqldeliteau);
}

}  
}else
{
     echo "<script>alert('El proyecto no tiene Area');</script>";
}

/**********************************************/



    }else
    {
      
        echo "<script>alert('El Proyecto ya tiene Tribunales');</script>";
    }
        
 
 }
 
 
    
  
  
    $sqlr="SELECT  DISTINCT(d.id), u.nombre, CONCAT (u.apellido_paterno,u.apellido_materno) as apellidos
FROM  usuario u ,docente d, automatico a
WHERE  u.id=d.usuario_id and  a.`docente_id`=d.`id` and u.estado='AC'
ORDER BY  a.valor_area  DESC;";
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
//if(mysql_fetch_array($resultadoa, MYSQL_ASSOC)){
  while ($filas = mysql_fetch_array($resultadoa, MYSQL_ASSOC)) 
  {
     $listaareas[]=$filas;
  }
 //}else
//{
 //  $listaareas[]="NO HAY DATOS";
 //}
  $lista_areas[]=$listaareas;
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
  $contenido = 'tribunal/registrotribunal.tpl';
  $smarty->assign('contenido',$contenido);

  if(isset($_POST['ma']))
  {
    
    $estudiante   = new Estudiante(false,$_POST['estudiante_id']);
   
    $proyecto     = new Proyecto();
   
    $proyecto_aux = $estudiante->getProyecto();
    if ($proyecto_aux)
      $proyecto = $proyecto_aux;
    else
    {
      //@todo no tiene proyecto 
       echo "<script>alert('El Estudiante no Tiene Proyecto');</script>";
      
    }
   
    $proyeareas=$proyecto->getArea();
   $usuariobuscado= new Usuario($estudiante->usuario_id);
   $smarty->assign('usuariobuscado',  $usuariobuscado);
   $smarty->assign('estudiantebuscado', $estudiante);
   $smarty->assign('proyectobuscado', $proyecto);
   $smarty->assign('proyectoarea', $proyecto->getArea());
   
    $sqlr="SELECT  DISTINCT(d.id), u.nombre, CONCAT (u.apellido_paterno,u.apellido_materno) as apellidos
    FROM  usuario u ,docente d, automatico a
    WHERE  u.id=d.usuario_id and  a.docente_id=d.id and u.estado='AC'
    ORDER BY  a.valor_area  DESC, a.valor_tiempo DESC;";
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
//if(mysql_fetch_array($resultadoa, MYSQL_ASSOC)){
  while ($filas = mysql_fetch_array($resultadoa, MYSQL_ASSOC)) 
  {
     $listaareas[]=$filas;
  }
 //}else
//{
 //  $listaareas[]="NO HAY DATOS";
 //}
  $lista_areas[]=$listaareas;
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
  $contenido = 'tribunal/registrotribunal.tpl';
  $smarty->assign('contenido',$contenido);
  }
  
if(isset($_POST['a']))
 {
   $estudiante   = new Estudiante(false,$_POST['estudiante_id']);
   
    $proyecto     = new Proyecto();
   
    $proyecto_aux = $estudiante->getProyecto();
    if ($proyecto_aux)
      $proyecto = $proyecto_aux;
    else
    {
      //@todo no tiene proyecto 
       echo "<script>alert('El Estudiante no Tiene Proyecto');</script>";
      
    }
   
    $proyeareas=$proyecto->getArea();
   $usuariobuscado= new Usuario($estudiante->usuario_id);
   $smarty->assign('usuariobuscado',  $usuariobuscado);
   $smarty->assign('estudiantebuscado', $estudiante);
   $smarty->assign('proyectobuscado', $proyecto);
   $smarty->assign('proyectoarea', $proyecto->getArea());
  
  $sqlr="SELECT  DISTINCT(d.id), u.nombre, CONCAT (u.apellido_paterno,u.apellido_materno) as apellidos
FROM  usuario u ,docente d, automatico a
WHERE  u.id=d.usuario_id and  a.`docente_id`=d.`id` and u.estado='AC'
ORDER BY  a.valor_area  DESC;";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
 $arraytribunalasignados= array();
$contador=0;
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 { 
       if($contador<3)
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
        //if(mysql_fetch_array($resultadoa, MYSQL_ASSOC)){
          while ($filas = mysql_fetch_array($resultadoa, MYSQL_ASSOC)) 
          {
             $listaareas[]=$filas;
          }
 //}else
//{
 //  $listaareas[]="NO HAY DATOS";
 //}
     $lista_areas[]=$listaareas;
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
          $arraytribunalasignados[]= $lista_areas;


         /////////////////
       
         }  else {
            $listaareas=array();
        $lista_areas=array();
        $lista_areas[] = $fila["id"];
        $lista_areas[] =  $fila["nombre"];
        $lista_areas[] =  $fila["apellidos"];
 
 
$sqla="select  a.`nombre`
from `docente` d , `apoyo` ap , `area` a
where  d.`id`=ap.`docente_id` and a.`id`=ap.`area_id` and d.`estado`='AC' and ap.`estado`='AC' and a.`estado`='AC'and d.`id`=".$fila["id"];
 $resultadoa = mysql_query($sqla);
//if(mysql_fetch_array($resultadoa, MYSQL_ASSOC)){
  while ($filas = mysql_fetch_array($resultadoa, MYSQL_ASSOC)) 
  {
     $listaareas[]=$filas;
  }
 //}else
//{
 //  $listaareas[]="NO HAY DATOS";
 //}
  $lista_areas[]=$listaareas;
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
  $contador++;
 }
 $smarty->assign('asignados'  , $arraytribunalasignados);
  $smarty->assign('listadocentes'  , $arraytribunal);
  $contenido = 'tribunal/registrotribunal.tpl';
  $smarty->assign('contenido',$contenido);
   
 }
   

if(isset($_POST['estudiante_id']) && isset($_POST['automatico']) && $_POST['automatico']='automatico')
  {
   
  $estudiante   = new Estudiante(false,$_POST['estudiante_id']);
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
}
   
if ( isset($_POST['tarea']) && $_POST['tarea'] == 'grabar' )
 {

if (isset($_POST['proyecto_id']))
 {
  
  $EXITO = false;
    mysql_query("BEGIN");
 $idproyecto=$_POST['proyecto_id'];
   
 
 
 
   
   $query = "UPDATE proyecto p SET p.estado_proyecto='TA'  WHERE p.id=$idproyecto";
     mysql_query($query);
      $proyectos   = new Proyecto($idproyecto);
    
      
      
   //$estudiante  = array();
    $estudiante   = new Estudiante($proyectos->getEstudiante()->id);
    $notificacion = new Notificacion();
    $notificacion->objBuidFromPost();
    $notificacion->proyecto_id=$_POST['proyecto_id']; 
    $notificacion->tipo=  Notificacion::TIPO_MENSAJE;
    $notificacion->fecha_envio= date("j/n/Y");
  //  $notificacion->asunto="Asignacion de Tribunales";
   // $notificacion->detalle="fasdf";
    $notificacion->prioridad=5;
    $notificacion->estado = Objectbase::STATUS_AC;

    $noticaciones= array('estudiantes'=>array($proyectos->getEstudiante()->id));
    $notificacion->enviarNotificaion( $noticaciones);
    
     
  // $listatribunales=
     if(isset($_POST['ids']))
     { 
     foreach ($_POST['ids'] as $id)
     {
               //  echo $id;
               
                $tribunal= new Tribunal();
                $tribunal->objBuidFromPost();  
                $tribunal->docente_id =$id;
                $tribunal->proyecto_id=$proyectos->id;
                $tribunal->detalle="";
                $tribunal->accion="";
                $tribunal->visto=  Tribunal::VISTO_NV;
                $tribunal->fecha_asignacion= date("j/n/Y");
                $tribunal->estado = Objectbase::STATUS_AC;
                $tribunal->save();
                
                
                $notificacions= new Notificacion();
                $notificacions->objBuidFromPost();
                $notificacions->proyecto_id=$_POST['proyecto_id']; 
                $notificacions->tipo=  Notificacion::TIPO_ASIGNACION;
                $notificacions->fecha_envio= date("j/n/Y");
                $notificacions->asunto="Asignacion de Tribunales";
                $notificacions->detalle="fasdf";
                $notificacions->prioridad=5;
                $notificacions->estado = Objectbase::STATUS_AC;
                $noticaciones= array('tribunales'=>array( $tribunal->id));
                $notificacions->enviarNotificaion( $noticaciones);
        
     }
     }
    $EXITO = TRUE;
    mysql_query("COMMIT");
    
        
     }else
 {
   
   echo "<script>alert('No Existe elProyecto Para Asignar Tribunales');</script>";
 }
 
 }
 
   leerClase('Html');
  if (isset($EXITO))
    {
   $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje' => 'Se grabo correctamente la Asignacion de Tribunales', 'titulo' => 'Registro de Tribunales', 'icono' => 'tick_48.png');
     else
      $mensaje = array('mensaje' => 'Hubo un problema, No se grabo correctamente la Asignacion de Tribunales', 'titulo' => 'Registro de Tribunales', 'icono' => 'warning_48.png');
    $ERROR = $html->getMessageBox($mensaje);
     }

  
  
  $smarty->assign("ERROR", $ERROR);
  

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'tribunal/tribunal.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>