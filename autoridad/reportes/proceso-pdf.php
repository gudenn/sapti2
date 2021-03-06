<?php

  require('_start.php');
 
    
require_once(DIR_LIB.'/tcpdf/config/lang/eng.php');
require_once(DIR_LIB.'/tcpdf/tcpdf.php');
   
   //cabecera pdf
  class MYPDF extends TCPDF {

   
    public function Header() {
        // Logo
        $image_file = K_PATH_IMAGES.'cabesera.jpg';
        $this->Image($image_file,20,6, 150, '20', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
        // Set font
        $this->SetFont('helvetica', 'B', 20);
       
    }

    // Page footer
    public function Footer() {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'C', 0, '', 0, false, 'T', 'M');
    }
}


$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);


$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Nicola Asuni');
$pdf->SetTitle('TCPDF Example 006');
$pdf->SetSubject('TCPDF Tutorial');
$pdf->SetKeywords('TCPDF, PDF, example, test, guide');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE.' 006', PDF_HEADER_STRING);

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
$pdf->SetFont('dejavusans', '', 10);

// add a page
$pdf->AddPage();



//consulta para las tablas con el id de Semestre
$p=$_GET['id_p'];
$sql = "SELECT u.nombre AS NOMBRE,CONCAT(apellido_paterno,' ',apellido_materno) as APELLIDOS ,s.codigo as SEMESTRE,p.nombre as TITULO,p.estado as ESTADO
   FROM usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe,dicta d
   WHERE u.id=e.usuario_id AND e.id=i.estudiante_id and d.semestre_id=s.id and i.dicta_id=d.id and p.tipo_proyecto='PR' and p.estado_proyecto='IN' AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id  AND p.estado='AC' and s.id='".$p."'";

$b=1;

//desplega la tabla en html para el pdf
function DesplegarTabla($a,$b)
     {
        $query =  mysql_query($a);
        $html= '<table border="0.5" cellspacing="0" cellpadding="8" ><thead><tr>';
        $html.=
                '<th style="background-color:#006; text-align:center; color:#FFF" width="40"><strong>No</strong></th>';
            for($i=0;$i<mysql_num_fields($query);$i++)
                {
                
                    $html.=
                
                            '<th style="background-color:#006; text-align:center; color:#FFF" width="'.tamcolumna(mysql_field_name($query,$i)).'" ><strong>'.mysql_field_name($query,$i).'</strong></th>';
                            $array[]= tamcolumna(mysql_field_name($query,$i));
                }
                $html.=
                        '</thead></tr>';
        while ($row=mysql_fetch_assoc($query)) {
            $html.=
                    '<tr>';
            $html.=
                    '<td width="40">'.$b.'</td>';
            for($i=0;$i<mysql_num_fields($query);$i++)
                {
                    $html.=
                            '<td width="'.$array[$i].'"  height="">'.$row[mysql_field_name($query,$i)].'</td>';
                }
           $html.=
                   '</tr>';
            $b++;
        }    
        $html.=
                '</table>';
        return $html;
        var_dump($html);
    }
    function tamcolumna($nom){
        $tam='50';
        switch ($nom){
        case "NOMBRE":
        $tam='100';
        break;
        case "APELLIDOS":
        $tam='100';
        break;
        case "SEMESTRE":
        $tam='70';
        break;
        case "TITULO":
        $tam='300';
        break;

break;

}

        return $tam;
            
    }
//$pdf->Image('../../images/cabesera.jpg', '', '',150,20, '', '', 'T', false, 300, '', false, false, 1, false, false, false);
// output the HTML content
$pdf->SetXY(10, 50);
$pdf->writeHTML(DesplegarTabla($sql,$b),10, true, false, true, false, 'J');
$pdf->SetXY(10, 50);
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// reset pointer to the last page
$pdf->lastPage();

// ---------------------------------------------------------

//Close and output PDF document
$pdf->Output('proceso.pdf', 'I');

//============================================================+
// END OF FILE                                                
//============================================================+
