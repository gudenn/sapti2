<?php
try {
    define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php"); 

  leerClase('Estudiante');
  leerClase('Usuario');
  leerClase('Docente');
  leerClase('Dicta');
  leerClase('Avance');
  leerClase('Revision');
  
  /** HEADER */
  $smarty->assign('title','Seguimiento al Proyecto');
  $smarty->assign('description','Seguimiento del Avemce del Proyecto');
  $smarty->assign('keywords','Gestion,Observaciones,revision,avance');

  $CSS[]  = URL_CSS . "academic/tables.css";
  //$CSS[]  = URL_CSS . "editablegrid.css";
  $CSS[]  = URL_JS . "ventanasmodales/simplemodaldetalle.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "ventanasmodales/observacion.detalle.js";
  $JS[]  = URL_JS . "ventanasmodales/avance.detalle.modal.js";
  $JS[]  = URL_JS . "ventanasmodales/jquery.simplemodal-1.4.4.js";
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
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Asignaturas');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.materias.php','name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.proyecto-final.php?iddicta='.$iddicta,'name'=>$dicta->getNombreMateria());
  $menuList[]     = array('url'=>URL.Docente::URL.'estudiante/estudiante.lista.php?iddicta='.$iddicta,'name'=>'Estudiantes Inscritos');
  $menuList[]     = array('url'=>URL.Docente::URL.'revision/revision.lista.php?iddicta='.$iddicta.'&estudiente_id='.$id_estudiante,'name'=>'Seguimiento');
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
   $arrelem='';
while ($fila1 = mysql_fetch_array($sql, MYSQL_ASSOC)) {
    $objs=array();
    $objs1=array();
    $arrelem.=$fila1["id"].';';
   $objs[]=$fila1["id"];
   $objs[]=$fila1["estado_avance"];
   $objs[]=$fila1["fecha_avance"];
   $objs[]=$fila1["descripcion"];
   $resul1 = "SELECT av.id as idav, re.id as id, re.estado_revision as estado, re.fecha_revision as fecha_re, re.revisor_tipo as revisor, re.fecha_correccion as fecha_co, re.revisor as idrev
FROM proyecto pr, revision re, avance av
WHERE re.avance_id=av.id
AND av.proyecto_id=pr.id
AND av.id='".$fila1['id']."'
ORDER BY re.id DESC
";
   $sql1 = mysql_query($resul1);
   if(mysql_num_rows($sql1)>0){
       while ($fila11 = mysql_fetch_array($sql1, MYSQL_ASSOC)) {
   $objs1[]=$fila11; 
 }
   }else{
      $objs1='NO'; 
   }
    $objs[]=$objs1;
    $objs2[]=$objs;
 }

  $smarty->assign("objs", $objs2);
  $smarty->assign("iddicta", $iddicta);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("estudiante", $estudiante);
  $smarty->assign("proyecto", $proyecto); 
  $smarty->assign("avance", $avance);
  $smarty->assign("revision", $revision);
  $smarty->assign("array", $arrelem);

  //No hay ERROR
  $smarty->assign("ERROR",'');
  $smarty->assign("URL",URL);  

}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('docente/revision/full-width.revision.lista.tpl');
?>