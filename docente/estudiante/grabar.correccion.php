<?php
try {
    define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php");

  // Escritorio del estuddinate
  leerClase('Usuario');
  leerClase('Proyecto');
  leerClase('Estudiante');
  leerClase('Avance');
  leerClase('Revision');
  leerClase('Observacion');
  leerClase('Docente');
  leerClase('Dicta');

  $docente     = getSessionDocente();
  if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) && $docente->getDictaverifica($_GET['iddicta']))
  {
     $iddicta                = $_GET['iddicta'];
  }  else {
        header("Location: ../index.php");
  }
    if( isset($_GET['estudiente_id']) && is_numeric($_GET['estudiente_id']) ){
       $estuid=$_GET['estudiente_id'];
  }  else {
      header("Location: ../index.php");
  }
    if( isset($_GET['avance_id']) && is_numeric($_GET['avance_id']) ){
       $id=$_GET['avance_id'];
  }  else {
      header("Location: ../index.php");
  }
  $dicta = new Dicta($iddicta);
    
  $estudiante     = new Estudiante($estuid);
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();
  $rev1=new Revision();
  $avance         = new Avance($id);
  $avance->asignarDirectorio();
  $avance->cambiarEstadoVisto();
  function getRevisortipo($tipo,$rev){
      if($tipo==Revision::T1_PROYECTOFINAL){
          $tipo1=Revision::T1_DOCENTE;
      }elseif ($tipo==Revision::T2_PERFIL) {
            $tipo1=Revision::T2_DOCENTEPERFIL;
        }
        return $tipo1;
  }
    $resulrev = "SELECT re.id
FROM avance av, revision re
WHERE re.avance_id=av.id
AND av.id='".$avance->id."'
AND re.revisor_tipo='".getRevisortipo($dicta->getTipoMateria(), $rev1)."'
AND re.revisor='".$docente->id."'
AND re.estado_revision='".  Revision::E3_RESPONDIDO . "'
";
   $sqlrev = mysql_query($resulrev);
while ($fila1rev = mysql_fetch_array($sqlrev, MYSQL_ASSOC)) {
   $obserrev=$fila1rev['id'];
 }
 
  $resul = "
       SELECT *
FROM observacion ov
WHERE ov.revision_id='".$obserrev."'
";
   $sql = mysql_query($resul);
while ($fila1 = mysql_fetch_array($sql, MYSQL_ASSOC)) {
   $obser[]=$fila1;
 }
    $obsertabla='no';
  if(mysql_num_rows($sql)>0){
      $obsertabla='si';
      $revision1=new Revision($obserrev);
  }
    $observacion1=new Observacion();

    if (isset($_POST['observaciones'])) 
    $observaciones=$_POST['observaciones'];
    $revision->fecha_revision=date("d/m/Y");
    $avance->cambiarEstadoVisto();

    if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
    $observacion = new Observacion();
    $revision = new Revision();
    $revision->crearRevisionDocente($docente->id, $proyecto->id, $dicta->getTipoMateria());
    $revision->objBuidFromPost();
    $revision->avance_id=$avance->id;
    $revision->save();
    
    foreach ($observaciones as $obser_array){
    $observacion->objBuidFromPost();
    $observacion->crearObservacion($obser_array, $revision->id);
    }
    $avance->cambiarEstadoCorregido();
    $revision->notificacionRevision($estudiante->id, $proyecto->id, $docente->getNombreCompleto());
    $ir = "Location: ../estudiante/estudiante.lista.php?iddicta=".$iddicta;
        header($ir);
    }
    
        if (isset($_POST['tarea']) && $_POST['tarea'] == 'aprobar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
    {
           if (isset($_POST['seleccion'])) 
           $seleccion=$_POST['seleccion'];
           if(count($seleccion)>0){
           foreach ($seleccion as $obs){
           $obsapro = new Observacion($obs);
           $obsapro->cambiarEstadoAprobado();
            }
           $revision1->fechaAprobacion();
           $desaprobados=$revision1->listaDesaprobados();
           if(count($desaprobados)>0){
           $revisionnuevo = new Revision();
           $revisionnuevo->crearRevisionDocente($docente->id, $proyecto->id, $dicta->getTipoMateria());
           $revisionnuevo->avance_id=$avance->id;
           $revisionnuevo->save();
           foreach ($desaprobados as $des) {
               $obsermodes=new Observacion($des);
               $obsermodes->objBuidFromPost();
               $obsermo = new Observacion();
               $obsermo->objBuidFromPost();
               $obsermo->crearObservacion($obsermodes->observacion, $revisionnuevo->id);
               $obsermodes->save();
               $obsermo->save();
               $obsermodes->cambiarEstadoRechazado();
           }
           $revision1->estadoAprobado();
           $avance->cambiarEstadoCorregido();
           $revision1->notificacionRevision($estudiante->id, $proyecto->id, $docente->getNombreCompleto());
           $ir = "Location: ../revision/observacion.editar.revision.php?iddicta=".$iddicta."&revisiones_id=".$revisionnuevo->id."";
           header($ir);
           }else {
                   $revision1->estadoAprobado();
                   $avance->cambiarEstadoCorregido();
                   $ir = "Location: ../estudiante/estudiante.lista.php?iddicta=".$iddicta;
                   header($ir);
                }
           }  else {
           $revision1->fechaAprobacion();
           $desaprobados=$revision1->listaObservaciones();
           if(count($desaprobados)>0){
           $revisionnuevo = new Revision();
           $revisionnuevo->crearRevisionDocente($docente->id, $proyecto->id, $dicta->getTipoMateria());
           $revisionnuevo->avance_id=$avance->id;
           $revisionnuevo->save();
           foreach ($desaprobados as $des) {
               $obsermodes=new Observacion($des);
               $obsermodes->objBuidFromPost();
               $obsermo = new Observacion();
               $obsermo->objBuidFromPost();
               $obsermo->crearObservacion($obsermodes->observacion, $revisionnuevo->id);
               $obsermodes->save();
               $obsermo->save();
               $obsermodes->cambiarEstadoRechazado();
           }}
           $revision1->estadoAprobado();
           $revision1->notificacionRevision($estudiante->id, $proyecto->id, $docente->getNombreCompleto());
           $avance->cambiarEstadoCorregido();   
           $ir = "Location: ../revision/observacion.editar.revision.php?iddicta=".$iddicta."&revisiones_id=".$revisionnuevo->id;
           header($ir);
           }
     }
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>