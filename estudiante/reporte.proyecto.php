<?php

  require('_start.php');

  leerClase('Tutor');
  leerClase('Docente');
  leerClase('Materia');

  require_once(DIR_LIB.'/tcpdf/config/lang/eng.php');
  require_once(DIR_LIB.'/tcpdf/tcpdf.php');

  if (!isset($_GET['estudiante_id']) || !($_GET['estudiante_id']) || !is_numeric($_GET['estudiante_id'])){$_GET['estudiante_id']  = 1;}
  if (isEstudianteSession()){
    $estudiante = getSessionEstudiante();
    $estudiante->getAllObjects();
    $proyecto   = $estudiante->getProyecto();
  }
  else{
    $estudiante = new Estudiante($_GET['estudiante_id']);
    $estudiante->getAllObjects();
    $proyecto   = $estudiante->getProyecto();
  }
  $proyecto->getAllObjects();
  $html = '';
 //cabecera pdf
class MYPDF extends TCPDF {

    //Page header
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

  // create new PDF document
  $pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

  // set document information
  $pdf->SetCreator(PDF_CREATOR);
  $pdf->SetAuthor('Sistema SAPTI');
  $pdf->SetTitle($proyecto->nombre);
  $pdf->SetSubject($proyecto->nombre);
  $pdf->SetKeywords('SAPTI, PDF, UMSS, Sistemas');

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

  // create some HTML content
  $html .= <<<CERT
      <h1>Informe de avance</h1>
      <p><strong>Universitario:</strong> {$estudiante->getNombreCompleto()}</p>
      <p><strong>Proyecto:</strong> $proyecto->nombre</p>
      <p><strong>Objetivos espec&iacute;ficos:</strong></p>
      <ul>
CERT;
  $especifico = new Objetivo_especifico();
  foreach ($proyecto->objetivo_especifico_objs as $especifico) {
    $html .= <<<CERT
        <li>$especifico->descripcion</li>
CERT;
  }
  $html .= <<<CERT
      </ul>
      <p><strong>Descripci&oacute;n:</strong> $proyecto->descripcion</p>
      <h4>Detalle de Avances:</h4>
      
      <table style="width:100%;">
CERT;


  $avance = new Avance();
  foreach ($proyecto->avance_objs as $avance) {
    $avance->descripcion = strip_tags(html_entity_decode($avance->descripcion));
    $avance->getAllObjects();
    $html .= <<<CERT
        <tr>
          <td style="width:15%"><b>Fecha</b></td>
          <td style="width:75%"><b>Descripci&oacute;n</b></td>
          <td style="width:10%"><b>Avance</b></td>
        </tr>
        <tr>
          <td><b>$avance->fecha_avance</b></td>
          <td>$avance->descripcion</td>
          <td><b>$avance->porcentaje %</b></td>
        </tr>
CERT;
    if (count($avance->avance_objetivo_especifico_objs)){
      $html .= <<<CERT
          <tr>
            <td colspan="3"><b>Avance en Objetivos Espec&iacute;ficos:</b></td>
          </tr>
CERT;
      $avance_especifico = new Avance_objetivo_especifico();
      foreach ($avance->avance_objetivo_especifico_objs as $avance_especifico) {
        $html .= <<<CERT
          <tr>
            <td colspan="2"><ul><li>{$avance_especifico->getDescripcion()}</li></ul></td>
            <td><b>$avance_especifico->porcentaje_avance %</b></td>
          </tr>
CERT;
      }
    }

        $html .= <<<CERT
          <tr>
            <td colspan="3"><br></td>
          </tr>
CERT;
  }

  $html .= <<<CERT
    </table>
CERT;

    $tutores = array();
    foreach ($proyecto->proyecto_tutor_objs as $proyecto_tutor){$tutores[] = new Tutor($proyecto_tutor->tutor_id);}

  $html .= <<<CERT
    &nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>
    <table style="width:100%;">
      <tr>
CERT;
  foreach ($tutores as $tutor) {
    $html .= <<<CERT
        <td style="text-align:center;">.........................</td>
CERT;
  }
  $html .= <<<CERT
      </tr>
      <tr>
CERT;

  foreach ($tutores as $tutor) {
    $html .= <<<CERT
        <td style="text-align:center;">Tutor</td>
CERT;
  }

  $html .= <<<CERT
      </tr>
      <tr>
CERT;

  foreach ($tutores as $tutor) {
    $html .= <<<CERT
        <td style="text-align:center;">{$tutor->getNombreCompleto()}</td>
CERT;
  }

  $html .= <<<CERT
      </tr>
    </table>
CERT;

  //docente
  $dicta          = $estudiante->getDicta();
  $materia        = new Materia($dicta->materia_id);
  $docente        = new Docente($dicta->docente_id);
  $docentes[] = $docente;

  $html .= <<<CERT
    &nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>
    <table style="width:100%;">
      <tr>
CERT;
  foreach ($docentes as $docente) {
    $html .= <<<CERT
        <td style="text-align:center;">.........................</td>
CERT;
  }
  $html .= <<<CERT
      </tr>
      <tr>
CERT;

  foreach ($docentes as $docente) {
    $html .= <<<CERT
        <td style="text-align:center;">Docente</td>
CERT;
  }

  $html .= <<<CERT
      </tr>
      <tr>
CERT;

  foreach ($docentes as $docente) {
    $html .= <<<CERT
        <td style="text-align:center;">{$docente->getNombreCompleto()}</td>
CERT;
  }

  $html .= <<<CERT
      </tr>
    </table>
CERT;

if ($proyecto->responsable){
    $html .= <<<CERT
    &nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>
    <table style="width:100%;">
      <tr>
CERT;
    $html .= <<<CERT
        <td style="text-align:center;">.........................</td>
CERT;
  $html .= <<<CERT
      </tr>
      <tr>
CERT;

    $html .= <<<CERT
        <td style="text-align:center;">Responsable</td>
CERT;

  $html .= <<<CERT
      </tr>
      <tr>
CERT;

    $html .= <<<CERT
        <td style="text-align:center;">{$proyecto->responsable}</td>
CERT;

  $html .= <<<CERT
      </tr>
    </table>
CERT;
}

  // output the HTML content
  //$pdf->SetXY(10, 50);
  $pdf->writeHTML($html, true, false, true, false, '');

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  // reset pointer to the last page
  $pdf->lastPage();

  // ---------------------------------------------------------

  //Close and output PDF document
  $pdf->Output('avance.proyecto'.date('Y').date('m').date('d').'.pdf', 'I');

  //============================================================+
  // END OF FILE                                                
  //============================================================+
