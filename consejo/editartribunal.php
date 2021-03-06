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

  //CSS
 //CSS
    $CSS[]  = URL_JS . "ui/overcast/jquery-ui.css";
  $CSS[]  = URL_JS . "jQfu/css/jquery.fileupload-ui.css";
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_CSS . "spams.css";
  $CSS[]  = URL_JS  . "validate/validationEngine.jquery.css";

  
   
  
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

    
   $CSS[]  = URL_JS . "box/box.css";
   $JS[]  = URL_JS ."box/jquery.box.js";
  //CK Editor
  $JS[]  = URL_JS . "ckeditor/ckeditor.js";
  //BOX
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
  leerClase("Modalidad");
   leerClase("Notificacion");
  leerClase("Proyecto_estudiante");
  leerClase("Consejo");


//contruyendo el usuario
  
  $menuList[]     = array('url'=>URL.Consejo::URL,'name'=>'Consejo');
  $menuList[]     = array('url'=>URL . Consejo::URL.'tribunales.rechazados.php' ,'name'=>'Tribunales');

   $smarty->assign("menuList", $menuList);
  
 $editores = ",
                {toolbar: [ 
                  [ 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink' ],
                  [ 'FontSize', 'TextColor', 'BGColor' ]]}";
  
  $smarty->assign("editores",$editores);
 
  if ( isset($_POST['tarea']) && $_POST['tarea'] == 'grabar' )
  { 
   
     $stado=0;
    mysql_query("BEGIN");
    $listatribunales= array();
    $proyecto= new Proyecto($_POST['proyecto_id']);
    
  
    $listatribunales=$proyecto->getIdTribunles();
    $tribunalesactuales= array();
    $tribunalesactuales=$_POST['ids'];
    
      if(isset($_POST['ids']))
     { 
     
     
     foreach ($_POST['ids'] as $id)
            {
          
               
            if(!in_array($id, $listatribunales))
             {
              
                $tribunal= new Tribunal();
                $tribunal->objBuidFromPost();  
                $tribunal->docente_id =$id;
                $tribunal->proyecto_id=$proyecto->id;
                $tribunal->detalle="";
                $tribunal->accion="";
                $tribunal->visto=  Tribunal::VISTO_NV;
                $tribunal->visto_bueno       =  Tribunal::VISTO_BUENOPENDIENTE;
                $tribunal->fecha_asignacion= date("j/n/Y");
                $tribunal->estado = Objectbase::STATUS_AC;
                $tribunal->save();
                
                
                $notificacions= new Notificacion();
                $notificacions->objBuidFromPost();
                $notificacions->proyecto_id=$_POST['proyecto_id']; 
                $notificacions->tipo=Notificacion::TIPO_ASIGNACION;
                $notificacions->fecha_envio= date("j/n/Y");
                $notificacions->asunto="Asignacion de Tribunales";
                $notificacions->detalle=$_POST['detalle'];
                $notificacions->prioridad=5;
                $notificacions->estado = Objectbase::STATUS_AC;

                $noticaciones= array('tribunales'=>array( $tribunal->id));
                $notificacions->enviarNotificaion( $noticaciones);
                 }
                 foreach ( $listatribunales  as $valores )
                 {
                   if(!in_array($valores,  $tribunalesactuales))
                   {
                      $query = "UPDATE tribunal t SET t.estado='DE'  WHERE t.docente_id=$valores  and t.proyecto_id=$proyecto->id";
                       mysql_query($query);
                     
                   }
                   
                 }                 
                 
                 
                 
                 
                 
     }
     }
    $stado=1;
    mysql_query("COMMIT"); 
    
      if(isset($stado))
        {
        if($stado==1)
        {
          $_SESSION['estado']=$stado;
          if($_SESSION['iditando']=="editando")
          {
            header("Location:listatribunal.php");
          }else
          {
          header("Location:tribunales.rechazados.php");
          }
          
        }else  
          {
          $mensaje = array('mensaje'=>'Hubo un problema, No se grab&oacute correctamente el Area','titulo'=>'Registro de Area' ,'icono'=> 'warning_48.png');
          $ERROR = $html->getMessageBox ($mensaje);
          }
         }
     
    
    
   }

   if(isset($_GET['editar']) && isset($_GET['proyecto_id']) && is_numeric($_GET['proyecto_id']) )
  {
     $_SESSION['iditando']= $_GET['editar'];
     $estudiante= new Estudiante($_GET['proyecto_id']);
       $proyectos =  $estudiante->getProyecto();
      
     // $estudiante= $proyectos->getEstudiante();
      $usuario =  new Usuario($estudiante->usuario_id);
      $modalidad=  new Modalidad( $proyectos->modalidad_id);
      $areaproyecto= $proyectos->getArea();
  
       $smarty->assign('proyecto'  , $proyectos);
        $smarty->assign('modalidad'  , $modalidad);
        $smarty->assign('usuario'  , $usuario);
        $smarty->assign('estudiante'  ,$estudiante); 
        $smarty->assign('area', $areaproyecto);
     
    
 $sqlr="SELECT  d.id, u.nombre, CONCAT(u.apellido_paterno,' ' ,u.apellido_materno) as apellidos
FROM  usuario u ,docente d
WHERE  u.id=d.usuario_id and u.estado='AC' and  d.estado='AC' and d.id not in(
select dd.id
from  proyecto p, tribunal t ,docente dd
where     p.id=t.proyecto_id  and t.docente_id= dd.id  and p.estado='AC' and t.estado='AC' and dd.estado='AC' and p.id=".$proyectos->id.");";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
 
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
         { 
   
   
   
        $listaareas=array();
        $lista_areas=array();
        $lista_areas[] = $fila["id"];
        $lista_areas[] =  $fila["nombre"];
        $lista_areas[] =  $fila["apellidos"];
 
 
$sqla="select  a.nombre
from docente d , apoyo ap , area a
where  d.id=ap.docente_id and a.id=ap.area_id and d.estado='AC' and ap.estado='AC' and a.estado='AC'and d.id=".$fila["id"];
 $resultadoa = mysql_query($sqla);
 
  while ($filas = mysql_fetch_array($resultadoa, MYSQL_ASSOC)) 
  {
     $listaareas[]=$filas;
  }
  $lista_areas[]=$listaareas;
  $arraytribunal[]= $lista_areas;
 }
 $smarty->assign('listadocentes'  , $arraytribunal);
 //Tribunal::
     
     //////////////////////////seleccionados////////////////////
   $sqlselec="SELECT  d.id, u.nombre, CONCAT (u.apellido_paterno,' ' ,u.apellido_materno) as apellidos
FROM  usuario u ,docente d
WHERE  u.id=d.usuario_id and u.estado='AC' and   d.id  in(
select dd.id
from  proyecto p, tribunal t ,docente dd
where   p.id=t.proyecto_id and t.accion!='RE' and t.docente_id= dd.id and  p.estado='AC' and t.estado='AC' and dd.estado='AC'  and p.id=".$proyectos->id.");";
 $resultadoselect = mysql_query($sqlselec);
 $arraytribunalselec= array();
 
 while ($filaselec = mysql_fetch_array($resultadoselect, MYSQL_ASSOC)) 
         { 
   
   
   
        $listaareas=array();
        $lista_areas=array();
        $lista_areas[] = $filaselec["id"];
        $lista_areas[] =  $filaselec["nombre"];
        $lista_areas[] =  $filaselec["apellidos"];
 
 
$sqla="select  a.nombre
from docente d , apoyo ap , area a
where  d.id=ap.docente_id and a.id=ap.area_id and d.estado='AC' and ap.estado='AC' and a.estado='AC'and d.id=".$filaselec["id"];
 $resultadoa = mysql_query($sqla);
 
  while ($filas = mysql_fetch_array($resultadoa, MYSQL_ASSOC)) 
  {
     $listaareas[]=$filas;
  }
  $lista_areas[]=$listaareas;
  $arraytribunalselec[]= $lista_areas;
 }
 $smarty->assign('listadocenteselec'  , $arraytribunalselec);
          
      
  }else
  {
     header("Location:tribunales.rechazados.php");
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
$smarty->display($TEMPLATE_TOSHOW);

?>