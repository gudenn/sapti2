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
  $CSS[]  = URL_JS . "jQfu/css/jquery.fileupload-ui.css";
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_CSS . "spams.css";
  $CSS[]  = URL_JS  . "validate/validationEngine.jquery.css";
  
   $CSS[]  = URL_JS . "box/box.css";
   $JS[]  = URL_JS ."box/jquery.box.js";
  
   $smarty->assign('CSS',$CSS);
  
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  
  //CK Editor
  $JS[]  = URL_JS . "ckeditor/ckeditor.js";
  //BOX
  
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
  leerClase("Semestre");
  leerClase("Dia");
  leerClase('Html');
  
  $smarty->assign("ERROR", '');
  $menuList[]     = array('url'=>URL.Consejo::URL,'name'=>'Consejo');
  $menuList[]     = array('url'=>URL . Consejo::URL.'registro.php' ,'name'=>'Asignaci&oacute;n');
  $smarty->assign("menuList", $menuList);

 
 $editores = ",
                {toolbar: [ 
                  [ 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink' ],
                  [ 'FontSize', 'TextColor', 'BGColor' ]]}";
  
    $smarty->assign("editores", $editores);
    $diass= new Dia();
    $smarty->assign("diass", $diass);
    
  if(isset($_POST['buscar']) && isset($_POST['codigosis']))
  {
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
    if($proyecto->estado_proyecto=='VB')
    {
      
        $array =$proyecto ->getVigencia();
        $proyeareas=$proyecto->getArea();
        $tutores= $proyecto->getTutores();
        $usuariobuscado= new Usuario($estudiante->usuario_id);
        $smarty->assign('usuariobuscado',  $usuariobuscado);
        $smarty->assign('estudiantebuscado', $estudiante);
        $smarty->assign('proyectobuscado', $proyecto);
        $smarty->assign('proyectoarea', $proyecto->getArea());
        $smarty->assign('tutores', $arraytutores);

   
          $automatico= new Automatico();
          $automatico->getListaParaProyecto($proyecto->id);

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
    }
    else
    {
             $html  = new Html();
             $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente la Carrera','titulo'=>'Registro de Carrera' ,'icono'=> 'warning_48.png');
             $ERROR = $html->getMessageBox ($mensaje);
       //   echo "<script>alert('El Proyecto No Esta Habilitado Para La Asignacion De Tribunales');</script>";
    }
    }  else 
      {
      
       echo "<script>alert('El Proyecto ya tiene Tribunales');</script>";
      
    }    
 
 }
   
    $sqlr="SELECT  DISTINCT(d.id), u.nombre, CONCAT (u.apellido_paterno,u.apellido_materno) as apellidos
FROM  usuario u ,docente d, automatico a
WHERE  u.id=d.usuario_id and  a.`docente_id`=d.`id` and u.estado='AC'
ORDER BY  a.valor  DESC;";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();

 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
   { 
        $listaareas=array();
        $lista_areas=array();
        $lista_areas[] = $fila["id"];
        $lista_areas[] =  $fila["nombre"];
        $lista_areas[] =  $fila["apellidos"];
 
  $arraytribunal[]= $lista_areas;
  
 }
  $smarty->assign('listadocentes'  , $arraytribunal);
  $contenido = 'tribunal/registrotribunal.tpl';
  $smarty->assign('contenido',$contenido);
  
//   asignacion manual de los tribunales
  
  
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
    ORDER BY  a.valor  DESC;";
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

  $lista_areas[]=$listaareas;

 }
  $smarty->assign('listadocentes'  , $arraytribunal);
  $contenido = 'tribunal/registrotribunal.tpl';
  $smarty->assign('contenido',$contenido);
  }
  //////////asignacion automatico de tribunales////////////
  
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
         ORDER BY  a.valor  DESC;";
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
                     while ($filas = mysql_fetch_array($resultadoa, MYSQL_ASSOC)) 
                       {
                         $listaareas[]=$filas;
                       }
                         $lista_areas[]=$listaareas;
                         $listatiempo=array();
                        $arraytribunalasignados[]= $lista_areas;

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
                               while ($filas = mysql_fetch_array($resultadoa, MYSQL_ASSOC)) 
                                      {
                                       $listaareas[]=$filas;
                                       }
                                       $lista_areas[]=$listaareas;
                                       $listatiempo=array();
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

     if(isset($_POST['ids']))
     { 
     foreach ($_POST['ids'] as $id)
     {
               //  echo $id;
               
                $tribunal                    = new Tribunal();
                $tribunal->objBuidFromPost();  
                $tribunal->docente_id        =$id;
                $tribunal->proyecto_id       =$proyectos->id;
              //  $tribunal->detalle="";
                $tribunal->visto_bueno       =  Tribunal::VISTO_BUENOPENDIENTE;
                $tribunal->accion="";
                $tribunal->visto             =  Tribunal::VISTO_NV;
                $tribunal->fecha_asignacion  = date("j/n/Y");
                $tribunal->estado            = Objectbase::STATUS_AC;
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
 

  if (isset($EXITO))
    {
   $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje' => 'Se grabo correctamente la Asignacion de Tribunales', 'titulo' => 'Registro de Tribunales', 'icono' => 'tick_48.png');
     else
      $mensaje = array('mensaje' => 'Hubo un problema, No se grabo correctamente la Asignacion de Tribunales', 'titulo' => 'Registro de Tribunales', 'icono' => 'warning_48.png');
    $ERROR = $html->getMessageBox($mensaje);
   }
     echo "Hola eli";
    $htmls = new Html();
    $mensaje = array('mensaje' => 'Hubo un problema, No se grabo correctamente la Asignacion de Tribunales', 'titulo' => 'Registro de Tribunales', 'icono' => 'warning_48.png');
    $ERROR = $htmls->getMessageBox($mensaje);
  
  
  $smarty->assign("ERROR",  $ERROR);
   
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'tribunal/tribunal.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>