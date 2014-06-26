<?php
try {
  define ("MODULO", "DOCENTE");
  require('_start.php');
  if(!isDocenteSession())
    header("Location: login.php");  

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
    $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  
   // Agregan el css
  $CSS[]  = URL_JS . "calendar/css/eventCalendar.css";
  $CSS[]  = URL_JS . "calendar/css/eventCalendar_theme.css";
  $CSS[]  = URL_CSS . "dashboard.css";

// Agregan el js
  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "calendar/js/jquery.eventCalendar.js";
    $CSS[]  = URL_JS . "box/box.css";
  $JS[]  = URL_JS ."box/jquery.box.js";
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);

  //CREAR UN DOCENTE
  leerClase('Usuario');
  leerClase('Docente');
  leerClase('Semestre');
  leerClase('Notificacion');
  leerClase('Dicta');

  $docente     = getSessionDocente();
  $usuario     = $docente->getUsuario();

  if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) && $docente->getDictaverifica($_GET['iddicta']))
  {
     $iddicta                = $_GET['iddicta'];
  }  else {
        header("Location: ../index.php");
  }
  $dicta=new Dicta($iddicta);
    /** HEADER */
  $smarty->assign('title',$dicta->getNombreMateria());
  $smarty->assign('description',$dicta->getNombreMateria());
  $smarty->assign('keywords','Proyecto Final');
  
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Asignaturas');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.materias.php','name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.proyecto-final.php?iddicta='.$iddicta,'name'=>$dicta->getNombreMateria());
  $smarty->assign("menuList", $menuList);
  
  $smarty->assign("docente", $docente);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("iddicta", $iddicta);
  $smarty->assign("ERROR", $ERROR);
  
  /**
   * Menu central
   */
  //----------------------------------//
  leerClase('Menu');
  $menu = new Menu('Estudiantes');
  $link = Docente::URL."estudiante/estudiante.lista.php?iddicta=".$iddicta;
  $menu->agregarItem('Estudiantes Registrados','Estudiantes Registrados en la Materia de '.$dicta->getNombreMateria(),'docente/inscritos.png',$link);
  $link = Docente::URL."evaluacion/estudiante.evaluacion-editar.php?iddicta=".$iddicta;
  $menu->agregarItem('Evaluaci&oacute;n de Estudiantes','Evaluaci&oacute;n de Estudiantes Registrados en la Materia de '.$dicta->getNombreMateria(),'docente/evaluacion.png',$link);  
  $link = Docente::URL."estudiante/inscripcion.estudiante-cvs.php?iddicta=".$iddicta;
  $menu->agregarItem('Inscripci&oacute;n de Estudiantes','Registro de Estudiantes Inscritos en la Materia de '.$dicta->getNombreMateria(),'docente/correccion.png',$link);
  $menus[] = $menu;
  
  $menu = new Menu('Calendario');
  $link = Docente::URL."calendario/calendario.evento.php?iddicta=".$iddicta;
  $menu->agregarItem('Calendario de Eventos','Calendario de todos los Eventos registrados por Tutor(es), Docente(s) y Tribunales','docente/calendar.png',$link);
  $link = Docente::URL."calendario/evento.registro.php?iddicta=".$iddicta;
  $menu->agregarItem('Registro de Eventos','Registro de Eventos y en la Materia de '.$dicta->getNombreMateria(),'docente/registroeve.png',$link);
  $link = Docente::URL."calendario/evento.lista.php?iddicta=".$iddicta;
  $menu->agregarItem('Edici&oacute;n de Eventos','Edici&oacute;n de Eventos de la Materia de '.$dicta->getNombreMateria(),'docente/edicion.png',$link);
  $menus[] = $menu;

  $menu = new Menu('Aprobaciones');
  $link = Docente::URL."estudiante/estudiante.vistobueno.php?iddicta=".$iddicta;
  $menu->agregarItem('Lista de Estudiantes','Lista de Estudiantes en Espera de Revision y Visto Bueno de su proyecto','docente/calendar.png',$link);
  $link = Docente::URL."estudiante/estudiante.lista.vistobueno.php?iddicta=".$iddicta;
  $menu->agregarItem('Lista de Estudiantes con Visto Bueno','Lista de Estudiantes en que Revision y aprobo con el Visto Bueno de su proyecto','docente/edicion.png',$link);
  $menus[] = $menu;
  
  $menu = new Menu('Correcciones Rapidas');
  $link = Docente::URL."estudiante/correccion.rapida.php?iddicta=".$iddicta;
  $menu->agregarItem('Estudiantes Registrados','Estudiantes Registrados en la Materia de '.$dicta->getNombreMateria(),'docente/inscritos.png',$link);
  $menus[] = $menu;
  //----------------------------------//  
  
  $smarty->assign("menus", $menus);
  function tipoconsulta($mat, $pro, $doc){
   switch ($mat) {
      case 'PR':
  $resul = "
SELECT av.id as id, av.descripcion as descripcion, av.fecha_avance as fecha, re.id as revid
FROM avance av, revision re
WHERE av.id=re.avance_id
AND re.estado_revision='RE'
AND av.proyecto_id='".$pro."'
AND re.revisor_tipo='DO'
AND re.revisor='".$doc."'
ORDER BY id DESC
          ";
        break;
      case 'PE':
  $resul = "
SELECT av.id as id, av.descripcion as descripcion, av.fecha_avance as fecha, re.id as revid
FROM avance av, revision re
WHERE av.id=re.avance_id
AND re.estado_revision='RE'
AND av.proyecto_id='".$pro."'
AND re.revisor_tipo='DP'
AND re.revisor='".$doc."'
ORDER BY id DESC
          ";
        break;
      default:
        break;
    } 
    return $resul;
}
  $countAvances=0;
  $countCorrecciones=0;
  $notificacion = new Notificacion();
  $counter = $notificacion->getTodasNotificaciones($usuario->id, '', '', ' AND estado_notificacion="SV" ');
  $sqlestudiantes ="SELECT es.id as id, es.codigo_sis as codigosis,CONCAT(us.apellido_paterno,' ',us.apellido_materno,' ',us.nombre) as estudiante, pr.nombre as nombrep,pr.id as pro_id
