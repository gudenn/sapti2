<?php     

require_once('config.php');      
require_once('EditableGrid.php');

if(isset($_GET['doc'])){
$docid=$_GET['doc'];
};
         
// Database connection
$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);
$mysqli->real_connect($config['db_host'],$config['db_user'],$config['db_password'],$config['db_name']); 
                    
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
AND pe.proyecto_id=pr.id
AND di.id="'.$docid.'"
');
$mysqli->close();

$grid->renderXML($result);

?>