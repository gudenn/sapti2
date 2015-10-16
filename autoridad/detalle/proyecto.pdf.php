<?php

//if (!defined('START')){
  require('../_start.php');
//}

require_once(DIR_LIB . '/tcpdf/config/lang/eng.php');
require_once(DIR_LIB . '/tcpdf/tcpdf.php');


//cabecera pdf
class MYPDF extends TCPDF {

  //Page header
  public function Header() {
    // Logo
    $image_file = K_PATH_IMAGES . 'cabesera.jpg';
    $this->Image($image_file, 20, 10, 550, 56, 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
    // Set font
    $this->SetFont('helvetica', 'B', 20);
  }

  // Page footer
  public function Footer() {
    
  }

}

// create new PDF document
$pdf = new MYPDF('P', 'pt', 'LETTER', true, 'UTF-8', false);

// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Sapti');
$pdf->SetTitle('Sapti Reporte');
$pdf->SetSubject('Sistema Sapti');
$pdf->SetKeywords('reporte, PDF, docente, lista, alumnos');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE . ' 006', PDF_HEADER_STRING);

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, 70, PDF_MARGIN_RIGHT);
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
//$pdf->SetFont('dejavusans', '', 10);

// add a page
//$pdf->AddPage( 'P' ,'LETTER'  );

