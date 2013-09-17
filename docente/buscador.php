<?php
try {
  require('_start.php');
  if(!isDocenteSession())
  header("Location: login.php"); 
  global $PAISBOX;
 if(isset($_POST['iddia']))
   { 
   
 $docentes=getSessionDocente();
 $docentes->usuario_id;
 $diaids= $_POST['iddia'];
 
    
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
  //  $turnoid[]=$filaturno['id'];
  //  $turnonombre[]=$filaturno['nombre'];
    echo "<option value='".$filaturno['id']."' $TRUE>".htmlentities($filaturno['nombre'])."</option>";
 }
//$smarty->assign('turnoid'  , $turnoid);
//$smarty->assign('turnonombre'  , $turnonombre);
   
    
  };
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

?>