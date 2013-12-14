<?php     
define ("MODULO", "REPORTE");
require  '../_start.php';
include '../../_inc/_configurar.php';      
require_once('EditableGrid.php');

       
// Database connection
$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);
$mysqli->real_connect(DBHOST,DBUSER,BDPASS,BDNAME); 
                    
// create a new EditableGrid object
$grid = new EditableGrid();

$grid->addColumn('id', 'ID', 'integer', NULL, false);
$grid->addColumn('nombre', 'NOMBRES', 'string', NULL, false);  
$grid->addColumn('apellidos', 'APELLIDOS', 'string', NULL, false);
$grid->addColumn('titulo', 'TITULO', 'string', NULL, false);
$grid->addColumn('codigo', 'GESTION', 'html', NULL, false);
$fechahoy=  date('Y-m-d');
$result = $mysqli->query('SELECT p.id,u.nombre,s.codigo,CONCAT(apellido_paterno,apellido_materno) as apellidos ,p.nombre as titulo
    FROM  usuario u,estudiante e,inscrito i ,semestre s,proyecto p,proyecto_estudiante pe,vigencia v
    WHERE u.id=e.usuario_id AND e.id=i.estudiante_id AND i.semestre_id=s.id AND e.id=pe.estudiante_id AND pe.proyecto_id=p.id and p.tipo_proyecto="PR" and p.estado_proyecto="IN" AND p.estado="AC" AND p.id=v.proyecto_id AND ("'.$fechahoy.'">=v.fecha_fin)');

$mysqli->close();

$grid->renderXML($result);

?>