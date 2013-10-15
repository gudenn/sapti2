<?php     
define ("MODULO", "DOCENTE");
require  '../_start.php';
include '../../_inc/_configurar.php';      
require_once('../EditableGrid.php');

if(isset($_GET['iddicta'])){
$iddicta=$_GET['iddicta'];
};
         
// Database connection
$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);
$mysqli->real_connect(DBHOST,DBUSER,BDPASS,BDNAME); 
                    
// create a new EditableGrid object
$grid = new EditableGrid();

$grid->addColumn('id', 'ID', 'integer', NULL, false); 
$grid->addColumn('codigosis', 'Codigo Sis', 'string', NULL, false); 
$grid->addColumn('nombre', 'Nombres', 'string', NULL, false);  
$grid->addColumn('apellidos', 'Apellidos', 'string', NULL, false);
$grid->addColumn('nombrep', 'Nombre Proyecto', 'string', NULL, false);
$grid->addColumn('action', 'Opciones', 'html', NULL, false);

$result = $mysqli->query('
     SELECT es.id as id, es.codigo_sis as codigosis, us.nombre as nombre, CONCAT(us.apellido_paterno,us.apellido_materno) as apellidos, pr.nombre as nombrep
FROM dicta di, estudiante es, usuario us, inscrito it, proyecto pr, proyecto_estudiante pe
WHERE di.id=it.dicta_id
AND it.estudiante_id=es.id
AND es.usuario_id=us.id
AND pe.estudiante_id=es.id
and pr.tipo_proyecto="PE"
AND pe.proyecto_id=pr.id
AND di.id="'.$iddicta.'"');

$mysqli->close();

$grid->renderXML($result);

?>