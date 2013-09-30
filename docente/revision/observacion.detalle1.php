<?php
  require('../_start.php');
$to ='ola' ;  
$ideve1=$_GET['idev'];
  $resul = "
      SELECT ob.observacion as obser, pr.nombre as nomp, us.nombre as nom,CONCAT(us.apellido_paterno,us.apellido_materno) as ap, re.fecha_revision as fere, ob.estado_observacion as estado
FROM observacion ob, revision re, proyecto pr, docente doc, proyecto_estudiante proe, usuario us
WHERE ob.revision_id=re.id
AND re.proyecto_id=pr.id
AND pr.id=proe.proyecto_id
AND re.revisor=doc.id
AND doc.usuario_id=us.id
AND ob.revision_id='".$ideve1."' 
          ";
   $sql = mysql_query($resul);
while ($fila1 = mysql_fetch_array($sql, MYSQL_ASSOC)) {
   $arrayobser[]=$fila1;
 }
 
// Process
$action = isset($_POST["action"]) ? $_POST["action"] : "";
if (empty($action)) {
	// Send back the contact form HTML
	$output = "<div style='display:none'>
	<div class='contact-top'></div>
	<div class='contact-content'>
		<h1 class='contact-title'>Detalle de Observaciones</h1>
		<div class='contact-loading' style='display:none'></div>
		<div class='contact-message' style='display:none'></div>
                <form action='#' style='display:none'>
          <p>
            <label for='revisor'>Nombre del Revisor:</label>
            <span><i>{$arrayobser[0]['nom']}</i><i>{$arrayobser[0]['ap']}</i></span>
          </p>
          <p>
            <label for='proyecto_id'>Nombres de Proyecto: </label>
            <span>{$arrayobser[0]['nomp']}</span>
          </p>
          <p>
            <label for='fecha_observacion'>Fecha de Observacion: </label>
            <span>{$arrayobser[0]['fere']}</span>            
          </p>
          <div style='height: 200px; width: 650px; font-size: 12px; overflow: auto;'>
            <table class='tbl_lista'>
            <thead>
              <tr>
                <th><a>Observaciones Realizadas:</a></th>
                <th><a>Estado Observaciones:</a></th>
              </tr>
            </thead>
            <tbody>";
            for ($g=0;$g<count($arrayobser);$g++)
            {
            $output .="
                      <tr class=".classtabla($g).">
                      <td>{$arrayobser[$g]['obser']}</td>
                      <td>
                          <a>".estado($arrayobser[$g]['estado'])."</a>
                      </td>
                      </tr>";
            }
            
            $output .="
                      </tbody>
            </table>
	</form>
        </div>
        <button type='submit' class='contact-cancel contact-button simplemodal-close' tabindex='1006'>Cerrar</button>
        </div>
	<div class='contact-bottom'></div>
</div>";
	echo $output;
}
function classtabla($va){
    $clas='light';
    if($va%2 == 0){
    $clas='dark';    
    }
    return $clas;
};
function tabla(){
              for ($g=0;$g==3;$g++)
            {
            $output1 +="<tr class=".classtabla($i).">
                      <td>{$arrayobser[$g]['obser']}</td>
                      </tr>";
            }  
   return $output1;
}
function estado($va){
    $clas='';
    if($va == 'CR'){
    $clas='CREADO';
    $res=$clas." <img src=../../images/icons/flags/CR.png title=\"Estado Observacion\"/>";
    }else{
        if($va == 'CO'){
            $clas='CORREGIDO';
            $res="<img src=../../images/icons/flags/RE.png title=\"Estado Observacion\"/>".$clas;
        }else{
            if($va == 'AP'){
                $clas='APROBADO';
                $res="<img src=../../images/icons/flags/RE.png title=\"Estado Observacion\"/>".$clas;
            }
        }
    }
    return $res;
};

exit;

?>