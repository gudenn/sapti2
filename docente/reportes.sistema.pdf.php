<?php
define ("MODULO", "DOCENTE");
require('_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php");
 leerClase('Dicta');
 leerClase('Usuario');
require_once(DIR_LIB.'/tcpdf/config/lang/eng.php');
require_once(DIR_LIB.'/tcpdf/tcpdf.php');

if(isset($_GET['sql']))
$sql = $_GET['sql'];
$iddicta  = $_GET['iddicta'];
date_default_timezone_set('America/La_Paz');
$b=1;
  function array_recibe($url_array) { 
     $tmp = stripslashes($url_array); 
     $tmp = urldecode($tmp); 
     $tmp = unserialize($tmp); 

    return $tmp; 
  };
 $sql=  array_recibe($sql); 
function DesplegarTabla($a,$b)
     {
        $query =  mysql_query($a);
        if(mysql_num_rows($query)>0){
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
        }
    }
    //configurar tamanio columnas para las tablas
    function tamcolumna($nom){
        
        switch ($nom){
     case "Estudiante":
             $tam='25%';
             break;
     case "Codigo_Sis":
             $tam='15%';
             break;
     case "Nombre_Proyecto":
             $tam='30%';
             break;
     case "Pro":
             $tam='6%';
             break;
     case "Apro":
             $tam='7%';
             break;
         default :
             $tam='5%';
        }
        return $tam;         
    }
  function titulo($iddi) {
     $dicta=new Dicta($iddi);
     $usuario=  getSessionUser();
     $tmp ="Reporte Sistema SAPTI  Usuario: ".$usuario->getNombreCompleto()."  Materia: ".$dicta->getNombreMateria()."<br>  Fecha:".date("d/m/Y")." Hora:".date("H:i:s"); 
      return $tmp; 
  };

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
$pdf->SetFont('dejavusans', '', 9);

// add a page
$pdf->AddPage();

// output the HTML content
//$pdf->SetXY(10, 50);
$pdf->writeHTML(titulo($iddicta), true, false, true, false, '');
$pdf->writeHTML(DesplegarTabla($sql,$b), true, false, true, false, '');

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// reset pointer to the last page
$pdf->lastPage();

// ---------------------------------------------------------

//Close and output PDF document
$pdf->Output('reporte_sistema.pdf', 'I');

//============================================================+
// END OF FILE                                                
//============================================================+
