<?php

require('_start.php');
 
require_once('../../../sapti.inc/libs/tcpdf/config/lang/eng.php');
require_once('../../../sapti.inc/libs/tcpdf/tcpdf.php');

//cabecera del logo
class MYPDF extends TCPDF {

    //Page header
    public function Header() {
        // Logo
        $image_file = K_PATH_IMAGES.'cabesera.jpg';
        $this->Image($image_file,20,20, 150, '20', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
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

// create new PDF document
$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
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

 
$p=$_GET['id_p'];
$fechahoy=  date('Y-m-d');
 
 
$sql = "SELECT u.nombre AS NOMBRE,CONCAT(apellido_paterno,apellido_materno) as APELLIDOS,p.nombre as TITULO ,s.codigo as GESTION
FROM  usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe,vigencia v
WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id
=s.id AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id AND p.estado='AC' and p.tipo_proyecto='PE' AND p.id=v.proyecto_id AND ('".$fechahoy."'>=v.fecha_fin)and s.id='".$p."'";
$b=1;


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
    //configurar tamanio columnas para las tablas
    function tamcolumna($nom){
        $tam='50';
        switch ($nom){

     case "NOMBRE":
     $tam='100';
         break;

       case "APELLIDOS":
           $tam='100';
         break;
     case "GESTION":
           $tam='100';
         break;
      case "TITULO":
           $tam='300';
         break;

break;

}

        return $tam;
            
    }

// output the HTML content
$pdf->SetXY(10, 50);
$pdf->writeHTML(DesplegarTabla($sql,$b), true, false, true, false, '');

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// reset pointer to the last page
$pdf->lastPage();

// ---------------------------------------------------------

//Close and output PDF document
$pdf->Output('example_006.pdf', 'I');

//============================================================+
// END OF FILE                                                
//============================================================+
