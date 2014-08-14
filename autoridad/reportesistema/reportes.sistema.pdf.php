<?php

 require('../_start.php');

require_once(DIR_LIB.'/tcpdf/config/lang/eng.php');
require_once(DIR_LIB.'/tcpdf/tcpdf.php');

 //cabecera pdf
class MYPDF extends TCPDF {

    //Page header
    public function Header() {
        // Logo
        $image_file = K_PATH_IMAGES.'cabesera.jpg';
        $this->Image($image_file,20,6, 170, 20, 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
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
$pdf->SetAuthor('Sapti');
$pdf->SetTitle('Sapti Reporte');
$pdf->SetSubject('Sistema Sapti');
$pdf->SetKeywords('reporte, PDF, docente, lista, alumnos');

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

if(isset($_GET['sql']))
$sql = $_GET['sql'];

$b=1;
  function array_recibe($url_array) { 
     $tmp = stripslashes($url_array); 
     $tmp = urldecode($tmp); 
     $tmp = unserialize($tmp); 

    return $tmp; 
  };
  
 $s='select ';
 $sql= array_recibe($sql); 
 $sql1=$s.$sql;
 
 $b=1;

function DesplegarTabla($a,$b)
     {
        $query =  mysql_query($a);
        $html= '<table border="0.5" cellspacing="0" cellpadding="5" ><thead><tr>';
        $html.=
                '<th style="background-color:#006; text-align:center; color:#FFF" width="30"><strong>No</strong></th>';
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
                    '<td width="30">'.$b.'</td>';
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
        
        switch ($nom){
     case "NOMBRE":
             $tam='15%';
             break;
     case "APELLIDO":
             $tam='15%';
             break;
     case "PROYECTO":
             $tam='30%';
             break;      
     case "MATERIA":
             $tam='15%';
             break;
     case "INSCRITOS":
             $tam='20%';
             break;
     case "ESTADO":
             $tam='15%';
             break;
         default :
             $tam='15%';
        }
        return $tam;         
    }

// output the HTML content
//$pdf->SetXY(20, 50);
$pdf->writeHTML(DesplegarTabla($sql1,$b), true, false, true, false, '');

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// reset pointer to the last page
$pdf->lastPage();

// ---------------------------------------------------------

//Close and output PDF document
$pdf->Output('Reportesistema.pdf', 'I');

//============================================================+
// END OF FILE                                                
//============================================================+
