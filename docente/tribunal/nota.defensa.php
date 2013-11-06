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
       leerClase('Usuario');
       leerClase('Nota');
       leerClase('Nota_tribunal');
       leerClase('Tribunal');

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
       $menuList[]     = array('url'=>URL.Docente::URL.'tribunal','name'=>'Tribunal');
       $menuList[]     = array('url'=>URL.Docente::URL.'tribunal/publica.estudiante.lista.php','name'=>'Lista Estudiante');
       $smarty->assign("menuList", $menuList);

       
    if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
         {
            $docente=  getSessionDocente();
              
            
            
            if(isset($_POST['nota_tribunal']))
                 {
               if($_POST['nota_tribunal']>0 && is_numeric($_POST['nota_tribunal']) && $_POST['nota_tribunal'] <=100)
                    {
                    $estudiantes   =  new Estudiante($_POST['estudiante_id']);
                    $proyecto      =  $estudiantes ->getProyecto();
                    $tribunal      =  $proyecto->getTribunal($docente->id);
                    $tribunal->nota_tribunal=$_POST['nota_tribunal'];
                    $tribunal->save();
                    $nota= $proyecto->getNota();
                   
                    
                    $notadefensaa= 0;
                    $contador=0;
                        foreach ($proyecto->getTribunalesActivos() as $tribuna)
                       {
                         //  echo $tribuna->nota_tribunal;
                         if($tribuna->nota_tribunal!=0)
                         {
                           $contador=$contador+1;
                         $notadefensaa=$notadefensaa + $tribuna->nota_tribunal;
                         }
                       }
                       $notapromediodefensa=0;
                       if($notadefensaa!=0)
                       {
                    //   echo  $notadefensaa/$contador;
                      $notapromediodefensa=(0.7)*($notadefensaa/$contador);
                       }
                     //  echo $notapromediodefensa;
                       $notafinal=0;
                       
                       
                       
                       
                       
                       
                    
                    
                    if(!$nota)
                    {
                      $nota= new Nota();
                      $nota->proyecto_id     =  $proyecto->id;
                      $nota->nota_proyecto   =  80;
                      $nota->nota_defensa    =  $notapromediodefensa;
                
                      if($notapromediodefensa!=0 && $nota->nota_proyecto!=0)
                       {
                          $nota->nota_final      =   ($nota->nota_proyecto+$notapromediodefensa)/2; 
                       }
                     
                      $nota->estado          =  Objectbase::STATUS_AC;
                      $nota->save();
                      
                    }  else {
                    // $nota->nota_proyecto=9;
                      $nota->nota_defensa    =  $notapromediodefensa;
                      if($notapromediodefensa!=0 && $nota->nota_proyecto!=0)
                       {
                          $nota->nota_final      =   ($nota->nota_proyecto+$notapromediodefensa)/2; 
                       }
                       
                      $nota->save();
                    }
                    
                  } 
                  }
           
             
         }

       
       if (isset($_POST['observaciones'])) 
            $observaciones=$_POST['observaciones'];
           if (isset($_GET['id_estudiante'])) 
               $id_estudiante=$_GET['id_estudiante'];
           $docentes=  getSessionDocente();
           
           $estudiante     = new Estudiante($id_estudiante);
           $usuario        = $estudiante->getUsuario();
           $proyecto       = $estudiante->getProyecto();
           $tribuanls       = $proyecto->getTribunal($docentes->id);
            
            $smarty->assign("usuario", $usuario);
            $smarty->assign("estudiante", $estudiante);
            $smarty->assign("proyecto", $proyecto);
            $smarty->assign("tribunal",$tribuanls);

            $urlpdf=".../ARCHIVO/proyecto.pdf";
            $smarty->assign("urlpdf", $urlpdf);
            $vistobueno= new Visto_bueno();
            date_default_timezone_set('UTC');
            $vistobueno->fecha_visto_buena=date("d/m/Y");

 
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

     $TEMPLATE_TOSHOW = 'docente/tribunal/nota.defensa.tpl';
     $smarty->display($TEMPLATE_TOSHOW);
     ?>