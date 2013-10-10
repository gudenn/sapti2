<?php
try {
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  /** HEADER */
  $smarty->assign('title','Reportes');
  $smarty->assign('description','Reportes');
  $smarty->assign('keywords','Reportes');
/**
   * Menu superior
   */
  
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'pendientes/','name'=>'Pendientes');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'pendientes/'.basename(__FILE__),'name'=>'Proyectos pendientes');
  $smarty->assign("menuList", $menuList);
  //CSS
  $CSS[]  = "css/style.css";
  $smarty->assign('CSS','');

  //JS

  
   $JS[]  = "js/ajaxbuscarperfil.js";
   $smarty->assign('JS','');
   
   $smarty->assign('mascara'     ,'admin/listas.mascara.tpl');
  $smarty->assign('lista'       ,'admin/pendientes/lista.tpl');
  
  
  
   
   leerClase('Semestre');
   leerClase('Proyecto');
  
   $estado=  Proyecto::EST5_P;
 
 if (isset($_GET['proyecto_id']) )
  {
      
     $proyecto=new Proyecto($_GET['proyecto_id']);
    $proyecto_aux=$proyecto;
    $estudiante=$proyecto->getEstudiante();
   $estudiante_id= $estudiante->id;
    $area=$proyecto->getArea();
     $proyecto->estado_proyecto=  Proyecto::EST6_C;
     $proyecto->tipo_proyecto=  Proyecto::TIPO_PERFIL;
     $proyecto->save();
     
     $actualproyecto=new Proyecto();
     $actualproyecto->carrera_id=$proyecto_aux->carrera_id;
     $actualproyecto->estado=  Objectbase::STATUS_AC;
     $actualproyecto->es_actual=1;
     $actualproyecto->fecha_registro=$proyecto_aux->fecha_registro;
     $actualproyecto->modalidad_id=$proyecto_aux->modalidad_id;
     $actualproyecto->institucion_id=$proyecto_aux->institucion_id;
     $actualproyecto->nombre=$proyecto_aux->nombre;
     $actualproyecto->numero_asignado=$proyecto_aux->numero_asignado;
     $actualproyecto->tipo_proyecto=  Proyecto::TIPO_PROYECTO;
     $actualproyecto->save();
    //copiar Proyecto estudiante
    leerClase('Proyecto_estudiante');
    //$estudiante = new Estudiante($estudiante_id);

    $asignado                         = new Proyecto_estudiante();
    $asignado->proyecto_id            = $actualproyecto->id;
    $asignado->estudiante_id          = $estudiante_id;
    $asignado->estado                 = Objectbase::STATUS_AC;
    $asignado->fecha_asignacion       = date('d/m/Y');
    $asignado->save();
     
 //copiar area
    
    leerClase('Area');
    leerClase('Proyecto_area');
 
    $parea=new Proyecto_area();
    $parea->area_id=$area->id;
    $parea->proyecto_id=$actualproyecto->id;
    $parea->estado=  Objectbase::STATUS_AC;
    $parea->save();
    
 
    
  }
  
    $sqlr="SELECT p.id,u.nombre,s.codigo,p.nombre as titulo,CONCAT(apellido_paterno,apellido_materno) as apellidos,p.estado as estadop,p.estado_proyecto
FROM usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe
WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id=s.id AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id  and p.estado='AC' and p.estado_proyecto='".$estado."'";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
  // $arraytribunal=$fila;
   
   //array('name' => $fila["id"], 'home' => $fila["nombre"],'cell' => $fila["apellidos"], 'email' => 'john@myexample.com');
   
   $arraytribunal[]=$fila;
 }
 
 $obj_mysql  = $arraytribunal;
 // $objs_pg    = new Pagination($obj_mysql, 'g_cambios','',false,10);
 $smarty->assign('listadocentes'  , $arraytribunal);
 
 
}

catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

//if (isset($_GET['tlista']) && $_GET['tlista']) //recargamos la tabla central
 // $smarty->display('admin/listas.lista.tpl'); 
//else
  $smarty->display('admin/full-width_1.tpl');

?>
