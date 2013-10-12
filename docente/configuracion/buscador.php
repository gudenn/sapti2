<?php
try {
   define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
  header("Location:../ login.php"); 
if(isset($_POST['iddia']))
{ $iddocente=0;
  
    $docente     =  getSessionDocente();
 $iddocente=(int)$docente->id;
 
  $diaids       =   $_POST['iddia'];
 
    
 $sqlturno="SELECT DISTINCT(turno.id), turno.nombre
FROM dia, turno
WHERE NOT EXISTS (
SELECT *
FROM turno tu, horario_doc hd, dia d
WHERE hd.docente_id=4
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