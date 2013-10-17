<?php     
 define ("MODULO", "DOCENTE");
require  '../../_start.php';
require '../../../_inc/_configurar.php';
require('../../EditableGrid.php');
if(isset($_GET['doc'])){
$docid=$_GET['doc'];
};
//echo $docid;
leerClase('Docente');
// Database connection
$mysqli = mysqli_init();
$mysqli->options(MYSQLI_OPT_CONNECT_TIMEOUT, 5);    
$mysqli->real_connect(DBHOST,DBUSER,BDPASS,BDNAME); 
                    
$usuarioensesion=  getSessionUser();
    

// create a new EditableGrid object
$grid = new EditableGrid();

$grid->addColumn('id', 'ID', 'integer', NULL, false); 
$grid->addColumn('codigosis', 'Codigo Sis', 'integer', NULL, false); 
$grid->addColumn('nombre', 'Nombres', 'string', NULL, false);  
$grid->addColumn('apellidos', 'Apellidos', 'string', NULL, false);
$grid->addColumn('nombrep', 'Nombre Proyecto', 'string', NULL, false);
$grid->addColumn('action', 'Opciones', 'html', NULL, false);

$result = $mysqli->query('select p.id as id, e.codigo_sis as codigosis, u.nombre, CONCAT(u.apellido_paterno , u.apellido_materno) as apellidos, p.nombre  as nombrep
from   usuario  u,  estudiante  e ,proyecto_estudiante  pe ,  proyecto p , proyecto_tutor pt , tutor  t
where  u.id=e.usuario_id  and e.id=pe.estudiante_id  and pe.proyecto_id=p.id
and p.id=pt.proyecto_id and pt.tutor_id=t.id  and pt.estado_tutoria="PE"  and t.usuario_id=4');
$mysqli->close();


$grid->renderXML($result);

//echo $result[0];
?>