<?php
  define ("MODULO", "DOCENTE");
require_once('../_inc/clases/class.ezpdf.php');
 require('_start.php');

$pdf =& new Cezpdf('LETTER');
$pdf->selectFont('../fonts/courier.afm');
$pdf->ezSetCmMargins(1,1,1.5,1.5);

$queEmp = $_GET['sql'];
$resEmp = mysql_query($queEmp) or die(mysql_error());

$ixx = 0;
while($datatmp = mysql_fetch_assoc($resEmp)){
	$ixx = $ixx+1;
	$data[] = array_merge($datatmp, array('num'=>$ixx));
}
$titles['num']="<b>Numero<b>";
for($i=0;$i<mysql_num_fields($resEmp);$i++)
    {
    $titulo=mysql_field_name($resEmp,$i);
    $titulo1=  strtoupper(mysql_field_name($resEmp,$i));
    $titles["$titulo"]="<b>$titulo1<b>";
    };
$options = array(
				'shadeCol'=>array(0.9,0.9,0.9),
				'xOrientation'=>'center',
				'width'=>500
			);

$pdf->ezimage("../images/cabesera.jpg",0,500,'none','left');
$pdf->ezText($txttit, 12);
$pdf->ezTable($data, $titles, '', $options);
$pdf->ezText("\n\n\n", 10);
$pdf->ezText("<b>Fecha:</b> ".date("d/m/Y"), 10);
$pdf->ezText("<b>Hora:</b> ".date("H:i:s")."\n\n", 10);
ob_end_clean();
$pdf->ezStream();

?>