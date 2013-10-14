<?php
require_once('../../_inc/clases/class.ezpdf.php');
require('_start.php');
$pdf =& new Cezpdf('LETTER');
$pdf->selectFont('../fonts/courier.afm');
$pdf->ezSetCmMargins(1,1,1.5,1.5);
//$conexion = mysql_connect("localhost", "root","");
//mysql_select_db("sapti", $conexion);
 $p=$_GET['id_p'];
$queEmp = "SELECT u.nombre,s.codigo as gestion,CONCAT(apellido_paterno,apellido_materno) as apellidos ,p.nombre as titulo,v.estado_vigencia as estadopro,p.id
FROM  usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe,vigencia v
WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id
=s.id AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id and and p.tipo_proyecto='PR' AND p.estado='AC' AND p.id=v.proyecto_id AND v.estado_vigencia='PR' and s.id='".$p."'";
$resEmp = mysql_query($queEmp) or die(mysql_error());
$totEmp = mysql_num_rows($resEmp);

$ixx = 0;
while($datatmp = mysql_fetch_assoc($resEmp)){
	$ixx = $ixx+1;
	$data[] = array_merge($datatmp, array('num'=>$ixx));
}
$titles = array(
				'id'=>'<b>NUMERO</b>',
				'nombre'=>'<b>NOMBRES</b>',
				'apellidos'=>'<b>APELLIDOS</b>',
				'titulo'=>'<b>TITULO</b>',
				'gestion'=>'<b>GESTION</b>',
                                'estadopro'=>'<b>ESTADO</b>',
                               
				
			);
$options = array(
				'shadeCol'=>array(0.9,0.9,0.9),
				'xOrientation'=>'center',
				'width'=>500
			);
//$txttit = "<b>Instituto Tecnol�gico de Los Mochis</b>\n";
//$txttit.= "Reporte general de prestamos de edificios\n";

$pdf->ezimage("../../images/umms4.JPG",0,500,'none','left');
$pdf->ezText($txttit, 12);
$pdf->ezTable($data, $titles, '', $options);
$pdf->ezText("\n\n\n", 10);
$pdf->ezText("<b>Fecha:</b> ".date("d/m/Y"), 10);
$pdf->ezText("<b>Hora:</b> ".date("H:i:s")."\n\n", 10);
ob_end_clean();
$pdf->ezStream();
//$pdf->ezText("<b>Hora:</b> ".date("H:i:s"),10);
//$pdf->ezText('<b>Fuente:</b> <c:alink:http://blog.unijimpe.net/>blog.unijimpe.net</c:alink>');
$pdf->ezStream();

?>