<?php
define ("MODULO", "DOCENTE");
  require('../_start.php');

  leerClase("Estudiante");
  leerClase('Avance');
  $ideve1=$_GET['idev'];
  
$avance   = new Avance($ideve1);
if($avance->revision_id==0){
      $resul = "
      SELECT pr.nombre as nombrep, av.fecha_avance as fecha
FROM avance av, proyecto pr
WHERE av.proyecto_id=pr.id
AND av.id='".$ideve1."' 
          ";
}else{
    $resul = "
SELECT CONCAT(us.titulo_honorifico,' ', us.apellido_paterno,' ', us.apellido_materno,' ', us.nombre) as nombreRevisor, av.fecha_avance as fecha, pr.nombre as nombrep
FROM avance av, revision re, proyecto pr, usuario us, docente dc
WHERE av.id=re.avance_id
AND dc.usuario_id=us.id
AND av.proyecto_id=pr.id
AND re.revisor=dc.id
AND av.id='".$ideve1."' 
          ";
}
   $sql = mysql_query($resul);
while ($fila1 = mysql_fetch_array($sql, MYSQL_ASSOC)) {
   $arrayobser[]=$fila1;
 }
 
  $estudiante=new Estudiante($avance->getEstudiante());

  $dir='../../'.$avance->getDirectorioAvancedir($estudiante->codigo_sis);
  $archivosruta=obtener_directorios($dir);
// Process
$action = isset($_POST["action"]) ? $_POST["action"] : "";
if (empty($action)&&$avance->revision_id==0) {
	    	$output = "<div style='display:none'>
	<div class='contact-top'></div>
	<div class='contact-content'>
		<h1 class='contact-title'>Detalle de Avance</h1>
		<div class='contact-loading' style='display:none'></div>
		<div class='contact-message' style='display:none'></div>
                <form action='#' style='display:none'>

          <p>
            <label for='proyecto_id'>Nombres de Proyecto: </label>
            <span>{$arrayobser[0]['nombrep']}.</span>
          </p>
          <p>
            <label for='fecha_observacion'>Fecha de Avance: </label>
            <span>{$arrayobser[0]['fecha']}.</span>            
          </p>
          <div style='height: 200px; width: 650px; font-size: 12px; overflow: auto;'>
            <table class='tbl_lista'>
            <thead>
              <tr>
                <th><a>Archivos Del Proyecto:</a></th>
                <th><a>Descargar:</a></th>
              </tr>
            </thead>
            <tbody>";
            for ($g=0;$g<count($archivosruta);$g++)
            {
            $output .="
                      <tr class=".classtabla($g).">
                      <td>{$archivosruta[$g]}</td>";
             if($archivosruta[$g]=='No Subieron Archivos para este Avance'){
             $output .="
                      <td>
                          <a>Sin Archivos</a>
                      </td>
                      </tr>";
             }else{
             $output .="
                      <td>
                          <a href=".$dir.$archivosruta[$g]." target='_self'>".estado()."</a>
                      </td>
                      </tr>";
             }         

            }
            
            $output .="
                      </tbody>
            </table>
            <p>
            <label for='descripcion'>Descripci&oacute;n del Avance:</label>
            <span><i>".getRespuesta($avance->descripcion)."</i></span>
            </p>
            <p>
            <label>Porcentaje de Avance:</label>
            <span><i>".getRespuesta($avance->porcentaje)." %</i></span>
            </p>
	</form>
        </div>
        <button type='submit' class='contact-cancel contact-button simplemodal-close' tabindex='1006'>Cerrar</button>
        </div>
	<div class='contact-bottom'></div>
</div>";
	echo $output;
}else{

        $output = "<div style='display:none'>
	<div class='contact-top'></div>
	<div class='contact-content'>
		<h1 class='contact-title'>Detalle de Avance</h1>
		<div class='contact-loading' style='display:none'></div>
		<div class='contact-message' style='display:none'></div>
                <form action='#' style='display:none'>
          
            <label for='revisor'>Nombre del Revisor:</label>
            <span><i>{$arrayobser[0]['nombreRevisor']}.</i></span>
          <p>
            <label for='proyecto_id'>Nombres de Proyecto: </label>
            <span>{$arrayobser[0]['nombrep']}.</span>
          </p>
            <label for='fecha_observacion'>Fecha de Avance: </label>
            <span>{$arrayobser[0]['fecha']}.</span>            
          
          <div style='height: 200px; width: 650px; font-size: 12px; overflow: auto;'>
            <table class='tbl_lista'>
            <thead>
              <tr>
                <th><a>Archivos Del Proyecto:</a></th>
                <th><a>Descargar:</a></th>
              </tr>
            </thead>
            <tbody>";
            for ($g=0;$g<count($archivosruta);$g++)
            {
            $output .="
                      <tr class=".classtabla($g).">
                      <td>{$archivosruta[$g]}</td>";
             if($archivosruta[$g]=='No Subieron Archivos para este Avance'){
             $output .="
                      <td>
                          <a>Sin Archivos</a>
                      </td>
                      </tr>";
             }else{
             $output .="
                      <td>
                          <a href=".$dir.$archivosruta[$g]." target='_self'>".estado()."</a>
                      </td>
                      </tr>";
             }         
            }
            $output .="
                      </tbody>
            </table>
            <label for='descripcion'>Descripción del Avance:</label>
            <span><i>".getRespuesta($avance->descripcion)."</i></span>
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

function estado(){
    $clas='Descargar Archivo';
    $res=$clas." <img src=../../images/icons/basicset/download.png title=\"Descargar Archivo\" width='25px' height='25px' />";
    return $res;
};
      	function obtener_directorios($ruta){
            if (is_dir($ruta)){
			// Abre un gestor de directorios para la ruta indicada
			$gestor = opendir($ruta);
			// Recorre todos los elementos del directorio
			while ($archivo = readdir($gestor))  {
				// Se muestran todos los archivos y carpetas excepto "." y ".."
				if ($archivo != "." && $archivo != "..") {
					// Si es un directorio se recorre recursivamente
                                    $archi[]= $archivo;		
				}
			}
			// Cierra el gestor de directorios
			closedir($gestor);
            		} else {
			$archi[]="No Subieron Archivos para este Avance";
		}
		return $archi;
	};
  function getRespuesta($descripcion)
  {
    $resumen = $descripcion;
    $resumen   = htmlspecialchars_decode( $resumen );
    return $resumen;
  };
exit;

?>