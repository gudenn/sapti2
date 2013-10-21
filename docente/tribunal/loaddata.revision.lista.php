<?php     
define ("MODULO", "DOCENTE");
require  '../_start.php';
include '../../_inc/_configurar.php';      
require_once('../EditableGrid.php');

if(isset($_GET['doc'])){
$estuid=$_GET['doc'];
};
         
// Database connection
$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);
$mysqli->real_connect(DBHOST,DBUSER,BDPASS,BDNAME);
                    
// create a new EditableGrid object
$grid = new EditableGrid();

$grid->addColumn('id', 'ID', 'integer', NULL, false); 
$grid->addColumn('tipo', 'Tipo', 'string', NULL, false);
$grid->addColumn('revtipo', 'Revisor', 'string', NULL, false);
$grid->addColumn('fecha', 'Fecha Creacion', 'string', NULL, false);
$grid->addColumn('estado', 'Estado', 'html', NULL, false);
$grid->addColumn('correccion', 'Fecha Correccion', 'string', NULL, false);
$grid->addColumn('num', 'Nº Observaciones', 'string', NULL, false);
$grid->addColumn('action', 'Opciones', 'html', NULL, false);

$result = $mysqli->query('
SELECT re.id as id, re.estado as tipo, re.revisor_tipo as revtipo, re.fecha_revision as fecha, COUNT(ob.revision_id) as num, re.estado_revision as estado, re.fecha_aprobacion as correccion
FROM proyecto pr, revision re, observacion ob, proyecto_estudiante pe
WHERE pr.id=pe.proyecto_id
AND pe.estudiante_id="'.$estuid.'"
AND re.proyecto_id=pr.id
AND re.id=ob.revision_id
GROUP BY ob.revision_id
UNION
SELECT av.id as id, av.estado_avance as tipo, re.revisor_tipo as revtipo, av.fecha_avance as fecha, av.descripcion as num, av.estado_avance as estado, re.fecha_correccion as correccion
FROM proyecto pr, avance av, revision re, proyecto_estudiante pe
WHERE pr.id=pe.proyecto_id
AND pe.estudiante_id="'.$estuid.'"
AND av.proyecto_id=pr.id
AND av.revision_id=re.id
UNION
SELECT av.id as id, av.revision_id as tipo, av.revision_id as revtipo, av.fecha_avance as fecha, av.descripcion as num, av.estado_avance as estado, av.fecha_avance as correccion
FROM proyecto pr, avance av, proyecto_estudiante pe
WHERE pr.id=pe.proyecto_id
AND pe.estudiante_id="'.$estuid.'"
AND av.revision_id=0
AND av.proyecto_id=pr.id
');
$mysqli->close();

$grid->renderXML($result);

?>