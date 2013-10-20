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
  
 
  if (isset($_POST['observaciones'])) 
  $observaciones=$_POST['observaciones'];
    if (isset($_GET['id_estudiante'])) 
  $id_estudiante=$_GET['id_estudiante'];
    
  $estudiante     = new Estudiante($id_estudiante);
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();
  echo  $usuario->tutor_id;
    //////creando la clase de visto bueno para realizar el visto bueno del proyecto de un estudiante
 
  
  $smarty->assign("usuario", $usuario);
  $smarty->assign("proyecto", $proyecto);
    $smarty->assign("estudiante",  $estudiante );
    
    $urlpdf=".../ARCHIVO/proyecto.pdf";
    $smarty->assign("urlpdf", $urlpdf);
      $vistobueno= new Visto_bueno();
    date_default_timezone_set('UTC');
    $vistobueno->fecha_visto_buena=date("d/m/Y");

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
       }
       
       
            $listatutores=$proyectoestudiante->getTutores();  ///  retorna lista de los tutores de un estudiante
            $vistobuenotutores= $proyectoestudiante->getVbTutorProyectoIds();  //  retorna la lista de los vistos buenos de los tutores

      
                 $totalvistobuenotutor=true;
                foreach ($listatutores as $value) 
                  {

                  if(!in_array($value->id, $vistobuenotutores))
                  {
                    $totalvistobuenotutor=FALSE;
                    break;;

                  }
                  }
                  
                  
                  $vistobuenodocente=$proyectoestudiante->getVbDocenteProyecto($docentestudiante->id);
                 
                  if((sizeof($vistobuenodocente)!=0)  && $totalvistobuenotutor )
                  {
                    
                   $proyectoestudiante->estado_proyecto="VB";
                   $proyectoestudiante->save();

                  }

    $ir = "Location: estudiante.lista.php";
    header($ir);
        
        
        
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
  
$TEMPLATE_TOSHOW = 'docente/tutor/full-width.visto.registro.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>