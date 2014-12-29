<?php
 date_default_timezone_set('America/La_Paz');
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

  
   
  
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";
  $JS[]  = URL_JS . "validate/jquery.validate.min.js";

    
   $CSS[]  = URL_JS . "box/box.css";
   $JS[]  = URL_JS ."box/jquery.box.js";
  //CK Editor
  $JS[]  = URL_JS . "ckeditor/ckeditor.js";
  //BOX
  $smarty->assign('CSS',$CSS);
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
  
  leerClase("Dia");
  leerClase('Html');
  
 //  no hay error
  
  $smarty->assign("ERROR", '');
  $menuList[]     = array('url'=>URL.Consejo::URL,'name'=>'Consejo >');
   $menuList[]     = array('url'=>URL . Consejo::URL.'lista.estudiante.php' ,'name'=>'Asignación');
 // $menuList[]     = array('url'=>URL . Consejo::URL.'registro.php' ,'name'=>'Asignaci&oacute;n');
  $smarty->assign("menuList", $menuList);

 
 $editores = ",
                {toolbar: [ 
                  [ 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink' ],
                  [ 'FontSize', 'TextColor', 'BGColor' ]]}";
  
    $smarty->assign("editores", $editores);
    $diass= new Dia();
    $smarty->assign("diass", $diass);
    $html = new Html();
    
     $semestre = new Semestre('',1);
    
    $valorh = $semestre->getValor('Cantidad máximo de asignación de tribunales a docentes',10);
    if (!$valorh)
    {
      //  echo $valorh;
       $semestre->setValor('Cantidad máximo de asignación de tribunales a docentes',10);
    }
    
 $valorh = $semestre->getValor('Lapso de tiempo para el rechazo a ser tribunal hras.',73);
    if (!$valorh)
    {
      //  echo $valorh;
  $semestre->setValor('Lapso de tiempo para el rechazo a ser tribunal hras.',73);
    }
    $valorh = $semestre->getValor('Tiempo de espera de revisión de tribunal  (Semanas).',3);
    if (!$valorh)
    {
      //  echo $valorh;
  $semestre->setValor('Tiempo de espera de revisión de tribunal  (Semanas).',3);
    }

  if(isset($_GET['estudiante_id']))
  {
     $estudiante   = new Estudiante($_GET['estudiante_id']);
    
       $proyecto = $estudiante->getProyecto();
    
  
        $proyeareas  =  $proyecto->getArea();
        $tutores     =  $proyecto->getTutores();
        
       $arraytutores=array();
       foreach ($tutores  as $tuto)
       {
         $arraytutores[]=new Usuario($tuto->usuario_id);
       }
        
        $usuariobuscado= new Usuario($estudiante->usuario_id);
        $smarty->assign('usuariobuscado',  $usuariobuscado);
        $smarty->assign('estudiantebuscado', $estudiante);
        $smarty->assign('proyectobuscado', $proyecto);
        $smarty->assign('proyectoarea', $proyecto->getArea());
        $smarty->assign('tutores', $arraytutores);

   
          $automatico= new Automatico();
          $automatico->getListaParaProyecto($proyecto->id);
          
          
          $automatico->getAll();
          foreach ( $automatico as $valork)
          {
            $docentesa= new Docente($valork->docente_id);
            
            if(($docentesa->getNumeroTribunales())==$valorh)
            {
              $valork->valor=0;
              $valork->save();
            }
           }
          

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
   
     header("Location: lista.estudiante.php");
     
 }
   
 $sqlr="SELECT  DISTINCT(d.id), u.nombre, CONCAT (u.apellido_paterno,' ',u.apellido_materno) as apellidos
  FROM  usuario u ,docente d, automatico a
  WHERE  u.id=d.usuario_id and  a.`docente_id`=d.`id` and u.estado='AC'
  ORDER BY  a.valor  DESC;";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();

 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
   { 
       $doc= new Docente($fila["id"]);
        $listaareas=array();
        $lista_areas=array();
        $lista_areas[] =  $fila["id"];
        $lista_areas[] =  $fila["nombre"];
        $lista_areas[] =  $fila["apellidos"];
        $lista_areas[] =  $doc->getNumeroTribunales();
       // echo  $doc->getNumeroTribunales();
   $sqla="select  a.nombre
   from docente d , apoyo ap , area a
   where  d.id=ap.docente_id and a.id=ap.area_id and d.estado='AC' and ap.estado='AC' and a.estado='AC'and d.id=".$fila["id"];
   $resultadoa = mysql_query($sqla);
//if(mysql_fetch_array($resultadoa, MYSQL_ASSOC)){
  while ($filas = mysql_fetch_array($resultadoa, MYSQL_ASSOC)) 
  {
     $listaareas[]=$filas;
  }

  $lista_areas[]=$listaareas;
          
  $arraytribunal[]= $lista_areas;
  
 }
  $smarty->assign('listadocentes'  , $arraytribunal);
  $contenido = 'tribunal/registrotribunal.tpl';
  $smarty->assign('contenido',$contenido);
  
//   asignacion manual de los tribunales
  
  
  if(isset($_POST['manual']) )
  {
    if(isset($_POST['estudiante_id']))
    {
     $estudiante   = new Estudiante($_POST['estudiante_id']);
   
    $proyecto     = new Proyecto();
   
    $proyecto_aux = $estudiante->getProyecto();
    if ($proyecto_aux)
      $proyecto = $proyecto_aux;
    else
    {
      //@todo no tiene proyecto 
       //e//cho "<script>alert('El Estudiante no Tiene Proyecto');</script>";
      
    }
   
    $proyeareas=$proyecto->getArea();
   $tutores= $proyecto->getTutores();
       $arraytutores=array();
       foreach ($tutores  as $tuto)
       {
         $arraytutores[]=new Usuario($tuto->usuario_id);
       }
        
        $usuariobuscado= new Usuario($estudiante->usuario_id);
        $smarty->assign('usuariobuscado',  $usuariobuscado);
        $smarty->assign('estudiantebuscado', $estudiante);
        $smarty->assign('proyectobuscado', $proyecto);
        $smarty->assign('proyectoarea', $proyecto->getArea());
        $smarty->assign('tutores', $arraytutores);
   
    $sqlr="SELECT  DISTINCT(d.id), u.nombre, CONCAT (u.apellido_paterno,' ', u.apellido_materno) as apellidos
    FROM  usuario u ,docente d, automatico a
    WHERE  u.id=d.usuario_id and  a.docente_id=d.id and u.estado='AC'
    ORDER BY  a.valor  DESC;";
    $resultado = mysql_query($sqlr);
    
    $arraytribunal= array();
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
   { 
     $doc= new Docente($fila["id"]);
        $listaareas=array();
        $lista_areas=array();
        $lista_areas[] = $fila["id"];
        $lista_areas[] =  $fila["nombre"];
        $lista_areas[] =  $fila["apellidos"];
         $lista_areas[] =  $doc->getNumeroTribunales();
 
 
   $sqla="select  a.nombre
   from docente d , apoyo ap , area a
   where  d.id=ap.docente_id and a.id=ap.area_id and d.estado='AC' and ap.estado='AC' and a.estado='AC'and d.id=".$fila["id"];
   $resultadoa = mysql_query($sqla);
//if(mysql_fetch_array($resultadoa, MYSQL_ASSOC)){
  while ($filas = mysql_fetch_array($resultadoa, MYSQL_ASSOC)) 
  {
     $listaareas[]=$filas;
  }

  $lista_areas[]=$listaareas;
   $arraytribunal[]= $lista_areas;

 }

  $smarty->assign('listadocentes'  , $arraytribunal);
  
  $contenido = 'tribunal/registrotribunal.tpl';
  $smarty->assign('contenido',$contenido);
  }  else {
      $html = new Html();
    $mensaje = array('mensaje' => 'Hubo un problema, No se grabo correctamente la Asignacion de Tribunales', 'titulo' => 'Registro de Tribunales', 'icono' => 'warning_48.png');
    $ERROR = $html->getMessageBox($mensaje);
  }
  }
  //////////asignacion automatico de tribunales////////////
  
if(isset($_POST['automatico']))
 {
     $estudiante   = new Estudiante($_POST['estudiante_id']);
     $proyecto     = new Proyecto();
     $proyecto_aux = $estudiante->getProyecto();
     if ($proyecto_aux)
      $proyecto = $proyecto_aux;
     else
      {
      //@todo no tiene proyecto 
      // echo "<script>alert('El Estudiante no Tiene Proyecto');</script>";
       }
   
       $proyeareas=$proyecto->getArea();
       $tutores=$proyecto->getTutores();
       $arraytutores=array();
       foreach ($tutores  as $tuto)
       {
         $arraytutores[]=new Usuario($tuto->usuario_id);
       }
        
        $usuariobuscado= new Usuario($estudiante->usuario_id);
        $smarty->assign('usuariobuscado',  $usuariobuscado);
        $smarty->assign('estudiantebuscado', $estudiante);
        $smarty->assign('proyectobuscado', $proyecto);
        $smarty->assign('proyectoarea', $proyecto->getArea());
        $smarty->assign('tutores', $arraytutores);

       $sqlr="SELECT  DISTINCT(d.id), u.nombre, CONCAT (u.apellido_paterno,' ', u.apellido_materno) as apellidos
         FROM  usuario u ,docente d, automatico a
         WHERE  u.id=d.usuario_id and  a.`docente_id`=d.`id` and u.estado='AC'
         ORDER BY  a.valor  DESC;";
         $resultado = mysql_query($sqlr);
         $arraytribunal= array();
         $arraytribunalasignados= array();
         $contador=0;
         while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
         { $doc= new Docente($fila["id"]);
           if($contador<3)
             {
              
              $listaareas=array();
              $lista_areas=array();
              $lista_areas[] = $fila["id"];
              $lista_areas[] =  $fila["nombre"];
              $lista_areas[] =  $fila["apellidos"];
              $lista_areas[] =  $doc->getNumeroTribunales();

              $sqla="select  a.nombre
                     from docente d , apoyo ap , area a
                     where  d.id=ap.docente_id and a.id=ap.area_id and d.estado='AC' and ap.estado='AC' and a.estado='AC'and d.id=".$fila["id"];
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
                                $lista_areas[] =  $doc->getNumeroTribunales();
  
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
                                  $contador++;
            }
             $smarty->assign('asignados'  , $arraytribunalasignados);
             $smarty->assign('listadocentes'  , $arraytribunal);
             $contenido = 'tribunal/registrotribunal.tpl';
             $smarty->assign('contenido',$contenido);
   
 }

if(isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
 {
     $poject= new Proyecto($_POST['proyecto_id']);
 if(Proyecto::EST2_TA!=$poject->estado_proyecto)
 {
if (isset($_POST['proyecto_id']))
 {
  if(isset($_POST['ids'])  && sizeof($_POST['ids'])==3)
  {
   
     $EXITO = false;
    $stado=0;
    mysql_query("BEGIN");
    
    $idproyecto=$_POST['proyecto_id'];
     $proyectos   = new Proyecto($idproyecto);
     $proyectos->estado_proyecto= Proyecto::EST2_TA;
     $proyectos->save();
    $time = time();
$fechaasignaciones= date("j/n/ H:i:s", $time);
     
    $estudiante   = new Estudiante($proyectos->getEstudiante()->id);
    $notificacion = new Notificacion();
    $notificacion->objBuidFromPost();
    $notificacion->proyecto_id=$_POST['proyecto_id']; 
    $notificacion->tipo=  Notificacion::TIPO_MENSAJE;
    $notificacion->fecha_envio=date("j/n/Y");
    $notificacion->asunto="Asignacion de Tribunales";
     $notificacion->detalle="Se le Asigno Tribunales";
    $notificacion->prioridad=5;
    $notificacion->estado = Objectbase::STATUS_AC;
    $noticaciones= array('estudiantes'=>array($proyectos->getEstudiante()->id));
    $notificacion->enviarNotificaion( $noticaciones);
    foreach ($_POST['ids'] as $id)
     {
  //  $actual= $semestre->getActivo();
   // $actual->co
              
                $tribunal                    = new Tribunal();
                $tribunal->objBuidFromPost();  
                $tribunal->docente_id        =$id;
                $tribunal->proyecto_id       =$proyectos->id;
              //  $tribunal->detalle="";
                $tribunal->visto_bueno       =  Tribunal::VISTO_BUENOPENDIENTE;
                $tribunal->accion="";
                $tribunal->visto             =  Tribunal::VISTO_NV;
                $tribunal->fecha_asignacion  =  date("j/n/Y H:i:s");
              //  $tribunal->semestre          =  ;
                $tribunal->estado            = Objectbase::STATUS_AC;
                $tribunal->save();
                
                
                $notificacions= new Notificacion();
                $notificacions->objBuidFromPost();
                $notificacions->proyecto_id=$_POST['proyecto_id']; 
                $notificacions->tipo=  Notificacion::TIPO_ASIGNACION;
                $notificacions->fecha_envio= date("j/n/Y");
                $notificacions->asunto="Asignacion de Tribunales";
                $notificacions->detalle=$_POST['detalle'];
                $notificacions->prioridad=5;
                $notificacions->estado = Objectbase::STATUS_AC;
                $noticaciones= array('tribunales'=>array( $tribunal->id));
                $notificacions->enviarNotificaion( $noticaciones);
        
     }
    
     
    $EXITO = TRUE;
    $stado=1;
    mysql_query("COMMIT");
    
  if(isset($stado))
   {
    if($stado==1)
      {
       $_SESSION['estado']=$stado;
       header("Location: listatribunal.php");
          

      }else
        
        {
          $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente la asignacion de tribunales','titulo'=>'Registro De Asignaci&oacute; de Tribunales' ,'icono'=> 'warning_48.png');
          $ERROR = $html->getMessageBox ($mensaje);
       }
    }
    
    
        
     }else
 {
   $mensaje = array('mensaje' => 'Error,La Cantidad minima de Tribunales debe Ser 3', 'titulo' => 'Numero De Tribunales', 'icono' => 'warning_48.png');
    $ERROR = $html->getMessageBox($mensaje);;
 }
 }else
 {
     $mensaje = array('mensaje' => 'Hubo un problema, No se grabo correctamente la Asignacion de Tribunales', 'titulo' => 'Registro de Tribunales', 'icono' => 'warning_48.png');
    $ERROR = $html->getMessageBox($mensaje);
 }
 }
 }
 


  $smarty->assign("ERROR",  $ERROR);
   
} 
catch(Exception $e) 
{
   
  $smarty->assign("ERROR", handleError($e));
}
$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);

$TEMPLATE_TOSHOW = 'tribunal/tribunal.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>