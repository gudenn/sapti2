<?php
   define ("MODULO", "CONSEJO");
 require('../_start.php');
 leerClase("Usuario");
 leerClase("Docente");
 leerClase("Semestre");
 if(isset($_GET["id"]))
 {
  $docente= new Docente(trim($_GET["id"]));
  $usaurio= new Usuario($docente->usuario_id);
  $numero=   $docente->getNumeroTribunales();
    $semestre = new Semestre();
    $puntos   = $semestre->getValor('Número máximo de tribunal por docente', 10);
    if($numero<=$puntos )
    {
        echo 1;
    }  else {
      echo  $usaurio->getNombreCompleto()." Nro. total ". $numero . " Número máximo de tribunal por docente ". $puntos ;
    }
  
  
 }

?>
