<?php
require('_start.php');
  global $PAISBOX;
//Exportar datos de php a Excel
header("Content-Type: application/vnd.ms-excel");
header("Expires: 0");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("content-disposition: attachment;filename=postergado.xls");
?>
<HTML LANG="es">
<TITLE>::. Exportacion de Datos .::</TITLE>
</head>
<body>
<?php
$p=$_GET['id_p'];
 
$sql = "SELECT u.nombre,s.codigo as gestion,CONCAT(apellido_paterno,apellido_materno) as apellidos ,p.nombre as titulo,v.estado_vigencia as estadopro,p.id
FROM  usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe,vigencia v
WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id
=s.id AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id and p.tipo_proyecto='PE' AND p.estado='AC' AND p.id=v.proyecto_id AND v.estado_vigencia='PO' and s.id='".$p."'";
$result=mysql_query($sql);
 
?>
 
<TABLE BORDER=1 align="center" CELLPADDING=1 CELLSPACING=1>
<th width="50%" style="background-color:#006; text-align:center; color:#FFF"><strong>NOMBRE</strong></th>
<th width="50%" style="background-color:#006; text-align:center; color:#FFF"><strong>APELLIDOS</strong></th>
<th width="50%" style="background-color:#006; text-align:center; color:#FFF"><strong>TITULO</strong></th>
<th width="50%" style="background-color:#006; text-align:center; color:#FFF"><strong>GESTION</strong></th>
<th width="50%" style="background-color:#006; text-align:center; color:#FFF"><strong>ESTADO</strong></th>
<?php
while($row = mysql_fetch_array($result)) {
printf("<tr>
<td>&nbsp;%s</td>
<td>&nbsp;%s&nbsp;</td>
<td>&nbsp;%s</td>
<td>&nbsp;%s</td>
<td>&nbsp;%s</td>
</tr>", $row["nombre"],$row["apellidos"],$row["titulo"],$row["gestion"],$row["estadopro"]);
}

  //Cierras la Conexi�n
?>
</table>
</body>
</html>