<?php
define ("MODULO", "DOCENTE");
require('_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php");
 leerClase('Dicta');
 leerClase('Usuario');
 leerClase('Evaluacion');
require_once(DIR_LIB.'/tcpdf/config/lang/eng.php');
require_once(DIR_LIB.'/tcpdf/tcpdf.php');

if(isset($_GET['iddicta']))
$tre = $_GET['tre'];
$eva=$_GET['eva'];
$iddicta  = $_GET['iddicta'];
date_default_timezone_set('America/La_Paz');
$b=1;
function selectmuestra($mat,$eva){
    $ab="";
    if($mat!='')
        $ab.="
            es.codigo_sis as Codigo_Sis, CONCAT(us.nombre,' ',us.apellido_paterno,' ',us.apellido_materno) as Estudiante, pro.nombre as Nombre_Proyecto";
    if($eva==1)
        $ab.="
            , eva.promedio as Promedio";
    return $ab;
}
function wheremuestra($mat,$sem,$eva){
    $ac="";
    if($mat!='')
    $ac.="
        AND di.id=".$mat."";
    if($sem=='2')
    $ac.="
        AND eva.promedio >='51'";
    return $ac;
}
function consulta($mat,$sem,$eva){
    if($eva==1){
     $sql="SELECT es.codigo_sis as Codigo_Sis, CONCAT(us.apellido_paterno,' ', us.apellido_materno,' ', us.nombre) as Estudiante, pr.nombre as Nombre_Proyecto, ev.evaluacion_1 as E1, ev.evaluacion_2 as E2, ev.evaluacion_3 as E3, ev.promedio as Pro, ev.rfinal as Apro
 FROM dicta di, estudiante es, usuario us, inscrito it, proyecto pr, proyecto_estudiante pe, evaluacion ev
 WHERE di.id=it.dicta_id
 AND it.estudiante_id=es.id
 AND es.usuario_id=us.id
 AND pe.estudiante_id=es.id
 AND pe.proyecto_id=pr.id
 AND it.evaluacion_id=ev.id
 AND pr.es_actual=1
 AND di.id='".$mat."'"; 
    }else{
    $sql="SELECT ".selectmuestra($mat,$sem)."
  FROM estudiante es, usuario us, materia ma, inscrito ins, dicta di, proyecto pro, proyecto_estudiante proes, evaluacion eva, semestre se
 WHERE es.usuario_id=us.id
 AND eva.id=ins.evaluacion_id
 AND proes.estudiante_id=es.id
 AND proes.proyecto_id=pro.id
 AND ins.estudiante_id=es.id
 AND ins.dicta_id=di.id
 AND di.materia_id=ma.id 
 AND di.semestre_id=se.id
 AND se.activo=1
".wheremuestra($mat,$sem,$eva)."";
    }
    return $sql;
}
 $sql=  consulta($iddicta,$tre,$eva);
 if($_GET['eva']==1){
     $resul = "
      SELECT ev.id as id
FROM dicta di, estudiante es, usuario us, inscrito it, proyecto pr, proyecto_estudiante pe, evaluacion ev
WHERE di.id=it.dicta_id
AND it.estudiante_id=es.id
AND es.usuario_id=us.id
AND pe.estudiante_id=es.id
AND pe.proyecto_id=pr.id
AND it.evaluacion_id=ev.id
AND di.id='".$iddicta."' 
          ";
   $sql1 = mysql_query($resul);
   if(mysql_num_rows($sql1)>0){
while ($fila1 = mysql_fetch_array($sql1, MYSQL_ASSOC)) {
   $idevaluacion[]=$fila1;
 }
     foreach ($idevaluacion as $idevaluacion_array) {
     $evaluacion = new Evaluacion($idevaluacion_array['id']);
     $evaluacion->setPromedio();     
   }
 };
 };
   
function DesplegarTabla($a,$b)
     {
    if(isset($a)){
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
        }  else {
            return "No tiene datos para mostrar.";
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
