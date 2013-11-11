<?php
try {
    define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php"); 

  leerClase("Estudiante");
  leerClase("Usuario");
  leerClase("Evaluacion");
  leerClase("Docente");
  leerClase("Dicta");
  leerClase('Avance');
  leerClase('Revision');

  /** HEADER */
  $smarty->assign('title','Evalucion de Proyecto');
  $smarty->assign('description','Gesti&oacute;n de Evaluciones del Proyecto');
  $smarty->assign('keywords','Gestion,Evaluacion,Estudiante');

  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_CSS . "editablegrid.css";
  $CSS[]  = URL_JS . "ventanasmodales/simplemodaldetalle.css";
  $CSS[]  = URL_JS . "box/box.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "tablaeditable/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "tablaeditable/tabla.revision.lista.revisor.js";
  $JS[]  = URL_JS . "ventanasmodales/observacion.detalle.js";
  $JS[]  = URL_JS . "ventanasmodales/avance.detalle.modal.js";
  $JS[]  = URL_JS . "ventanasmodales/historial.notas.js";
  $JS[]  = URL_JS . "ventanasmodales/jquery.simplemodal-1.4.4.js";
    $JS[]   = URL_JS . "box/jquery.box.js";
  $smarty->assign('JS',$JS);
  $docente     = getSessionDocente();
  if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) && $docente->getDictaverifica($_GET['iddicta']))
  {
     $iddicta                = $_GET['iddicta'];
  }  else {
        header("Location: ../index.php");
  }
      if( isset($_GET['estudiente_id']) && is_numeric($_GET['estudiente_id']) ){
       $id_estudiante=$_GET['estudiente_id'];
  }  else {
      header("Location: ../index.php");
  }
  $dicta = new Dicta($iddicta);
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.proyecto-final.php?iddicta='.$iddicta,'name'=>$dicta->getNombreMateria());
  $menuList[]     = array('url'=>URL.Docente::URL.'estudiante/estudiante.lista.php?iddicta='.$iddicta,'name'=>'Estudiantes Inscritos');
  $menuList[]     = array('url'=>URL.Docente::URL.'evaluacion/proyecto.evaluacion.php?iddicta='.$iddicta.'&estudiente_id='.$id_estudiante,'name'=>'Evaluaci&oacute;n al Proyecto');
  $smarty->assign("menuList", $menuList);

  $estudiante     = new Estudiante($id_estudiante);
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();
  $avance   = new Avance();
  $revision   = new Revision();
  
    $resul = "SELECT id, estado_avance, fecha_avance, descripcion
FROM avance av
WHERE av.proyecto_id='".$proyecto->id."'
ORDER BY id DESC";
   $sql = mysql_query($resul);
   $objs2=array();
while ($fila1 = mysql_fetch_array($sql, MYSQL_ASSOC)) {
    $objs=array();
    $objs1=array();
   $objs[]=$fila1["id"];
   $objs[]=$fila1["estado_avance"];
   $objs[]=$fila1["fecha_avance"];
   $objs[]=$fila1["descripcion"];
   $resul1 = "SELECT av.id as idav, re.id as id, re.estado_revision as estado, re.fecha_revision as fecha_re, re.revisor_tipo as revisor, re.fecha_correccion as fecha_co, re.revisor as idrev
FROM proyecto pr, revision re, avance av
WHERE re.avance_id=av.id
AND av.proyecto_id=pr.id
AND av.id='".$fila1['id']."'
";
   $sql1 = mysql_query($resul1);
while ($fila11 = mysql_fetch_array($sql1, MYSQL_ASSOC)) {
   $objs1[]=$fila11; 
   
 }
    $objs[]=$objs1;
    $objs2[]=$objs;
 }

  $smarty->assign("objs", $objs2);
  $resul = "
      SELECT it.evaluacion_id as id
FROM dicta di, inscrito it
WHERE it.dicta_id=di.id
AND it.estudiante_id='".$estudiante->id."'
AND di.id='".$iddicta."' 
          ";
   $sql2 = mysql_query($resul);
while ($fila1 = mysql_fetch_array($sql2, MYSQL_ASSOC)) {
   $idevaluacion[]=$fila1;
 }
  $evaluacion     = new Evaluacion($idevaluacion[0]['id']);  

  $smarty->assign("usuario", $usuario);
  $smarty->assign("proyecto", $proyecto);
  $smarty->assign("estudiante", $estudiante);
  $smarty->assign("evaluacion", $evaluacion);
    $smarty->assign("avance", $avance);
  $smarty->assign("revision", $revision);
  
     if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    $EXITO = false;
    $evaluacion->objBuidFromPost();
    $eva1=$evaluacion->evaluacion_1;
    $eva2=$evaluacion->evaluacion_2;
    $eva3=$evaluacion->evaluacion_3;
    $promedio=  round((($eva1+$eva2+$eva3)/3));
    $evaluacion->promedio=$promedio;
    $evaluacion->save();
    $EXITO = true;
    }

  //No hay ERROR
  $ERROR = '';
    leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje'=>'Se grabo correctamente la Evaluación','titulo'=>'Registro de Evaluación' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente la Evaluación','titulo'=>'Registro de Evaluación' ,'icono'=> 'warning_48.png');
   $ERROR = $html->getMessageBox ($mensaje);
  }
  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

  $token                = sha1(URL . time());
  $_SESSION['register'] = $token;
  $smarty->assign('token',$token);
  $smarty->display('docente/evaluacion/full-width.proyecto.evaluacion.tpl');
?>