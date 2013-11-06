<?php
try {
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Pendientes');
  $smarty->assign('description','Pendientes');
  $smarty->assign('keywords','Pendientes');
/**
   * Menu superior
 * 
 * 
   */
   //Datepicker & Tooltips $ Dialogs UI
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  $JS[]   = URL_JS . "jquery-ui-1.10.3.custom.min.js";
  $JS[]   = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";
  
    //BOX
  $CSS[] = URL_JS . "box/box.css";
  $JS[]  = URL_JS . "box/jquery.box.js";
  
  
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);


  $smarty->assign("ERROR", '');

  
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'pendientes/','name'=>'pendientes');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'pendientes/'.basename(__FILE__),'name'=>'Proyectos pendientes');
  $smarty->assign("menuList", $menuList);

  
  
  $smarty->assign('header_ui','1');
  $smarty->assign('CSS','');
  $smarty->assign('JS','');
   
  $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/pendientes/lista.tpl');
  
  
  
   
   leerClase('Semestre');
   leerClase('Proyecto');
   leerClase('Vigencia');
   leerClase('Tutor');
   leerClase('Proyecto_tutor');
  
   $estado=  Proyecto::EST5_P;
 
 if (isset($_GET['proyecto_id']) )
  {
     $EXITO = false;
     mysql_query("BEGIN");
   
     $proyecto=new Proyecto($_GET['proyecto_id']);
     $proyecto_aux=$proyecto;
     $estudiante=$proyecto->getEstudiante();
     $estudiante_id= $estudiante->id;
     $tutores=$proyecto->getProyectoTutor();
     $areas=$proyecto->getArea();
     $subarea=$proyecto->getSubarea();
     $objetivos=$proyecto->getObjetivo();
 
     if($proyecto_aux->estado_proyecto!='CO'){
    
     $actualproyecto=new Proyecto();
     $actualproyecto->carrera_id=$proyecto_aux->carrera_id;
     $actualproyecto->estado=  Objectbase::STATUS_AC;
     $actualproyecto->es_actual=1;
     $actualproyecto->fecha_registro=$proyecto_aux->fecha_registro;
     $actualproyecto->modalidad_id=$proyecto_aux->modalidad_id;
     $actualproyecto->institucion_id=$proyecto_aux->institucion_id;
     $actualproyecto->nombre=$proyecto_aux->nombre;
     $actualproyecto->registrado_por=$proyecto_aux->registrado_por;
     $actualproyecto->descripcion=$proyecto_aux->descripcion;
     $actualproyecto->director_carrera=$proyecto_aux->director_carrera;
     $actualproyecto->docente_materia=$proyecto_aux->docente_materia;
     $actualproyecto->numero_asignado=$proyecto_aux->numero_asignado;
     $actualproyecto->objetivo_general=$proyecto_aux->objetivo_general;
     $actualproyecto->trabajo_conjunto=$proyecto_aux->trabajo_conjunto;
     $actualproyecto->responsable=$proyecto_aux->responsable;
     $actualproyecto->tipo_proyecto=  Proyecto::TIPO_PROYECTO;
     $actualproyecto->estado_proyecto=  Proyecto::EST6_C;
     $actualproyecto->save();
    //copiar Proyecto estudiante
    leerClase('Proyecto_estudiante');
   
    $asignado                         = new Proyecto_estudiante();
    $asignado->proyecto_id            = $actualproyecto->id;
    $asignado->estudiante_id          = $estudiante_id;
    $asignado->estado                 = Objectbase::STATUS_AC;
    $asignado->fecha_asignacion       = date('d/m/Y');
    $asignado->save();
     
    //copiar area
    
    leerClase('Area');
    leerClase('Proyecto_area');
    
    foreach ($areas as $nueva)
    { 
    $parea=new Proyecto_area();
    $parea->area_id =$nueva->id;
    $parea->proyecto_id=$actualproyecto->id;
    $parea->estado=  Objectbase::STATUS_AC;
    $parea->save();
    }
    //copiar Subarea
    
    leerClase('Sub_area');
    leerClase('Proyecto_sub_area');
    
    foreach ($subarea as $nsub)
    { 
    $psarea=new Proyecto_sub_area();
    $psarea->sub_area_id=$nsub->id;
    $psarea->proyecto_id=$actualproyecto->id;
    $psarea->estado=  Objectbase::STATUS_AC;
    $psarea->save();
    }
    //copiar Objetivos
    leerClase('Objetivo_especifico');
    foreach ($objetivos as $especifico)
    { 
    $objetivos=new Objetivo_especifico();
    $objetivos->descripcion=$especifico->descripcion;
    $objetivos->proyecto_id=$actualproyecto->id;
    $objetivos->estado=  Objectbase::STATUS_AC;
    $objetivos->save();
    }
   
    
     //copiar el tutor
     foreach ($tutores as $protut)
    { 
    $proyectotutor=new Proyecto_tutor($protut->id);
    $proyectotutor->proyecto_id=$actualproyecto->id;
    $proyectotutor->save();
    }
     //grabamos la vigencia del proyecto
     $vigencia=new Vigencia();
     $vigencia->estado=  Objectbase::STATUS_AC;
     $vigencia->estado_vigencia=  Vigencia::ESTADO_NORMAL;
     $vigencia->fecha_inicio=date('d/m/Y');
     $vigencia->fecha_fin= date("d/m/Y",strtotime(" +2 year") );
     $vigencia->proyecto_id=$actualproyecto->id;
     $vigencia->save();
   
              
    $EXITO = TRUE;
    mysql_query("COMMIT");
      
  }
     $proyecto->estado_proyecto=  Proyecto::EST6_C;
     $proyecto->es_actual=0;
     $proyecto->tipo_proyecto=  Proyecto::TIPO_PERFIL;
     $proyecto->save();
    
     
 
  }
  
  //buscamos el proyeco
  
    $sqlr="SELECT DISTINCT  e.id ,p.id as pid,e.id as eid,u.nombre,s.codigo,p.nombre as titulo,CONCAT(apellido_paterno,' ',apellido_materno) as apellidos,p.estado as estadop,p.estado_proyecto
           FROM usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe
           WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id=s.id AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id  and p.estado='AC' and p.estado_proyecto='".$estado."'";
           $resultado = mysql_query($sqlr);
           $arraytribunal= array();
  
         while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
               {
 
                           $arraytribunal[]=$fila;
               }
 
        

              $smarty->assign('listadocentes'  , $arraytribunal);
 
 
 //No hay ERROR
  $ERROR = '';
  leerClase('Html');
  $html = new Html();
  if (isset($EXITO)) {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje' => 'Se grabo correctamente el Docente', 'titulo' => 'Registro de Docente', 'icono' => 'tick_48.png');
    else
      $mensaje = array('mensaje' => 'Hubo un problema, No se grabo correctamente el docente', 'titulo' => 'Registro de Docente', 'icono' => 'warning_48.png');
    $ERROR = $html->getMessageBox($mensaje);
  }
 
 
}

catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}


  $smarty->display('admin/full-width_1.tpl');

?>