function desplegar() {
  leerClase('Area');
  leerClase('Sub_area');
  leerClase('Usuario');
  leerClase('Tutor');
  leerClase('Semestre');
  leerClase('Modalidad');
  leerClase('Proyecto');
  leerClase('Institucion');
  leerClase('Estudiante');
  if (!isset($_GET['estudiante_id']) && !is_numeric($_GET['estudiante_id'])) {
    return;
  }
  $estudiante = new Estudiante($_GET['estudiante_id']);
  $proyecto = $estudiante->getProyecto();
  $proyecto->getAllObjects();
  $usuario    = new Usuario($estudiante->usuario_id);


  // TUTORES
  $tutores              = '';
  $tutor_responsable    = '';
  foreach ($proyecto->proyecto_tutor_objs as $proyecto_tutor) {
      if (! isset($proyecto_tutor->tutor_id) || !$proyecto_tutor->tutor_id ) continue;
    $tutor = new Tutor($proyecto_tutor->tutor_id);
    $tutores .= $tutor->getNombreCompleto().', ';
    if ($tutor_responsable == ''){
      $tutor_responsable = $tutor->getNombreCompleto();
    }
  }
  $tutores = rtrim($tutores,', ');

  //exit('todo bien');
  //CARRERA
  $carrera = 'Licenciatura en Ingeniería de Sistemas ';
  $proyecto->trabajo_conjunto = ($proyecto->trabajo_conjunto==Proyecto::TRABAJO_CONJUNTO_SI)?'SI':'NO';

  //SEMESTRE ACTIVO @todo get el semestre del proyecto
  $semestre    = new Semestre(0,1);
  $cambio_tema = $estudiante->numero_cambio_total?'SI':'NO';

  //AREA
  $area = '';
  foreach ($proyecto->proyecto_area_objs as $proyecto_area){
    $area_obj = new Area($proyecto_area->area_id);
    $area    .= $area_obj->nombre.'<br>';
  }
  $area = rtrim($area, '<br>');

  //Subarea
  $subarea = '';
  foreach ($proyecto->proyecto_sub_area_objs as $proyecto_sub_area){
    $subarea_obj = new Sub_area($proyecto_sub_area->sub_area_id);
    $subarea    .= $subarea_obj->nombre.'<br>';
  }
  $subarea = rtrim($subarea, '<br>');

  //MODALIDAD
  $modalidad = new Modalidad($proyecto->modalidad_id);
  // ESPECIFICOS
  switch (count($proyecto->objetivo_especifico_objs)) {
    case 10:case 9:case 8:case 7:
      $font_esp = '9';
      break;
    case 6:case 5:
      $font_esp = '11';
      break;
    case 4:case 3:case 2:case 1:
      $font_esp = '12';
      break;
    default:
      $font_esp = '8';
      break;
  }
  //DESCRIPCION
  if (strlen($proyecto->descripcion)>1000){
    $font_des = '8';
  }elseif (strlen($proyecto->descripcion)>750){
    $font_des = '9';
  }elseif (strlen($proyecto->descripcion)>500){
    $font_des = '10';
  }elseif (strlen($proyecto->descripcion)>500){
    $font_des = '11';
  }else{
    $font_des = '12';
  }

  if(isset($_GET['test'])){
    var_dump($usuario);
    var_dump($estudiante);
    var_dump($proyecto);
    exit();
  }

  $formulario = <<<FORMULARIO
<p lang="es-ES" style="text-align:right;width:600;"></p>
<table lang="es-ES" width="700" cellpadding="3" cellspacing="0" style="page-break-before: always">
	<tr valign="top">
		<td width="100%" colspan="2" style="text-align:right;">
			<b>SELLO</b>
		</td>
	</tr>
	<tr valign="top">
		<td width="20%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none;">Nombre estudiante:</td>
		<td width="23%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none;">{$usuario->apellido_paterno}</td>
		<td width="23%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: none; border-right: none;">{$usuario->apellido_materno}</td>
		<td width="24%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: none; border-right: none;">{$usuario->nombre}</td>
		<td width="10%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-right: 1px solid #000000; border-left: none;">
			No. {$proyecto->numero_asignado}
		</td>
	</tr>
	<tr valign="top">
		<td width="20%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none;"></td>
		<td width="23%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none;"><b>Ap. Paterno</b></td>
		<td width="23%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none;"><b>Ap. Materno</b></td>
		<td width="34%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right:  1px solid #000000;"><b>Nombres</b></td>
	</tr>
	<tr valign="top">
		<td width="43%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none;"><b>Teléfono:</b> {$usuario->telefono}</td>
		<td width="57%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right:  1px solid #000000;"><b>E-mail:</b> {$usuario->email}</td>
	</tr>
	<tr valign="top">
		<td width="100%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000;"><b>Tutores:</b><span style="font-size:$font_esp;">{$tutores}</span></td>
	</tr>
	<tr valign="top">
		<td width="60%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none;"><b>Carrera:</b> {$carrera}</td>
		<td width="40%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right:  1px solid #000000;"><b>Trabajo Conjunto:</b> {$proyecto->trabajo_conjunto}</td>
	</tr>
	<tr valign="top">
		<td width="60%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none;"><b>Gestión de aprobación:</b> {$semestre->codigo}</td>
		<td width="40%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right:  1px solid #000000;"><b>Cambio de tema:</b> {$cambio_tema}</td>
	</tr>
	<tr valign="top">
		<td width="100%" style="">&nbsp;</td>
	</tr>
	<tr valign="top">
		<td width="100%" style="border: 1px solid #000000;"><b>Título:</b> {$proyecto->nombre}</td>
	</tr>
	<tr valign="top">
		<td width="50%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none;"><b>Área:</b> {$area}</td>
		<td width="50%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right:  1px solid #000000;"><b>Subárea:</b><span style="font-size:$font_esp;"> {$subarea}</span></td>
	</tr>
FORMULARIO;
  if ($modalidad->datos_adicionales){
    $institucion = new Institucion($proyecto->institucion_id);
  $formulario .= <<<FORMULARIO
	<tr valign="top">
		<td width="50%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none;"><b>Modalidad:</b> {$modalidad->nombre}</td>
		<td width="50%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right:  1px solid #000000;"><b>Institución participante:</b> {$institucion->nombre}</td>
	</tr>
FORMULARIO;
    
  }
  else{
  $formulario .= <<<FORMULARIO
	<tr valign="top">
		<td width="100%" style="border: 1px solid #000000;"><b>Modalidad:</b> {$modalidad->nombre}</td>
	</tr>
FORMULARIO;
    
  }

  $formulario .= <<<FORMULARIO
	<tr valign="top">
		<td width="100%" style="border: 1px solid #000000;"><b>Objetivo general:</b> {$proyecto->objetivo_general}</td>
	</tr>
	<tr valign="top">
		<td width="100%" style="border: 1px solid #000000;margin:0;padding:0;"><b>Objetivos específicos:</b><ul style="margin:0;padding:0;font-size:$font_esp;">
FORMULARIO;

  // OBJETIVOS ESPECIFICOS
  foreach ($proyecto->objetivo_especifico_objs as $especifico){
  $formulario .= <<<FORMULARIO
<li>{$especifico->descripcion}</li>
FORMULARIO;
  }
  
  $formulario .= <<<FORMULARIO
      </ul>
    </td>
	</tr>
	<tr valign="top">
		<td width="100%" style="border: 1px solid #000000;font-size:$font_des;"><b>Descripción:</b> {$proyecto->descripcion}</td>
	</tr>
FORMULARIO;
  if ($modalidad->datos_adicionales){
    $institucion = new Institucion($proyecto->institucion_id);
  $formulario .= <<<FORMULARIO
	<tr valign="top">
		<td width="20%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none;"></td>
		<td width="20%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none;"></td>
		<td width="20%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none;"></td>
		<td width="20%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none;"></td>
		<td width="20%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right:  1px solid #000000;"></td>
	</tr>
	<tr valign="top">
		<td width="20%" style="border-bottom: none; border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: none;text-align:center;">Director de Carrera</td>
		<td width="20%" style="border-bottom: none; border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: none;text-align:center;">Docente Materia</td>
		<td width="20%" style="border-bottom: none; border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: none;text-align:center;">Tutor</td>
		<td width="20%" style="border-bottom: none; border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: none;text-align:center;">Responsable</td>
		<td width="20%" style="border-bottom: none; border-top: 1px solid #000000; border-left: 1px solid #000000; border-right:  1px solid #000000;text-align:center;">Estudiante</td>
	</tr>
	<tr valign="top">
		<td width="20%" style="border-bottom: 1px solid #000000; border-top: none; border-left: 1px solid #000000; border-right: none;text-align:center;font-size:9">{$proyecto->director_carrera}</td>
		<td width="20%" style="border-bottom: 1px solid #000000; border-top: none; border-left: 1px solid #000000; border-right: none;text-align:center;font-size:9">{$proyecto->docente_materia}</td>
		<td width="20%" style="border-bottom: 1px solid #000000; border-top: none; border-left: 1px solid #000000; border-right: none;text-align:center;font-size:9">{$tutor_responsable}</td>
		<td width="20%" style="border-bottom: 1px solid #000000; border-top: none; border-left: 1px solid #000000; border-right: none;text-align:center;font-size:9">{$proyecto->responsable}</td>
		<td width="20%" style="border-bottom: 1px solid #000000; border-top: none; border-left: 1px solid #000000; border-right:  1px solid #000000;text-align:center;font-size:9">{$estudiante->getNombreCompleto()}</td>
	</tr>
FORMULARIO;
    
  }
  else{
  $formulario .= <<<FORMULARIO
	<tr valign="top">
		<td width="25%" style="border-bottom: none; border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: none;text-align:center;"></td>
		<td width="25%" style="border-bottom: none; border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: none;text-align:center;"></td>
		<td width="25%" style="border-bottom: none; border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: none;text-align:center;"></td>
		<td width="25%" style="border-bottom: none; border-top: 1px solid #000000; border-left: 1px solid #000000; border-right:  1px solid #000000;text-align:center;"></td>
	</tr>
	<tr valign="top">
		<td width="25%" style="border-bottom: 1px solid #000000; border-top: none; border-left: 1px solid #000000; border-right: none;text-align:center;font-size:9"></td>
		<td width="25%" style="border-bottom: 1px solid #000000; border-top: none; border-left: 1px solid #000000; border-right: none;text-align:center;font-size:9"></td>
		<td width="25%" style="border-bottom: 1px solid #000000; border-top: none; border-left: 1px solid #000000; border-right: none;text-align:center;font-size:9"></td>
		<td width="25%" style="border-bottom: 1px solid #000000; border-top: none; border-left: 1px solid #000000; border-right:  1px solid #000000;text-align:center;font-size:9"></td>
	</tr>
	<tr valign="top">
		<td width="25%" style="border-bottom: none; border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: none;text-align:center;">Director de Carrera</td>
		<td width="25%" style="border-bottom: none; border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: none;text-align:center;">Docente Materia</td>
		<td width="25%" style="border-bottom: none; border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: none;text-align:center;">Tutor</td>
		<td width="25%" style="border-bottom: none; border-top: 1px solid #000000; border-left: 1px solid #000000; border-right:  1px solid #000000;text-align:center;">Estudiante</td>
	</tr>
	<tr valign="top">
		<td width="25%" style="border-bottom: 1px solid #000000; border-top: none; border-left: 1px solid #000000; border-right: none;text-align:center;font-size:9">{$proyecto->director_carrera}</td>
		<td width="25%" style="border-bottom: 1px solid #000000; border-top: none; border-left: 1px solid #000000; border-right: none;text-align:center;font-size:9">{$proyecto->docente_materia}</td>
		<td width="25%" style="border-bottom: 1px solid #000000; border-top: none; border-left: 1px solid #000000; border-right: none;text-align:center;font-size:9">{$tutor_responsable}</td>
		<td width="25%" style="border-bottom: 1px solid #000000; border-top: none; border-left: 1px solid #000000; border-right:  1px solid #000000;text-align:center;font-size:9">{$estudiante->getNombreCompleto()}</td>
	</tr>
FORMULARIO;
    
  }

  $formulario .= <<<FORMULARIO
	<tr valign="top">
		<td width="100%" style="">&nbsp;</td>
	</tr>
	<tr valign="top">
		<td width="60%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none;"><b>Registrado por:</b>{$proyecto->registrado_por}</td>
		<td width="20%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right: none;"><b>Firma:</b></td>
		<td width="20%" style="border-top: 1px solid #000000; border-bottom: 1px solid #000000; border-left: 1px solid #000000; border-right:  1px solid #000000;"><b>Fecha:</b>{$proyecto->fecha_registro}</td>
	</tr>

</table>
FORMULARIO;
  return $formulario;
}

// output the HTML content
//$pdf->SetXY(20, 50);
$pdf->writeHTML(desplegar(), true, false, true, false, '');

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// reset pointer to the last page
$pdf->lastPage();

// ---------------------------------------------------------
//Close and output PDF document
$pdf->Output('Reportesistema.pdf', 'I');

//============================================================+
// END OF FILE                                                
//============================================================+
