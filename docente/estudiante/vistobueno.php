<?php
try {
  define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
  header("Location: ../login.php");
  leerClase('Visto_bueno');
  leerClase('Docente');
 
  leerClase('Estudiante');
  leerClase('Usuario');
  leerClase('Proyecto');
  leerClase('Notificacion');
  leerClase('Docente');
  leerClase('Dicta');
  leerClase('Visto_bueno');
  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
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
  $JS[]  = URL_JS . "jquery.addfield.js";
  $smarty->assign('JS',$JS);
  
      $docente     = getSessionDocente();
  if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) && $docente->getDictaverifica($_GET['iddicta']))
  {
     $iddicta                = $_GET['iddicta'];
  }  else {
       header("Location: ../index.php");
  }
  $dicta=new Dicta($iddicta);
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.proyecto-final.php?iddicta='.$iddicta,'name'=>$dicta->getNombreMateria());
  $menuList[]     = array('url'=>URL.Docente::URL.'estudiante/estudiante.lista.php?iddicta='.$iddicta,'name'=>'Estudiantes Inscritos');
  $menuList[]     = array('url'=>URL.Docente::URL.'estudiante/vistobueno.php?id_estudiante='.$_GET['id_estudiante'].'&iddicta='.$iddicta,'name'=>'Estudiantes Inscritos');
  $smarty->assign("menuList", $menuList);
  
 if (isset($_GET['id_estudiante']))
  {
   $estudiante     = new Estudiante($_GET['id_estudiante']);
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();
  
  $smarty->assign("estudiante",  $estudiante);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("proyecto", $proyecto);
  
   }
    $vistobueno= new Visto_bueno();
    date_default_timezone_set('UTC');
    $vistobueno->fecha_visto_buena=date("d/m/Y");
    
    if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
      $stado=1;
    
    //  $docen
    $proyecto =    new Proyecto($_POST['proyecto_id']);
    $listavistobueno= $proyecto->getVbTutor();
    $listatutores=$proyecto->getTutores();
    //echo $proyecto->estado_proyecto;
   ///////////////////////////////////////////////////perfil///////////////////////
    if($proyecto->tipo_proyecto==Proyecto::TIPO_PERFIL)
    {
    $vistobuenotutores= $proyecto->getVbTutorPerfilIds();
    
    //$vistobuenotutores= $proyecto->getVbTutor();
   
    
    
     
     $docente                       =       getSessionDocente();
     $sql="SELECT v.*
from  visto_bueno  v
where   v.proyecto_id=11 and v.visto_bueno_id=4 and v.visto_bueno_tipo='DO'";
    $resultado = mysql_query($sql);
  
     
     $visto= $proyecto->getVistoDocentePE($docente->id);
   
  
    // echo $visto->proyecto_id;
      $vistobueno                    =       new Visto_bueno($visto->id);
     $vistobueno->objBuidFromPost();
     $vistobueno->proyecto_id       =        $proyecto->id;
     $vistobueno->visto_bueno_tipo  =        Visto_bueno::E1_DOCENTE;
     $vistobueno->visto_bueno_id    =        $docente->id;
     $vistobueno->estado            =        Objectbase::STATUS_AC;
     $vistobueno->save();
     
                    $notificacions= new Notificacion();
                    $notificacions->objBuidFromPost();
                    $notificacions->proyecto_id = $proyecto->id; 
                    $notificacions->tipo        =  Notificacion::TIPO_MENSAJE;
                    $notificacions->fecha_envio = date("j/n/Y");
                    $notificacions->asunto      =  " Visto bueno del Docente";
                    $notificacions->prioridad   = 7;
                    $notificacions->estado      = Objectbase::STATUS_AC;

                    $noticaciones = array('estudiantes'=>array($_POST['estudiante_id']));
                    $notificacions->enviarNotificaion( $noticaciones);
    
  
    
    $totalvistobuenotutor=true;
    
    if(sizeof($listatutores)>0)
    {
    foreach ($listatutores as $value) 
      {
      
      if(!in_array($value->id, $vistobuenotutores))
      {
        $totalvistobuenotutor=FALSE;
        break;;
        
      }
     }
    }  else {
       $totalvistobuenotutor=FALSE;
    }
     
     
   //  $vistobuenodocente= $proyecto->getVbDocentePerfil(getSessionDocente()->id);
     
     
     if( $totalvistobuenotutor)
       {
       // $proyecto = new Proyecto($vistobueno->proyecto_id);
        $proyecto->estado_proyecto="VB";
        $proyecto->save();
        
                   $notificacions= new Notificacion();
                    $notificacions->objBuidFromPost();
                    $notificacions->proyecto_id = $proyecto->id; 
                    $notificacions->tipo        =  Notificacion::TIPO_MENSAJE;
                    $notificacions->fecha_envio = date("j/n/Y");
                    $notificacions->asunto      = "Esta Habilitado tu Formulario";
                    $notificacions->prioridad   = 7;
                    $notificacions->estado      = Objectbase::STATUS_AC;

                    $noticaciones = array('estudiantes'=>array($_POST['estudiante_id']));
                    $notificacions->enviarNotificaion( $noticaciones);
        
        
       }
     }  else {
         
     
       
        $vistobuenotutores= $proyecto->getVbTutorProyectoIds();
    
    //$vistobuenotutores= $proyecto->getVbTutor();
    $visto= $proyecto->getVistoDocentePE($docente->id);
     $vistobueno                    =       new Visto_bueno( $visto->id);
     $docente                       =       getSessionDocente();
     $vistobueno->objBuidFromPost();
     $vistobueno->proyecto_id       =        $proyecto->id;
     $vistobueno->visto_bueno_tipo  =        Visto_bueno::E1_DOCENTE;
     $vistobueno->visto_bueno_id    =        $docente->id;
     $vistobueno->estado            =        Objectbase::STATUS_AC;
     $vistobueno->save();
     
                    $notificacions= new Notificacion();
                    $notificacions->objBuidFromPost();
                    $notificacions->proyecto_id = $proyecto->id; 
                    $notificacions->tipo        =  Notificacion::TIPO_MENSAJE;
                    $notificacions->fecha_envio = date("j/n/Y");
                    $notificacions->asunto      =  " Visto bueno del Docente";
                    $notificacions->prioridad   = 7;
                    $notificacions->estado      = Objectbase::STATUS_AC;

                    $noticaciones = array('estudiantes'=>array($_POST['estudiante_id']));
                    $notificacions->enviarNotificaion( $noticaciones);
    
  
    
    $totalvistobuenotutor=true;
    if(sizeof($listatutores)>0)
    {
    foreach ($listatutores as $value) 
      {
      
      if(!in_array($value->id, $vistobuenotutores))
      {
        $totalvistobuenotutor=FALSE;
        break;;
        
      }
     }
    }  else {
        $totalvistobuenotutor=FALSE;
    }
     
   //  $vistobuenodocente= $proyecto->getVbDocentePerfil(getSessionDocente()->id);
     
     
     if( $totalvistobuenotutor)
       {
       // $proyecto = new Proyecto($vistobueno->proyecto_id);
        $proyecto->estado_proyecto="VB";
        $proyecto->save();
        
                   $notificacions= new Notificacion();
                    $notificacions->objBuidFromPost();
                    $notificacions->proyecto_id = $proyecto->id; 
                    $notificacions->tipo        =  Notificacion::TIPO_MENSAJE;
                    $notificacions->fecha_envio = date("j/n/Y");
                    $notificacions->asunto      = "Estas Habilitado para tus Defensas";
                    $notificacions->prioridad   = 7;
                    $notificacions->estado      = Objectbase::STATUS_AC;

                    $noticaciones = array('estudiantes'=>array($_POST['estudiante_id']));
                    $notificacions->enviarNotificaion( $noticaciones);
        
        
       }
       
     }
    
    }
          $ERROR = ''; 
  leerClase('Html');
  $html  = new Html();
  //$moderador=0;
  if(isset($stado))
  {
  if($stado==1){
       $_SESSION['estado']=$stado;
          header("Location: ../../docente");
  
  }  else {
          $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente','titulo'=>'Visto Bueno' ,'icono'=> 'warning_48.png');
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
  $smarty->assign('token',$token);
  
$TEMPLATE_TOSHOW = 'docente/vistobueno/full-width.visto.registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>