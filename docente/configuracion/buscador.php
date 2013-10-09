<?php
try {
  require('../_start.php');
  if(!isDocenteSession())
  header("Location: login.php"); 
  global $PAISBOX;
 if(isset($_POST['iddia']))
{ 
   $docente     =  getSessionDocente();
  $docente_ids =  $docente->id;

 $sqldocente="select  d.id
from usuario u , docente d
where u.id= d.usuario_id and u.estado='AC' and d.estado='AC' and u.id=$docente_ids;";
 $resultadodocente= mysql_query($sqldocente);
$idocente=0;
 while ($filadocente = mysql_fetch_array($resultadodocente)) 
 {
   $idocente=$filadocente['id'];
    
 }

 echo $_POST['iddoc'];
 $diaids= $_POST['iddia'];
 
    
 $sqlturno="SELECT DISTINCT(turno.id), turno.nombre
FROM dia, turno
WHERE NOT EXISTS (
SELECT *
FROM turno tu, horario_doc hd, dia d
WHERE hd.docente_id=$idocente
AND tu.id=hd.turno_id
AND d.id=hd.dia_id
AND d.id=$diaids
AND turno.nombre=tu.nombre
);";
 $resultadoturno = mysql_query($sqlturno);
 $turnoid= array();
  $turnonombre= array();
 
 while ($filaturno = mysql_fetch_array($resultadoturno)) 
                {
      echo "<option value='".$filaturno['id']."' $TRUE>".htmlentities($filaturno['nombre'])."</option>";
 }
  };
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

?>