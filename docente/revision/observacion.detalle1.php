<?php
define ("MODULO", "DOCENTE");
  require('../_start.php');
  leerClase('Revision');
  

$ideve1=$_GET['idev'];
$revision=new Revision($ideve1);
function tipoconsulta($cons, $ideve){
   switch ($cons) {
      case 'TU':
          $resul = "
      SELECT ob.observacion as observacion, ob.respuesta as respuesta, pr.nombre as nomp, CONCAT(us.titulo_honorifico,' ', us.apellido_paterno,' ', us.apellido_materno,' ', us.nombre) as nombre, re.fecha_revision as fere, ob.estado_observacion as estado
FROM observacion ob, revision re, proyecto pr, usuario us, tutor tu
WHERE ob.revision_id=re.id
AND re.proyecto_id=pr.id
AND re.revisor=tu.id
AND tu.usuario_id=us.id
AND ob.revision_id='".$ideve."' 
          ";
        break;
      case 'DO':
          $resul = "
      SELECT ob.observacion as observacion, ob.respuesta as respuesta, pr.nombre as nomp, CONCAT(us.titulo_honorifico,' ', us.apellido_paterno,' ', us.apellido_materno,' ', us.nombre) as nombre, re.fecha_revision as fere, ob.estado_observacion as estado
FROM observacion ob, revision re, proyecto pr, usuario us, docente dc
WHERE ob.revision_id=re.id
AND re.proyecto_id=pr.id
AND re.revisor=dc.id
AND dc.usuario_id=us.id
AND ob.revision_id='".$ideve."' 
          ";
        break;
      case 'DP':
          $resul = "
      SELECT ob.observacion as observacion, ob.respuesta as respuesta, pr.nombre as nomp, CONCAT(us.titulo_honorifico,' ', us.apellido_paterno,' ', us.apellido_materno,' ', us.nombre) as nombre, re.fecha_revision as fere, ob.estado_observacion as estado
FROM observacion ob, revision re, proyecto pr, usuario us, docente dc
WHERE ob.revision_id=re.id
AND re.proyecto_id=pr.id
AND re.revisor=dc.id
AND dc.usuario_id=us.id
AND ob.revision_id='".$ideve."' 
          ";
        break;
      case 'TR':
        $resul = 'Tribunal';
        break;
      default:
        break;
    } 
    return $resul;
}

   $sql = mysql_query(tipoconsulta($revision->getRevisorTipo(), $ideve1));
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
            <span>{$arrayobser[0]['nombre']}</span>
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
                <th><a>Correcciones Realizadas:</a></th>
                <th><a>Estado Observaciones:</a></th>
              </tr>
            </thead>
            <tbody>";
            for ($g=0;$g<count($arrayobser);$g++)
            {
            $output .="
                      <tr class=".classtabla($g).">
                      <td>{$arrayobser[$g]['observacion']}</td>
                      <td>".getRespuesta($arrayobser[$g]['respuesta'])."</td>
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

function estado($va){
    $clas='';
    if($va == 'CR'){
    $clas='CREADO';
    $res=$clas." <img src=../../images/icons/flags/CR.png title=\"Estado Observacion\" width='20px' height='20px' />";
    }else{
        if($va == 'CO'){
            $clas='CORREGIDO';
            $res="<img src=../../images/icons/flags/RE.png title=\"Estado Observacion\" width='20px' height='20px' />".$clas;
        }else{
            if($va == 'AP'){
                $clas='APROBADO';
                $res="<img src=../../images/icons/flags/RE.png title=\"Estado Observacion\" width='20px' height='20px' />".$clas;
            }else{
            if($va == 'NP'){
                $clas='RECHAZADO';
                $res="<img src=../../images/icons/flags/NP.png title=\"Estado Observacion\" width='20px' height='20px' />".$clas;
            }
        }
        }
    }
    return $res;
};
  function getRespuesta($descripcion)
  {
    $resumen = $descripcion;
    $resumen   = htmlspecialchars_decode( $resumen );
    return $resumen;
  }

exit;

?>