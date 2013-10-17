<?php
require('_start.php');
  global $PAISBOX;
//Exportar datos de php a Excel
header("Content-Type: application/vnd.ms-excel");
header("Expires: 0");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("content-disposition: attachment;filename=cambios.xls");
?>

<TITLE>::. Exportacion de Datos .::</TITLE>
</head>
<body>
<?php

 $p=$_GET['id_p'];
$sql ="SELECT p.id, u.nombre,s.codigo as gestion,CONCAT(apellido_paterno,apellido_materno) as apellidos, COUNT( * ) AS cantidadcambios, c.tipo,p.nombre as titulo,p.estado as estadop
FROM usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe, cambio c
WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id
=s.id AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id AND p.estado='AC' and p.tipo_proyecto='PR' AND c.proyecto_id=p.id and s.id='".$p."'
GROUP BY p.id, c.tipo";
$result=mysql_query($sql);
 
?>
<center> <td bgcolor="#F7F7F7" style="text-align:center"><strong>LISTA DE PERFILES CON CAMBIOS</strong></td></center>
<TABLE BORDER=1 align="center" CEL>
<th width="50%" style="background-color:#006; text-align:center; color:#FFF"><strong>NOMBRE</strong></th>
<th width="50%" style="background-color:#006; text-align:center; color:#FFF"><strong>APELLIDOS</strong></th>
<th width="50%" style="background-color:#006; text-align:center; color:#FFF"><strong>TITULO</strong></th>
<th width="50%" style="background-color:#006; text-align:center; color:#FFF"><strong>GESTION</strong></th>
<th width="50%" style="background-color:#006; text-align:center; color:#FFF"><strong>CANTIDAD DE CAMBIOS</strong></th>
<th width="50%" style="background-color:#006; text-align:center; color:#FFF"><strong>TIPO</strong></th>
<?php
while($row = mysql_fetch_array($result)) {
printf("<tr>
<td>&nbsp;%s</td>
<td>&nbsp;%s&nbsp;</td>
<td>&nbsp;%s</td>
<td>&nbsp;%s</td>
<td>&nbsp;%s</td>
<td>&nbsp;%s</td>
</tr>",$row["nombre"],$row["apellidos"],utf8_decode($row["titulo"]),$row["gestion"],$row["cantidadcambios"],$row["tipo"]);
}

?>
</table>
</body>
