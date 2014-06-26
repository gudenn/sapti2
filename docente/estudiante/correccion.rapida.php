<?php
try {
  define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php"); 

  leerClase('Docente');
  leerClase('Dicta');
  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Lista de Estudiantes');
  $smarty->assign('description','Lista de Incritos a la Materia');
  $smarty->assign('keywords','Gestion,Estudiantes');

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_CSS . "editablegrid.css";
  $CSS[]  = URL_CSS . "dashboardtabla.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $smarty->assign('JS',$JS);
  $docente     = getSessionDocente();
  if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) && $docente->getDictaverifica($_GET['iddicta']))
  {
     $iddicta                = $_GET['iddicta'];
  }  else {
       header("Location: ../index.php");
  }
  $dicta=new Dicta($iddicta);
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
   /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Asignaturas');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.materias.php','name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.proyecto-final.php?iddicta='.$iddicta,'name'=>$dicta->getNombreMateria());
  $menuList[]     = array('url'=>URL.Docente::URL.'estudiante/correccion.rapida.php?iddicta='.$iddicta,'name'=>'Correccion Rapida');
  $smarty->assign("menuList", $menuList);
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
    $estu_ava[]=$fila['id'];
    $estu_ava[]=$fila['codigosis'];
    $estu_ava[]=$fila['estudiante'];
    $estu_ava[]=$fila['nombrep'];
    $estu_ava[]=$avan_new;
    $estudianteLista[]=$estu_ava;
}
if(count($correcciones)>0){
    $estu_avaco[]=$fila['id'];
    $estu_avaco[]=$fila['codigosis'];
    $estu_avaco[]=$fila['estudiante'];
    $estu_avaco[]=$fila['nombrep'];
    $estu_avaco[]=$correcciones;
    $estudianteListaCorr[]=$estu_avaco;
}
 }

  $smarty->assign("iddicta", $iddicta);
  $smarty->assign("iddoc", $docente->id);
  $smarty->assign("objs", $estudianteLista);
  $smarty->assign("objs1", $estudianteListaCorr);

  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('docente/estudiante/correccion.rapida.tpl');
?>