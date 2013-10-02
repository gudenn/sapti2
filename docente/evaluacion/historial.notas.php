<?php
  require('../_start.php');
 
$ideve1=$_GET['idev'];
  $resul = "
      SELECT se.codigo as semestre, CONCAT(us.apellido_paterno,us.apellido_materno,us.nombre) as docente, ma.nombre as materia, ev.promedio as promedio
FROM inscrito it, evaluacion ev, semestre se, materia ma, docente dc, usuario us, dicta di
WHERE it.evaluacion_id=ev.id
AND it.semestre_id=se.id
AND it.dicta_id=di.id
AND di.docente_id=dc.id
AND dc.usuario_id=us.id
AND di.materia_id=ma.id
AND it.estudiante_id=(SELECT it.estudiante_id
FROM evaluacion ev, inscrito it
WHERE it.evaluacion_id=ev.id
AND ev.id='".$ideve1."' 
          )";
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
		<h1 class='contact-title'>Historial de Notas</h1>
		<div class='contact-loading' style='display:none'></div>
		<div class='contact-message' style='display:none'></div>
                <form action='#' style='display:none'>
          <div style='height: 200px; width: 650px; font-size: 12px; overflow: auto;'>
            <table class='tbl_lista'>
            <thead>
              <tr>
                <th><a>Semestre:</a></th>
                <th><a>Docente:</a></th>
                <th><a>Materia:</a></th>
                <th><a>Promedio:</a></th>
              </tr>
            </thead>
            <tbody>";
            for ($g=0;$g<count($arrayobser);$g++)
            {
            $output .="
                      <tr class=".classtabla($g).">
                      <td>{$arrayobser[$g]['semestre']}</td>
                      <td>{$arrayobser[$g]['docente']}</td>
                      <td>{$arrayobser[$g]['materia']}</td>
                      <td>{$arrayobser[$g]['promedio']}</td>
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

exit;

?>