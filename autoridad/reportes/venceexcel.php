<?php
require('_start.php');
  global $PAISBOX;
//Exportar datos de php a Excel
header("Content-Type: application/vnd.ms-excel");
header("Expires: 0");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("content-disposition: attachment;filename=perfilesVencidos.xls");
?>
<HTML LANG="es">
<TITLE>::. Exportacion de Datos .::</TITLE>
</head>
<body>
<?php
 $p=$_GET['id_p'];
 
 $fechahoy=  date('Y-m-d');;

$sql = "SELECT p.id,u.nombre,s.codigo,CONCAT(apellido_paterno,apellido_materno) as apellidos ,p.nombre as titulo
FROM  usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe,vigencia v
WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id
=s.id AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id AND p.estado='AC' AND p.id=v.proyecto_id AND ('".$fechahoy."'>=v.fecha_fin)and s.id='".$p."'";
$result=mysql_query($sql);
 
?>
  <center> <td bgcolor="#F7F7F7" style="text-align:center"><strong>LISTA DE PERFILES QUE VENCEN</strong></td></center>
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
</tr>", $row["nombre"],$row["apellidos"],$row["titulo"],$row["codigo"]);
}

?>
</table>
</body>
</html>