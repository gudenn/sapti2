<?php
  require('_start.php');
$to ='ola' ;  
$ideve1=$_GET['idev'];
  leerClase("Evento");
 $evento1=new Evento($ideve1);
 
// Process
$action = isset($_POST["action"]) ? $_POST["action"] : "";
if (empty($action)) {
	// Send back the contact form HTML
	$output = "<div style='display:none'>
	<div class='contact-top'></div>
	<div class='contact-content'>
		<h1 class='contact-title'>Edicion de Evento</h1>
		<div class='contact-loading' style='display:none'></div>
		<div class='contact-message' style='display:none'></div>
		<form action='#' style='display:none'>
			<label for='contact-titulo'>Titulo:</label>
			<input type='text' id='contact-titulo' class='contact-input' name='titulo' tabindex='1001' value='{$evento1->asunto}'/>
			<label for='contact-fecha'>Fecha:</label>
			<input type='text' id='contact-fecha' class='contact-input' name='fecha' tabindex='1002' value='{$evento1->fecha_evento}' />
                        <label for='contact-descripcion'>Descripcion:</label>
			<textarea id='contact-descripcion' class='contact-input' name='descripcion' cols='40' rows='4' tabindex='1003'>{$evento1->descripcion}</textarea>
			<br/><label>&nbsp;</label>
			<button type='submit' class='contact-send contact-button' tabindex='1005'>Grabar</button>
			<button type='submit' class='contact-cancel contact-button simplemodal-close' tabindex='1006'>Cancelar</button>
			<br/>
                        <input type='hidden' name='token' value='" . smcf_token($to) . "'/>
                        <input type='hidden' name='ideve' value='{$evento1->id}'/>

		</form>
	</div>
                <script type='text/javascript'>
              $(function(){
            $('#contact-fecha').datepicker({
              dateFormat:'dd/mm/yy',
              changeMonth: true,
              changeYear: true,
              yearRange: '2000:2050'
            });
          });
        </script>
	<div class='contact-bottom'></div>
</div>";
	echo $output;
}
else if ($action == "send") {
    // Send the email
        $ideve = isset($_POST["ideve"]) ? $_POST["ideve"] : "";
	$titulo = isset($_POST["titulo"]) ? $_POST["titulo"] : "";
	$fecha = isset($_POST["fecha"]) ? $_POST["fecha"] : "";
	$descripcion = isset($_POST["descripcion"]) ? $_POST["descripcion"] : "";
	$token = isset($_POST["token"]) ? $_POST["token"] : "";
	// make sure the token matches
    	if ($token === smcf_token($to)) {
		smcf_send($titulo, $fecha, $descripcion, $ideve);
		echo "Se modifico con exito su evento.";
	}
	else {
		echo "Error al modificar su evento. Vuelva a intentarlo.";
	}
}
function smcf_token($s) {
	return md5("smcf-" . $s . date("WY"));
}

function smcf_send($titulo, $fecha, $descripcion,$eve) {
    $evento = new Evento($eve);
    $evento->objBuidFromPost();
    $evento->estado = Objectbase::STATUS_AC;
    $evento->dicta_id=4;
    $evento->asunto=$titulo;
    $evento->fecha_evento=$fecha;
    $evento->descripcion=$descripcion;
    $evento->save();
}

exit;

?>