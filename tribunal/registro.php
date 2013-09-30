<?php
try {
  require('_start.php');
  global $PAISBOX;

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
  $CSS[]  = URL_CSS . "box/box.css";
 
  $smarty->assign('CSS',$CSS);
  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  //CK Editor
  $JS[]  = URL_JS . "ckeditor/ckeditor.js";
  //BOX
  $JS[]  = URL_JS ."box/jquery.box.js";
  
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
  leerClase("Notificacion");
  leerClase("Notificacion_tribunal");
 
  
  /**
 $filtro     = new Filtro('g_docente',__FILE__);
  $docente = new Docente();
  $docente->iniciarFiltro($filtro);
  $filtro_sql = $docente->filtrar($filtro);

  $docente->usuario_id ='%';
  
  $o_string   = $docente->getOrderString($filtro);
  $obj_mysql  = $docente->getAll('',$o_string,$filtro_sql,TRUE,TRUE);
  $objs_pg    = new Pagination($obj_mysql, 'g_docente','',false,10);

  $smarty->assign("filtros"  ,$filtro);
  $smarty->assign("objs"     ,$objs_pg->objs);
  $smarty->assign("pages"    ,$objs_pg->p_pages);
 */
  
      $editores = ",
                {toolbar: [ 
                  [ 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink' ],
                  [ 'FontSize', 'TextColor', 'BGColor' ]]}";
  
  $smarty->assign("editores", $editores);
  
    
  $sqlr="SELECT  DISTINCT(d.id), u.nombre, CONCAT (u.apellido_paterno,u.apellido_materno) as apellidos
FROM  usuario u ,docente d, automatico a
WHERE  u.id=d.usuario_id and   a.docente_id = d.id  and u.estado='AC'
ORDER BY  a.valor_area , a.dia;";
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
  if(isset($_POST['buscar']))
  {
   echo   $_POST['codigosis'];
   
   
   
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
   
   $usuariobuscado= new Usuario($estudiante->usuario_id);
   $smarty->assign('usuariobuscado',  $usuariobuscado);
   $smarty->assign('estudiantebuscado', $estudiante);
   $smarty->assign('proyectobuscado', $proyecto);
   $smarty->assign('proyectoarea', $proyecto->getArea());
   
   leerClase("Automatico");
  $automatico=new Automatico();
  $automatico->deleteAllSonObjects();
  
  $automatico->objBuidFromPost();
//LISTA DOCENTES
  $sqldoc="SELECT DISTINCT ap.docente_id AS iddoc
 FROM apoyo ap";
 $resultadodoc = mysql_query($sqldoc);
 while ($filadoc = mysql_fetch_array($resultadodoc, MYSQL_ASSOC)) {
   $arraylistadoc[]=$filadoc;
 }
 //ID DE AREA DEL PROYECTO
 $array=array();
 $array= $proyecto->getArea();
 $idareaproyecto=$array[0];
 $maxvalor=100;
   if(count($arraylistadoc)>0){
       //LLENADO DE AREAS CON VALORES
 $arraylistaarea[]=array('idarea' => $idareaproyecto, 'valor' => $maxvalor);
  $sqlarea="SELECT DISTINCT apoyo.area_id AS idarea
FROM apoyo
WHERE NOT EXISTS(
SELECT DISTINCT area.id
FROM area
WHERE apoyo.area_id=".$idareaproyecto."
)";
 $resultadoarea = mysql_query($sqlarea);
 while ($filaarea = mysql_fetch_array($resultadoarea, MYSQL_ASSOC)) {
   $arraylistaarea[]=array('idarea' =>$filaarea['idarea'], 'valor' =>$maxvalor-1);
   $maxvalor--;
 }
 foreach ($arraylistaarea as $valuearea) {
       $sqldocarea="SELECT apoyo.docente_id as iddoc FROM apoyo WHERE apoyo.area_id=".$valuearea['idarea']."";
 $resultadodocarea = mysql_query($sqldocarea);
 while ($filadocarea = mysql_fetch_array($resultadodocarea, MYSQL_ASSOC)) {
   $arraylistadocarea[]=$filadocarea;
 }
    foreach ($arraylistadocarea as $valuedocarea)
      {
       
        $valor_turno=0;
        $sqldocturno="SELECT hd.dia_id as dia, hd.turno_id as turno
        FROM horario_doc hd
        WHERE hd.docente_id=".$valuedocarea['iddoc']."
        ORDER BY dia ASC";
        $resultadodocturno = mysql_query($sqldocturno);
        while ($filadocturno = mysql_fetch_array($resultadodocturno, MYSQL_ASSOC)) {
        $arraylistadocturno[]=$filadocturno;
        }

            foreach ($arraylistadocturno as $valuedocturno) 
              {
                
                switch ($valuedocturno['dia']){
                    case 1:
                           $valor_turno=$valor_turno1+$valuedocturno['turno']*30;
                    break;
                    case 2: 
                           $valor_turno=$valor_turno2+$valuedocturno['turno']*30;
                    break;
                    case 3:
                           $valor_turno=$valor_turno3+$valuedocturno['turno']*30;
                    break;
                    case 4:
                           $valor_turno=$valor_turno4+$valuedocturno['turno']*30;
                    break;
                    case 5:
                           $valor_turno=$valor_turno5+$valuedocturno['turno']*30;
                    break;
                    case 6:
                           $valor_turno=$valor_turno6+$valuedocturno['turno']*30;
                    break;
                    default:
                    
                }
            }
          
              $valturno='$valor_turno' ;
                $automatico=new Automatico();
                $automatico->objBuidFromPost();
                $automatico->docente_id=$valuedocarea['iddoc'];
                $automatico->area_id=$valuearea['idarea'];
                $automatico->valor_area=$valuearea['valor'];            
                $automatico->dia=$valuedocturno['dia'];
                $automatico->valor_tiempo=$valor_turno;
                $automatico->save();
             //   echo 'olas';
              
            

        
    }
 }
  
    
  }  
   
  $sqlr="SELECT  DISTINCT(d.id), u.nombre, CONCAT (u.apellido_paterno,u.apellido_materno) as apellidos
FROM  usuario u ,docente d, automatico a
WHERE  u.id=d.usuario_id and   a.docente_id = d.id  and u.estado='AC'
ORDER BY  a.valor_area , a.dia;";
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
  
  
  
  
  
 
   if (isset($_POST['manual']))
   {
     echo   $_POST['estudiante_id'];
     
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
if (isset($_POST['proyecto_id']) && $_POST['proyecto_id']!="")
 {
   $proyectos   = new Proyecto($_POST['proyecto_id']);
   //$estudiante  = array();
    
   $notificacion= new Notificacion();
   $notificacion->objBuidFromPost();
  // $notificacion->proyecto_id=$_POST['proyecto_id'];
    $notificacion->tipo="Solicitud";
    $notificacion->fecha_envio= date("j/n/Y");
    $notificacion->asunto="Asignacion de Tribunales";
    //$notificacion->detalle="fasdf";
    $notificacion->prioridad=5;
    $notificacion->estado = Objectbase::STATUS_AC;
  
   
     if(isset($_POST['ids']))
     {
      // 'tutores'=>array($tutor->id) 
     foreach ($_POST['ids'] as $id)
     {
                 echo $id;
               
                $tribunal= new Tribunal();
                $tribunal->objBuidFromPost();
               
                $tribunal->proyecto_id=$proyectos->id;
                $tribunal->docente_id =$id;
                $tribunal->detalle="";
                $tribunal->accion="";
                $tribunal->visto=  Tribunal::VISTO_NV;
                $tribunal->fecha_asignacion= date("j/n/Y");
               
               $tribunal->estado = Objectbase::STATUS_AC;
            
                
           
                 $tribunal->save();
                 
                // $noticaciones= array('tribunales'=>array($tribunal->id));
                // $notificacion->enviarNotificaion( $noticaciones);
               
     }
     }
     }else
 {
   
   echo "<script>alert('No Existe elProyecto Para Asignar Tribunales');</script>";
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

$TEMPLATE_TOSHOW = 'tribunal/tribunal.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>