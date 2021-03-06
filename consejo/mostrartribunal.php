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

    $CSS[]  = URL_CSS . "academic/3_column.css";
    $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  
  $CSS[]  = URL_JS . "ui/cafe-theme/jquery-ui-1.10.2.custom.min.css";
  
  $smarty->assign('CSS',$CSS);

  $smarty->assign('header_ui','1');

  
  //JS
 $JS[]  = URL_JS . "jquery.min.js";

  //Datepicker UI
  $JS[]  = URL_JS . "ui/jquery-ui-1.10.2.custom.min.js";
  $JS[]  = URL_JS . "ui/i18n/jquery.ui.datepicker-es.js";

  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  $smarty->assign('JS',$JS);
  //CREAR UN TIPO   DE DEF
  leerClase('Tribunal');
  leerClase("Proyecto");
  leerClase("Usuario");
  leerClase("Docente");
  leerClase("Estudiante");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");
  leerClase("Proyecto_estudiante");
  leerClase("Modalidad");
  leerClase("Consejo");
  leerClase('Defensa');
  leerClase("Semestre");
  
   $menuList[]     = array('url'=>URL.Consejo::URL,'name'=>'Consejo');
   $menuList[]     = array('url'=>URL . Consejo::URL.'listatribunal.php' ,'name'=>'Tribunal');
   $smarty->assign("menuList", $menuList);
  
        $rows = array();
       $usuario = new Usuario();
       //$smarty->assign('rows', $rows);
        $usuario_mysql  = $usuario->getAll();
        $usuario_id     = array();
        $usuario_nombre = array();
        while ($usuario_mysql && $row = mysql_fetch_array($usuario_mysql[0]))
        {
          $usuario_id[]     = $row['id'];
          $usuario_nombre[] = $row['nombre'];
          $rows=$row;
        }
       // $smarty->assign('filas'  , $rows);
       $smarty->assign('usuario_id'  , $usuario_id);
       $smarty->assign('usuario_nombre', $usuario_nombre);


    $proyecto= new Proyecto();
    $proyecto_sql= $proyecto->getAll();
    $proyecto_id= array();
    $proyecto_nombre=array();
    while ($proyecto_sql && $rows = mysql_fetch_array($proyecto_sql[0]))
     {
       $proyecto_id[]     = $rows['id'];
       $proyecto_nombre[] = $rows['nombre_proyecto'];
     }


    $smarty->assign('proyecto_id',$proyecto_id);
    $smarty->assign('proyecto_nombre',$proyecto_nombre);

   
      if(isset($_GET['defensa_id']))
      {
      $defensa= new Defensa($_GET['defensa_id']);
      $proyec= new Proyecto($defensa->proyecto_id);
     // $estudiante=  new Estudiante($_GET['proyecto_id']) ;
     // $proyec= $estudiante->getProyecto();
    $sql="
    SELECT d.id, u.nombre , CONCAT (u.apellido_paterno ,'  ', u.apellido_materno) as apellidos
    FROM  usuario u, docente d, tribunal t, proyecto p
    WHERE  u.id=d.usuario_id  and d.id=t.docente_id  and t.proyecto_id=p.id  and u.estado='AC'  and d.estado='AC'
    and t.estado='AC'  and p.estado='AC' and p.id=".$proyec->id;
     $resultado = mysql_query($sql);
     $arraytribunal= array();

     while ($fila = mysql_fetch_array($resultado)) 
     {
        $arraytribunal[]=$fila;
     }
    $smarty->assign('arraytribunal'  , $arraytribunal);


                 $estudiante= $proyec->getEstudiante();
                $usuario =  new Usuario($estudiante->usuario_id);
                $modalidad=  new Modalidad( $proyec->modalidad_id);
                $areaproyecto= $proyec->getArea();

            $smarty->assign('proyecto'  , $proyec);
            $smarty->assign('modalidad'  , $modalidad);
            $smarty->assign('usuario'  , $usuario);
            $smarty->assign('estudiante'  ,$estudiante); 
            $smarty->assign('area', $areaproyecto);

      }
    
    
      if(isset($_GET['estudiante_id']))
      {

   $estudiante=  new Estudiante($_GET['estudiante_id']) ;
   $proyec= $estudiante->getProyecto();
    $sql="
    SELECT d.id, u.nombre , CONCAT (u.apellido_paterno ,'  ', u.apellido_materno) as apellidos
    FROM  usuario u, docente d, tribunal t, proyecto p
    WHERE  u.id=d.usuario_id  and d.id=t.docente_id  and t.proyecto_id=p.id  and u.estado='AC'  and d.estado='AC'
    and t.estado='AC'  and p.estado='AC' and p.id=".$proyec->id;
     $resultado = mysql_query($sql);
     $arraytribunal= array();
      $semestre = new Semestre('',1);
    
    
  $valorh = $semestre->getValor('Lapso de tiempo para el rechazo a ser tribunal hras.',73);
    if (!$valorh)
    {
      //  echo $valorh;
  $semestre->setValor('Lapso de tiempo para el rechazo a ser tribunal hras.',73);
    }
     while ($fila = mysql_fetch_array($resultado)) 
     {$arrayAux= array();
       $arrayAux[]=$fila['id'];
       $arrayAux[]=$fila['nombre'];
       $arrayAux[]=$fila['apellidos'];
       $arrayAux[]=$proyec->getTribunalEstado($fila['id']);
        $tribunal= $proyec->getTribunal($fila['id']);
   
       $trasncurridos=$proyec->getTotalhorasTranscurridas($tribunal->dateHumanToSQl($tribunal->fecha_asignacion));
            if($trasncurridos > $valorh)
       {
         $tribunal->accion=  Objectbase::STATUS_AC;
        $tribunal->save();
           
       }
    
       $arrayAux[]=($valorh-$trasncurridos);
      $arraytribunal[]= $arrayAux;
      //  $arraytribunal[]=array("accion"=>"34");
     }
       $smarty->assign('arraytribunal'  , $arraytribunal);


               $proyectos =  $estudiante->getProyecto();
               $usuario =  new Usuario($estudiante->usuario_id);
               $modalidad=  new Modalidad( $proyectos->modalidad_id);
               $areaproyecto= $proyectos->getArea();
               
            $smarty->assign('proyecto'  , $proyectos);
            $smarty->assign('modalidad'  , $modalidad);
            $smarty->assign('usuario'  , $usuario);
            $smarty->assign('estudiante'  ,$estudiante); 
            $smarty->assign('area', $areaproyecto);

      }


  $smarty->assign("ERROR", $ERROR);
  
 
} 
catch(Exception $e) 
{

  $smarty->assign("ERROR", handleError($e));
}

$contenido = 'tribunal/mostrartribunal.tpl';
  $smarty->assign('contenido',$contenido);



$TEMPLATE_TOSHOW = 'tribunal/tribunal.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>