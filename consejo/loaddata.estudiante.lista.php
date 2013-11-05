<?php     
define ("MODULO", "DOCENTE");
require  '_start.php';
include '../_inc/_configurar.php';      
require_once('../docente/EditableGrid.php');
         
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
  select DISTINCT (es.id), es.codigo_sis as codigosis , u.nombre as nombre, CONCAT(u.apellido_paterno,   u.apellido_materno) apellidos, p.nombre as nombrep
  from proyecto p , usuario u, estudiante es , proyecto_estudiante pe, tribunal t
  where  u.id=es.usuario_id and  es.id=pe.estudiante_id and  pe.proyecto_id=p.id and p.id=t.proyecto_id');
$mysqli->close();

$grid->renderXML($result);

?>