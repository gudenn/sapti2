<?php
require('_start.php');
  global $PAISBOX;

header("Content-Type: application/vnd.ms-excel");
header("Expires: 0");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("content-disposition: attachment;filename=modalidad.xls");
?>
<HTML LANG="es">
<TITLE>::. Exportacion de Datos .::</TITLE>
</head>
<body>
<?php
$p=$_GET['id_p'];
$m=$_GET['id_m'];
$sql = "SELECT p.id,u.nombre,s.codigo as gestion,p.nombre as titulo,CONCAT(apellido_paterno,apellido_materno) as apellidos,p.estado as estadop,m.nombre as modalidad
FROM usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe,modalidad m
WHERE u.id=e.usuario_id AND e.id=i.estudiante_id and p.tipo_proyecto='PE' AND i.semestre_id=s.id AND e.id=pe.estudiante_id and p.tipo_proyecto='PE' AND pe.proyecto_id=p.id AND p.modalidad_id=m.id and m.id='".$m."' and s.id='".$p."'";
$result=mysql_query($sql);
 
?>
 
<TABLE BORDER=1 align="center" CELLPADDING=1 CELLSPACING=1>
<th width="50%" style="background-color:#006; text-align:center; color:#FFF"><strong>NOMBRE</strong></th>
<th width="50%" style="background-color:#006; text-align:center; color:#FFF"><strong>APELLIDOS</strong></th>
<th width="50%" style="background-color:#006; text-align:center; color:#FFF"><strong>TITULO</strong></th>
<th width="50%" style="background-color:#006; text-align:center; color:#FFF"><strong>GESTION</strong></th>
<?php
while($row = mysql_fetch_array($result)) {
printf("<tr>
<td>&nbsp;%s</td>
<td>&nbsp;%s&nbsp;</td>
<td>&nbsp;%s</td>
<td>&nbsp;%s</td>
</tr>", $row["nombre"],$row["apellidos"],utf8_decode($row["titulo"]),$row["gestion"]);
}

?>
</table>
</body>
</html>