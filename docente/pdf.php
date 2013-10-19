<?php
mysql_connect("localhost","sapti","sapti");
mysql_select_db("sapti");
 
require_once('../../sapti.inc/libs/tcpdf/config/lang/eng.php');
require_once('../../sapti.inc/libs/tcpdf/tcpdf.php');
 
// extend TCPF with custom functions
class MYPDF extends TCPDF {
 
    // Colored table
    public function ColoredTable($header,$data) {
        // Colors, line width and bold font
        $this->SetFillColor(255, 0, 0);
        $this->SetTextColor(255);
        $this->SetDrawColor(128, 0, 0);
        $this->SetLineWidth(0.2);
        $this->SetFont('', 'B');
        // Header
        $w = array(10,40,110,25);
        $num_headers = count($header);
        for($i = 0; $i < $num_headers; ++$i) {
            $this->Cell($w[$i], 7, $header[$i], 1, 0, 'C', 1);
        }
        $this->Ln();
        // Color and font restoration
        $this->SetFillColor(224, 235, 255);
        $this->SetTextColor(0);
        $this->SetFont('');
        // Data
        $fill = TRUE;
        $marg = 3;
        foreach($data as $row) {
            $this->Cell($w[0], 6, $row[0], 'LR', 0, 'L', $fill, $marg);
            $this->Cell($w[1], 6, $row[1], 'LR', 0, 'L', $fill, $marg);
            $this->Cell($w[2], 6, $row[2], 'LR', 0, 'L', $fill, $marg);
	    $this->Cell($w[3], 6, $row[3], 'LR', 0, 'L', $fill, $marg);
			
            $this->Ln();
            $fill=!$fill;
        }
        $this->Cell(array_sum($w), 0, '', 'T');
    }
}
 
// create new PDF document
$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

 
// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Jordi Girones');
$pdf->SetTitle('TCPDF Tutorial - TCPDF + MySQL');
$pdf->SetSubject('TCPDF Tutorial - TCPDF + MySQL');
$pdf->SetKeywords('TCPDF, PDF, example, test, mysql');
 
// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE.' 011', PDF_HEADER_STRING);
 
// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
 
// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
 
//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
 
//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
 
//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
 
//set some language-dependent strings
$pdf->setLanguageArray($l);
 
// ---------------------------------------------------------
 
// set font
$pdf->SetFont('helvetica','',10);
 
// add a page
$pdf->AddPage();
 
//Column titles
$header = array('id', 'Nombre', 'Titulo','Apellidos',);
 
//Data loading

$sql = "SELECT p.id,CONCAT(u.nombre,' ',apellido_paterno,apellido_materno) as nombrec ,p.nombre,s.codigo
FROM usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe
WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id=s.id AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id AND p.estado='AC'";
$rs = mysql_query($sql);
if (mysql_num_rows($rs)>0){
    while($rw = mysql_fetch_array($rs)){
        $data[] = $rw;
    }
}
 
// print colored table
$pdf->ColoredTable($header, $data);
 
// ---------------------------------------------------------
 
//Close and output PDF document
$pdf->Output('example_011.pdf', 'I');
 
//============================================================+
// END OF FILE
//============================================================+
?>