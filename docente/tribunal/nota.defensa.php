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
       leerClase('Notificacion');

       /** HEADER */
       $smarty->assign('title','Proyecto Final');
       $smarty->assign('description','Proyecto Final');
       $smarty->assign('keywords','Proyecto Final');

       //CSS
       $CSS[]  = URL_CSS . "academic/tables.css";
       $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
       $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
        $JS[]  = URL_JS . "jquery.min.js";
      //BOX
      $CSS[]  = URL_JS . "box/box.css";
      $JS[]  = URL_JS ."box/jquery.box.js";
       //JS
    

       //Datepicker UI
       $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
       $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";

       //Validation
       $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
       $JS[]  = URL_JS . "validate/jquery.validationEngine.js";
       $JS[]  = URL_JS . "jquery.addfield.js";
       $smarty->assign('CSS',$CSS);
       $smarty->assign('JS',$JS);
       $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
       $menuList[]     = array('url'=>URL.Docente::URL.'tribunal','name'=>'Tribunal');
       $menuList[]     = array('url'=>URL.Docente::URL.'tribunal/publica.estudiante.lista.php','name'=>'Lista Estudiante');
       $smarty->assign("menuList", $menuList);
       $idestudiante='';
       if(isset($_GET['id_estudiante']) && is_numeric($_GET['id_estudiante']))
       {
           $idestudiante=$_GET['id_estudiante'];
           
       }
       $estudiante= new Estudiante($idestudiante);

         $proyecto      =  $estudiante ->getProyecto();
         $tribunal= $proyecto->getTribunal($docente->id);
    if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
        {
            $stado=0;
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
                    
                           $notificacion = new Notificacion();
                            $notificacion->objBuidFromPost();
                            $notificacion->proyecto_id=$proyecto->id; 
                            $notificacion->tipo=  Notificacion::TIPO_MENSAJE;
                            $notificacion->fecha_envio=date("j/n/Y");
                            $notificacion->asunto="Nota de la defensa";
                             $notificacion->detalle="Su nota es : " . $tribunal->nota_tribunal;
                            $notificacion->prioridad=5;
                            $notificacion->estado = Objectbase::STATUS_AC;
                            $noticaciones= array('estudiantes'=>array($proyecto->getEstudiante()->id));
                            $notificacion->enviarNotificaion( $noticaciones);
                    
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
                  
                  
                  if($contador==3)
                  {
                     $proyecto->estado_proyecto=  Proyecto::EST5_F;
                     $proyecto->save();
                     
                             $notificacion = new Notificacion();
                            $notificacion->objBuidFromPost();
                            $notificacion->proyecto_id=$proyecto->id; 
                            $notificacion->tipo=  Notificacion::TIPO_MENSAJE;
                            $notificacion->fecha_envio=date("j/n/Y");
                            $notificacion->asunto="Acta de Defensa";
                             $notificacion->detalle="Debe apersonarse a la secretaria de la carrera para recoger su acta de defensa. nota final :".round($nota->nota_final,2);
                            $notificacion->prioridad=5;
                            $notificacion->estado = Objectbase::STATUS_AC;
                            $noticaciones= array('estudiantes'=>array($proyecto->getEstudiante()->id));
                            $notificacion->enviarNotificaion( $noticaciones);
                    
       
                  }
           
                  
              $stado=1;
         }


 
        leerClase('Html');
       $html = new Html();
       $ERROR='';
       if(isset($stado))
            {
         if($stado==1){
           $mensaje = array('mensaje'=>'Se grabo correctamente  la Nota','titulo'=>'Registro de la Nota;' ,'icono'=> 'tick_48.png');
           $ERROR = $html->getMessageBox ($mensaje);
            }  else {
          $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente','titulo'=>'Registro de Area' ,'icono'=> 'warning_48.png');
          $ERROR = $html->getMessageBox ($mensaje);
                }
           }
        $smarty->assign("estudiante",$estudiante);
          $smarty->assign("proyecto",$proyecto);
           $smarty->assign("tribunal",$tribunal);
          
       $smarty->assign("ERROR",$ERROR);
     } 
     catch(Exception $e) 
     {
         echo $e;
       $smarty->assign("ERROR", handleError($e));
     }
       $token = sha1(URL . time());
       $_SESSION['register'] = $token;
       $smarty->assign('token',$token);

     $TEMPLATE_TOSHOW = 'docente/tribunal/nota.defensa.tpl';
     $smarty->display($TEMPLATE_TOSHOW);
     ?>