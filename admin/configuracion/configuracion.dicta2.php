<?php     

require_once('../../docente/config.php');      
require_once('../../docente/EditableGrid.php');

// Database connection
$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);
$mysqli->real_connect($config['db_host'],$config['db_user'],$config['db_password'],$config['db_name']); 
                    
// create a new EditableGrid object
$grid = new EditableGrid();

$grid->addColumn('id', 'ID', 'integer', NULL, false); 
$grid->addColumn('semestre', 'Semestre', 'string', NULL, false);
$grid->addColumn('nombre', 'Docente', 'string', NULL, false);
$grid->addColumn('materia', 'Materia', 'string', NULL, false);
$grid->addColumn('grupo', 'Grupo', 'string', NULL, false);
$grid->addColumn('action', 'Borrar', 'html', NULL, false);

$result = $mysqli->query('
SELECT di.id as id, se.codigo as semestre, CONCAT(us.apellido_paterno, us.apellido_materno, us.nombre) as nombre, ma.nombre as materia, di.codigo_grupo as grupo
FROM dicta di, docente dc, usuario us, materia ma, semestre se
WHERE di.docente_id=dc.id
AND dc.usuario_id=us.id
AND di.materia_id=ma.id
AND di.semestre_id=se.id
AND se.activo=1
ORDER BY ma.nombre, di.codigo_grupo');

$mysqli->close();

$grid->renderXML($result);

?>