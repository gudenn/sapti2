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
SELECT *
FROM avance av, revision re
WHERE re.avance_id=av.id
AND av.proyecto_id='".$pro."'
AND re.revisor='".$doc."'
AND re.revisor_tipo='DO'
          ";
        break;
      case 'PE':
  $resul = "
SELECT *
FROM avance av, revision re
WHERE re.avance_id=av.id
AND av.proyecto_id='".$pro."'
AND re.revisor='".$doc."'
AND re.revisor_tipo='DP'
          ";
        break;
      default:
        break;
    } 
    return $resul;
}

   $sql = mysql_query(tipoconsulta($dicta->getTipoMateria(), $proyecto->id,$docente->id));
   
     $resulavance = "
SELECT *
FROM avance av
WHERE av.proyecto_id='".$proyecto->id."'
          ";
   $sqlavance = mysql_query($resulavance);
   if(mysql_num_rows($sqlavance)>0 && mysql_num_rows($sql)>0){
       echo mysql_num_rows($sqlavance)-mysql_num_rows($sql);
   }  else {
        echo '0';       
   }
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
?>