FROM dicta di, estudiante es, usuario us, inscrito it, proyecto pr, proyecto_estudiante pe
WHERE di.id=it.dicta_id
AND it.estudiante_id=es.id
AND es.usuario_id=us.id
AND pe.estudiante_id=es.id
AND pe.proyecto_id=pr.id
AND pr.es_actual=1
AND di.id=$iddicta";
   $sqlest = mysql_query($sqlestudiantes);
while ($fila= mysql_fetch_array($sqlest, MYSQL_ASSOC)) {
    $avan_new=array();
    $estu_ava=array();
    $estu_avaco=array();
    $correcciones=array();
    $obser='';
   $resul = "SELECT id, estado_avance, fecha_avance, descripcion
FROM avance av
WHERE av.proyecto_id='".$fila['pro_id']."'
AND av.estado_avance='CR'
ORDER BY id DESC";
   $sql = mysql_query($resul);
while ($fila1 = mysql_fetch_array($sql, MYSQL_ASSOC)) {
    $avan_new[]=array('id'=>$fila1['id'],'fecha_avance'=>$fila1['fecha_avance'],'descripcion'=>htmlspecialchars_decode($fila1['descripcion']));
}
   $sqlcorr = mysql_query(tipoconsulta($dicta->getTipoMateria(), $fila['pro_id'],$docente->id));
while ($fila1co = mysql_fetch_array($sqlcorr, MYSQL_ASSOC)) {
     $resulob = "
       SELECT *
FROM observacion ov
WHERE ov.revision_id='".$fila1co['revid']."'
";
   $sqlob = mysql_query($resulob);
while ($fila1ob = mysql_fetch_array($sqlob, MYSQL_ASSOC)) {
   $obser.=
           $fila1ob['observacion'].': '.htmlspecialchars_decode($fila1ob['respuesta']);
 }
 $correcciones[]=array('id'=>$fila1co['revid'],'fecha'=>$fila1co['fecha'],'descripcion'=>htmlspecialchars_decode($fila1co['descripcion']),'obser'=>$obser);
 }
if(count($avan_new)>0){
    $countAvances++;
}
if(count($correcciones)>0){
    $countCorrecciones++;
}
 }
  if(isset($_SESSION['mensaje']) && $_SESSION['mensaje']>=1)
  {
    leerClase('Html');
    $html    = new Html();
      $mensaje = array('mensaje'=>"Tiene ".$counter[1]." Notificaciones Pendientes. </br>Tiene ".$countAvances." Avances De Proyectos Pendientes. </br>Tiene ".$countCorrecciones." Correcciones De Proyectos Pendientes",'titulo'=>'Notificaciones Pendientes' ,'icono'=> 'warning_48.png');

    $ERROR   = $html->getMessageBox ($mensaje);
    $_SESSION['mensaje']=0;
    $smarty->assign("ERROR",$ERROR);

  }
  //No hay ERROR
  //$smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'docente/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>