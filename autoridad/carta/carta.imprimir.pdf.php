<?php
  define ("MODULO", "ADMIN-CARTAS");
  require('../_start.php');
  if(!isUserSession())
    header("Location: ../login.php");  
 
 
require_once(DIR_LIB.'/tcpdf/config/lang/spa.php');
require_once(DIR_LIB.'/tcpdf/tcpdf.php');

 //cabecera pdf
class MYPDF extends TCPDF {

    //Page header
    public function Header() {
    }

    // Page footer
    public function Footer() {
    }
}

// create new PDF document
$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('SAPTI');
$pdf->SetTitle('CARTA');
$pdf->SetSubject('CARTA');
$pdf->SetKeywords('CARTA');
$pdf->getPageSizeFromFormat('CARTA');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE.' 006', PDF_HEADER_STRING);

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, 0, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(0);
$pdf->SetFooterMargin(10);

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
//$pdf->setLanguageArray($l);

// ---------------------------------------------------------

// set font
$pdf->SetFont('dejavusans', '', 10);

// add a page
$pdf->AddPage('P','LETTER');

/*********************************************************************/
try {
  /** HEADER */
  $smarty->assign('title','SAPTI - Detalle de Carta');
  $smarty->assign('description','Detalle de Carta');
  $smarty->assign('keywords','SAPTI,Carta,Registro');

  leerClase('Administrador');
  leerClase('Html');
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'carta/','name'=>'Cartas SAPTI');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'carta/carta.getion.php','name'=>'Gesti&oacute;n de Cartas');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'carta/'.basename(__FILE__),'name'=>'Detalle de Carta');
  $smarty->assign("menuList", $menuList);


  $smarty->assign('header_ui','1');
  $CSS[]  = URL_CSS . "carta.css";
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS','');

  
  $smarty->assign("ERROR", '');


  //CREAR 
  leerClase('Carta');
  leerClase('Proyecto');
  leerClase('Modelo_carta');
  
  $id = '';
  if (isset($_POST['carta_id']) && is_numeric($_POST['carta_id']))
    $id = $_POST['carta_id'];
  $carta    = new Carta($id);
  $proyecto = new Proyecto($carta->proyecto_id);
  $proyecto->getAllObjects();
  $modelo   = new Modelo_carta($carta->modelo_carta_id);
  
  // guardamos en la session para recuperar los archivos
  $template = TEMPLATES_DIR."modelo_carta/archivo/{$modelo->codigo}.tpl";

  if ( !file_exists($template) )
    $template = false;
  $template = Html::leerTemplate($template);
  if (isset($_POST['carta_id']))
    $template = $modelo->asignarFormulario($template);
  
  
  $smarty->assign('template' ,$template);
  $smarty->assign('carta'    ,$carta);
  $smarty->assign('modelo'   ,$modelo);
  $smarty->assign('proyecto' ,$proyecto);

  //No hay ERROR
  $ERROR = ''; 

  $smarty->assign("ERROR",$ERROR);
  
}
catch(Exception $e) 
{
  mysql_query("ROLLBACK");
  $smarty->assign("ERROR", handleError($e));
}

$token                = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token',$token);

ob_start();
$smarty->display('modelo_carta/impresion.tpl');
$page = ob_get_contents();
ob_end_clean();

/*********************************************************************/

// output the HTML content
$pdf->SetXY(10, 0);
$pdf->writeHTML($page, true, false, true, false, '');

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// reset pointer to the last page
$pdf->lastPage();

// ---------------------------------------------------------
$time = time();
//Close and output PDF document
$pdf->Output("carta.$time.pdf", 'I');

//============================================================+
// END OF FILE                                                
//============================================================+
