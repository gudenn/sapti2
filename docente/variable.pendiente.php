<?php
try {
    define ("MODULO", "DOCENTE");
  require('_start.php');
  if(!isDocenteSession())
    header("Location: login.php"); 
  leerClase('Dicta');
  leerClase('Estudiante');
  $docente     = getSessionDocente();
  if ( isset($_POST['iddicta']) && is_numeric($_POST['iddicta']))
  {
     $iddicta                = $_POST['iddicta'];
  }
    if( isset($_POST['estudiante_id']) && is_numeric($_POST['estudiante_id']) ){
       $id_estudiante=$_POST['estudiante_id'];
  }
  $dicta = new Dicta($iddicta);
  $estudiante     = new Estudiante($id_estudiante);
  $proyecto       = $estudiante->getProyecto();

  function tipoconsulta($mat, $pro, $doc){
   switch ($mat) {
      case 'PR':
  $resul = "
SELECT av.id as id, pr.nombre as nombrep, av.descripcion as descripcion, av.fecha_avance as fecha, re.id as correcionrevision, av.estado_avance as estoavance
FROM proyecto pr, avance av, revision re
WHERE av.proyecto_id=pr.id
AND av.id=re.avance_id
AND re.estado_revision='RE'
AND av.proyecto_id='".$pro."'
AND re.revisor_tipo='DO'
AND re.revisor='".$doc."'
ORDER BY id DESC
          ";
        break;
      case 'PE':
  $resul = "
SELECT av.id as id, pr.nombre as nombrep, av.descripcion as descripcion, av.fecha_avance as fecha, re.id as correcionrevision, av.estado_avance as estoavance
FROM proyecto pr, avance av, revision re
WHERE av.proyecto_id=pr.id
AND av.id=re.avance_id
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

   $sql = mysql_query(tipoconsulta($dicta->getTipoMateria(), $proyecto->id,$docente->id));
   if(mysql_num_rows($sql)>0){
       echo mysql_num_rows($sql);
   }  else {
        echo '';       
   }
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>