<?php
try {
    define ("MODULO", "DOCENTE");
  require('../_start.php');
  leerClase('Usuario');
  leerClase('Proyecto');
  leerClase('Estudiante');
  leerClase('Avance');
  leerClase('Revision');
  leerClase('Observacion');
  leerClase('Docente');
  leerClase('Dicta');

  if ( isset($_POST['iddoc']) && is_numeric($_POST['iddoc']))
  {
     $iddoc= $_POST['iddoc'];
  }
  if ( isset($_POST['iddicta']) && is_numeric($_POST['iddicta']))
  {
     $iddicta= $_POST['iddicta'];
  }
    if( isset($_POST['idest']) && is_numeric($_POST['idest']) ){
       $estuid=$_POST['idest'];
  } 
    if( isset($_POST['idava']) && is_numeric($_POST['idava']) ){
       $id=$_POST['idava'];
  }
    if( isset($_POST['idrev']) && is_numeric($_POST['idrev']) ){
       $idrev=$_POST['idrev'];
  }
  function getRevisortipo($tipo){
      if($tipo==Revision::T1_PROYECTOFINAL){
          $tipo1=Revision::T1_DOCENTE;
      }elseif ($tipo==Revision::T2_PERFIL) {
            $tipo1=Revision::T2_DOCENTEPERFIL;
        }
        return $tipo1;
  }

    if (isset($_POST['registro']) && $_POST['registro'] == 'registro')
    {
  $dicta = new Dicta($iddicta);
  date_default_timezone_set('America/La_Paz');
  $docente=new Docente($iddoc);
  $estudiante     = new Estudiante($estuid);
  $proyecto       = $estudiante->getProyecto();
  $avance         = new Avance($id);
  $avance->asignarDirectorio();
    if (isset($_POST['obser'])) 
    $observaciones=$_POST['obser'];
    $revision->fecha_revision=date("d/m/Y");
    $avance->cambiarEstadoVisto();
    $observacion = new Observacion();
    $revision = new Revision();
    $revision->crearRevisionDocente($docente->id, $proyecto->id, $dicta->getTipoMateria());
    $revision->avance_id=$avance->id;
    $revision->save();
    
    $observacion->crearObservacion($observaciones, $revision->id);
    $avance->cambiarEstadoCorregido();
    $revision->notificacionRevision($estudiante->id, $proyecto->id, $docente->getNombreCompleto());
    echo 'ok';
    }
    
        if (isset($_POST['registro']) && $_POST['registro'] == 'aprobar')
    {
  $dicta = new Dicta($iddicta);
  date_default_timezone_set('America/La_Paz');
  $docente=new Docente($iddoc);
  $estudiante     = new Estudiante($estuid);
  $proyecto       = $estudiante->getProyecto();
  $avance         = new Avance($id);
 
  $resul = "
       SELECT *
FROM observacion ov
WHERE ov.revision_id='".$idrev."'
";
   $sql = mysql_query($resul);
while ($fila1 = mysql_fetch_array($sql, MYSQL_ASSOC)) {
   $obser[]=$fila1;
 }
$revision1=new Revision($idrev);
           if(count($obser)>0){
           foreach ($obser as $obs){
           $obsapro = new Observacion($obs);
           $obsapro->cambiarEstadoAprobado();
            }
           $revision1->fechaAprobacion();
           $revision1->estadoAprobado();
           $avance->cambiarEstadoCorregido();

           }
           $revision1->notificacionRevision($estudiante->id, $proyecto->id, $docente->getNombreCompleto());
           echo 'ok';
     }
        if (isset($_POST['registro']) && $_POST['registro'] == 'noaprobar')
    {
  $dicta = new Dicta($iddicta);
  date_default_timezone_set('America/La_Paz');
  $docente=new Docente($iddoc);
  $estudiante     = new Estudiante($estuid);
  $proyecto       = $estudiante->getProyecto();
  $avance         = new Avance($id);
 
  $resul = "
       SELECT *
FROM observacion ov
WHERE ov.revision_id='".$idrev."'
";
   $sql = mysql_query($resul);
while ($fila1 = mysql_fetch_array($sql, MYSQL_ASSOC)) {
   $obser[]=$fila1;
 }
$revision1=new Revision($idrev);
           if(count($obser)>0){
           $revisionnuevo = new Revision();
           $revisionnuevo->crearRevisionDocente($docente->id, $proyecto->id, $dicta->getTipoMateria());
           $revisionnuevo->avance_id=$avance->id;
           $revisionnuevo->save();
           foreach ($obser as $obs){
               $obsermodes=new Observacion($obs);
               $obsermo = new Observacion();
               $obsermo->crearObservacion($obsermodes->observacion, $revisionnuevo->id);
               $obsermodes->save();
               $obsermo->save();
               $obsermodes->cambiarEstadoRechazado();
            }
           $revision1->fechaAprobacion();
           $revision1->estadoAprobado();
           $avance->cambiarEstadoCorregido();
           }
           $revision1->notificacionRevision($estudiante->id, $proyecto->id, $docente->getNombreCompleto());
           echo 'ok';
     }
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>