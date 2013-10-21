<?php
try {
  require('_start.php');

  /** HEADER */
  $smarty->assign('title','SAPTI - Perfil Detalle');
  $smarty->assign('description','Dertalle de Perfil');
  $smarty->assign('keywords','SAPTI detalle,perfil');

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
 
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.1.9.1.js";

  //Datepicker UI
  $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";

  $smarty->assign('JS',$JS);


  $smarty->assign("ERROR", '');


  //CREAR UN ESTUDIANTE
  leerClase('Proyecto');
  leerClase('Proyecto_estudiante');
  leerClase('Estudiante');
  leerClase('Usuario');
  leerClase('Modalidad');
  leerClase('Carrera');
  leerClase('Objetivo_especifico');
  leerClase('Proyecto_area');
  leerClase('Area');
 
 
  
  $columnacentro = 'buscarperfil/columna.centro.perfil-detalle.tpl';
  $smarty->assign('columnacentro',$columnacentro);
  
 $perfil_id=$_GET['id_perfil'];
 $proyecto=new Proyecto($perfil_id);
  $tutores=$proyecto->getProyectoTutor();
  echo $tutores[0]->id;
 $area=$proyecto->getArea();
 $nombre_a=$area[0]->nombre;
 $modalidad=new Modalidad($proyecto->modalidad_id);
 $pe=new Proyecto_estudiante($proyecto->id);
 $estudiante=new Estudiante($pe->estudiante_id);
   
 $usuario=new Usuario($estudiante->usuario_id);
 $usuario->nombre;
   
   
 $smarty->assign('usuario'  ,$usuario);
 $smarty->assign('proyecto'  ,$proyecto);
 $smarty->assign('modalida'  , $modalidad);
 //echo $modalidad->nombre;
 $smarty->assign('nombre_a'  , $nombre_a);
 $smarty->assign('sub_area'  , $sub_area);
 $smarty->assign('gestion'  , $gestion);
 
  
  
  $sqlr="SELECT p.id,u.nombre,s.codigo,p.nombre as titulo,CONCAT(apellido_paterno,' ',apellido_materno) as apellidos,p.estado as estadop ,a.nombre as area ,c.nombre as carrera, m.nombre as modalidad
FROM usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe,carrera c,proyecto_area pa ,area a,modalidad m
WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id=s.id and p.tipo_proyecto='PR'AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id and p.carrera_id=c.id and m.id=p.modalidad_id  and p.id='".$perfil_id."'";
  $resultado = mysql_query($sqlr);
  $arraylista= array();
  
  while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
  
   $arraylista[]=$fila;
   
  }
  $codigo=$arraylista[0]['id'];
  $nombre_n=$arraylista[0]['nombre'];
  $nombre_a=$arraylista[0]['apellidos'];
  $es=' ';
  $nombre_es=$nombre_n.$es.$nombre_a;
  $area=$arraylista[0]['area'];
  $sub_area=$arraylista[0]['subarea'];
  $gestion=$arraylista[0]['gestionaprobacion'];
  $modalidad=$arraylista[0]['modalidad'];
  $carrera=$arraylista[0]['carrera'];
  $titulo=$arraylista[0]['titulo'];
  $formulario=$arraylista[0]['formularioaprobacion'];
  $objetivo_g=$arraylista[0]['objetivogeneral'];
  $objetivo_e=$arraylista[0]['objetivoespecifico'];
  
  
  $descripcion=$arraylista[0]['descripcionperfil'];
 

 $smarty->assign("nombre_es", $nombre_es) ;
 $smarty->assign('titulo'  , $titulo);
 $smarty->assign('codigo'  , $codigo);
 $smarty->assign('area'  , $area);
 $smarty->assign('sub_area'  , $sub_area);
 $smarty->assign('gestion'  , $gestion);
 $smarty->assign('modalidad'  , $modalidad);
 $smarty->assign('tutor'  , $tutor);
 $smarty->assign('carrera'  , $carrera);
 $smarty->assign('formulario'  , $formulario);
 $smarty->assign('objetivo_g'  , $objetivo_g);
 $smarty->assign('objetivo_e'  , $objetivo_e);
 $smarty->assign('descripcion'  , $descripcion);

 $sqlr="SELECT e.descripcion
 FROM proyecto p,objetivo_especifico e
 WHERE p.id=e.proyecto_id and p.id='".$perfil_id."'";
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();
  
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
 {
  
   $arraytribunal[]=$fila;
  }
 
 
  $smarty->assign('listadocentes'  , $arraytribunal);
  
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $TEMPLATE_TOSHOW = 'perfil/3columnas.tpl';
  $smarty->display($TEMPLATE_TOSHOW);

?>