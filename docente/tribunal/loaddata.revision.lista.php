<?php     
   define ("MODULO", "DOCENTE");
require  '../_start.php';
include '../_inc/_configurar.php';  
require_once('../docente/EditableGrid.php');

if(isset($_GET['doc'])){
$proyecto=$_GET['doc'];
};
         
// Database connection
$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);
$mysqli->real_connect(DBHOST,DBUSER,BDPASS,BDNAME); 
                    
// create a new EditableGrid object
$grid = new EditableGrid();

$grid->addColumn('id', 'ID', 'integer', NULL, false); 
$grid->addColumn('nombrep', 'Nombre Proyecto', 'string', NULL, false);
$grid->addColumn('revtipo', 'Revisor', 'string', NULL, false);
$grid->addColumn('fecha', 'Fecha Revision', 'string', NULL, false);
$grid->addColumn('num', 'Nº Observaciones', 'integer', NULL, false);
$grid->addColumn('action', 'Opciones', 'html', NULL, false);

$result = $mysqli->query('
    SELECT re.id as id, pr.nombre as nombrep, re.revisor_tipo as revtipo, re.fecha_revision as fecha, COUNT(ob.revision_id) as num
FROM proyecto pr, revision re, observacion ob
WHERE pr.id="'.$proyecto.'"
AND re.proyecto_id=pr.id
AND re.id=ob.revision_id
GROUP BY ob.revision_id
');
$mysqli->close();

$grid->renderXML($result);

?>