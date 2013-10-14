<?php
try {
  require('../_start.php');
    if(!isAdminSession())
    header("Location: ../login.php");
 if(isset($_POST['idmateria']))
 $idmateria= $_POST['idmateria'];

 $sqlgrupo="SELECT DISTINCT(codigo_grupo.id), codigo_grupo.nombre
FROM materia, codigo_grupo
WHERE NOT EXISTS (
SELECT *
FROM materia ma, codigo_grupo cg, dicta di
WHERE di.codigo_grupo_id=cg.id
AND di.materia_id=ma.id
AND ma.id=$idmateria
AND codigo_grupo.nombre=cg.nombre
)";
 $resultadogrupo = mysql_query($sqlgrupo);
 while ($filagrupo = mysql_fetch_array($resultadogrupo)){
      echo "<option value='".$filagrupo['id']."' $TRUE>".htmlentities($filagrupo['nombre'])."</option>";
 }     

}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

?>