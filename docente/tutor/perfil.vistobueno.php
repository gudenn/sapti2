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
  leerClase('Tutor');
  leerClase('Notificacion');
  
  

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
  
 $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
    $menuList[]     = array('url'=>URL.Docente::URL.'tutor','name'=>'Tutor');
    $menuList[]     = array('url'=>URL.Docente::URL.'tutor/perfil.estudiante.lista.php','name'=>'Lista Estudiantes');
     $smarty->assign("menuList", $menuList);
  
  if (isset($_POST['observaciones'])) 
  $observaciones=$_POST['observaciones'];
    if (isset($_GET['id_estudiante'])) 
  $id_estudiante=$_GET['id_estudiante'];
    
  $estudiante     = new Estudiante($id_estudiante);
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();
    //////creando la clase de visto bueno para realizar el visto bueno del proyecto de un estudiante
 
  
  $smarty->assign("usuario", $usuario);
  $smarty->assign("proyecto", $proyecto);
  $smarty->assign("estudiante", $estudiante);
  
   
     $vistobueno= new Visto_bueno();
    date_default_timezone_set('America/La_Paz');
      date_default_timezone_set('UTC');
     $vistobueno->fecha_visto_buena=date("d/m/Y");
      $smarty->assign("vistobueno", $vistobueno);
    if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
        $vistobueno                    =       new Visto_bueno();
        $docente                       =       getSessionDocente();

          
        $estudiante= new Estudiante($_POST['estudiante_id']);/// crando el estudiante
        $proyectoestudiante= $estudiante->getProyecto();  // obtien e el proyecto del estudioante
        $usuario= getSessionUser();
        $usuario->getAllObjects();

       $docentestudiante= $estudiante->getDocente();//  retorna el docente del estudiante
          
       foreach ($usuario->tutor_objs as $tutor_id)
        {
              $vistobueno->objBuidFromPost();
             // $vistobueno->proyecto_id       =       $_POST['pro'];
              $vistobueno->visto_bueno_tipo  =        Visto_bueno::E2_TUTOR;
              $vistobueno->visto_bueno_id    =     $tutor_id->id;    
              $vistobueno->estado            =        Objectbase::STATUS_AC;
          $vistobueno->save();
              
              
                    $notificacions= new Notificacion();
                    $notificacions->objBuidFromPost();
                    $notificacions->proyecto_id = $proyecto->id; 
                    $notificacions->tipo        =  Notificacion::TIPO_MENSAJE;
                    $notificacions->fecha_envio = date("j/n/Y");
                    $notificacions->asunto      = "Visto bueno del Tutor";
                    $notificacions->prioridad   = 7;
                    $notificacions->estado      = Objectbase::STATUS_AC;

                    $noticaciones = array('estudiantes'=>array($estudiante->id));
                    $notificacions->enviarNotificaion( $noticaciones);
              
              
              
       }
       
              $listatutores=$proyectoestudiante->getTutores();  ///  retorna lista de los tutores de un estudiante
          // $vistobuenotutores= $proyectoestudiante->getVbTutorPerfilIds();  //  retorna la lista de los vistos buenos de los tutores
                 
            
           // var_dump( $vistobuenotutores);
            
            
                  $listatutores=$proyectoestudiante->getTutores();  ///  retorna lista de los tutores de un estudiante
         //   var_dump($listatutores);
             $vistobuenotutores=array();  
            $listatotaltutores=        $proyectoestudiante->getVbTutorPerfilIds();
           // var_dump($listatotaltutores);
              foreach ( $listatotaltutores as $v)
                {
                          $tutor= new Tutor($v);
                          $tutor->getAllObjects();
    //Consejo
                          foreach ( $tutor->proyecto_tutor_objs as $proyecttutor)
                          {
                            if ($proyecttutor->estado_tutoria!='FI'  &&  $proyecttutor->proyecto_id==$proyectoestudiante->id)
                            {
                            $vistobuenotutores[]=$v;
                        }

                          }
   
                 }
                
            
                 $totalvistobuenotutor=true;
                 if(sizeof($listatutores)>0)
                 {
                  foreach ($listatutores as $value) 
                  {
                  if(sizeof($vistobuenotutores)>0)
                  {
                  if(!in_array($value->id, $vistobuenotutores))
                  {
                   
                    $totalvistobuenotutor=FALSE;
                    break;

                  }
                  }else
                  {
                    $totalvistobuenotutor=FALSE;
                    break;
                  }
                  }
                 }  else
                   {
                   
                   $totalvistobuenotutor=FALSE;
                   
                   }
                  
                  
                  $vistobuenodocente=$proyectoestudiante->getVbDocentePerfil($docentestudiante->id);
                 
                  if((sizeof($vistobuenodocente)!=0)  && $totalvistobuenotutor )
                  {
                    
                   $proyectoestudiante->estado_proyecto="VB";
                   $proyectoestudiante->save();

                   $notificacions= new Notificacion();
                    $notificacions->objBuidFromPost();
                    $notificacions->proyecto_id = $proyecto->id; 
                    $notificacions->tipo        =  Notificacion::TIPO_MENSAJE;
                    $notificacions->fecha_envio = date("j/n/Y");
                    $notificacions->asunto      = "Tu Formulario de Registro de Perfil ha sido Habilitado";
                    $notificacions->prioridad   = 7;
                    $notificacions->estado      = Objectbase::STATUS_AC;

                    $noticaciones = array('estudiantes'=>array($estudiante->id));
                    $notificacions->enviarNotificaion( $noticaciones);
          
                  }
                  
                  

          $_SESSION['estado']=1;
          header("Location:perfil.vistobueno.lista.php");
                    
                  
       
        
        
    }

  //No hay ERROR
  $smarty->assign("ERROR",'');
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $token = sha1(URL . time());
  $_SESSION['register'] = $token;
  $smarty->assign('token',$token);
  
$TEMPLATE_TOSHOW = 'docente/tutor/perfil.visto.registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>