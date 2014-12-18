<?php
require('../_start.php');
 define("MODULO", "DOCENTE");

 if (isset($_POST["idnumero"])  && is_numeric($_POST["idnumero"]) )
 {
$idarea=$_POST["idnumero"];
$docente = getSessionDocente();
$B_BUSCAR= mysql_query ("SELECT s.*
FROM sub_area s
WHERE  s.area_id='".$idarea."' and s.id NOT IN (
 SELECT  a.sub_area_id
 FROM apoyo a
 WHERE a.area_id='".$idarea."' and a.docente_id='".$docente->id."'
)");
$R_BUSCAR=mysql_fetch_assoc($B_BUSCAR);
$C_BUSCAR=mysql_num_rows($B_BUSCAR);
echo "<option value='' selected>--- Seleccione $docente->id----</option>";
if($C_BUSCAR){
do{
    if($idarea==$R_BUSCAR['area_id'])
    {
      
echo "<option value='".$R_BUSCAR['id']."' selected>".htmlentities($R_BUSCAR['nombre'])."</option>";

    }else{
   
echo "<option value='".$R_BUSCAR['id']."'>".htmlentities($R_BUSCAR['nombre'])."</option>";
     
    }

 }while($R_BUSCAR=mysql_fetch_assoc($B_BUSCAR));
}else{
echo "<option value=''>".htmlentities("Seleccione Sub &aacute;rea")."</option>";
}
 }
?>
