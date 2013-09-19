<?php     
include '_start.php';
include '../_inc/_configurar.php';
//require_once('config.php');      
require_once('../docente/EditableGrid.php');
if(isset($_GET['doc'])){
$docid=$_GET['doc'];
};
/**
 public function conectar($selecionar_la_db = true) {
		$this->enlace = mysql_connect(DBHOST,DBUSER,BDPASS);
		if (!$this->enlace)
			throw new Exception('Could not connect: ' . mysql_error());
		if (!$selecionar_la_db)
			return true;
		$this->db = mysql_select_db(BDNAME,$this->enlace);
		if (!$this->db)
			throw new Exception('Can\'t use the db: ' . mysql_error());
		//echo 'Connected successfully';
		return true;
	}
 
 */


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

$result = $mysqli->query('select DISTINCT (e.id), e.codigo_sis, u.nombre as nombre, CONCAT(u.apellido_paterno,u.apellido_materno) apellidos, p.`nombre` as nombreproyecto
from  usuario u , estudiante e, proyecto_estudiante pe, proyecto p, tribunal  t, docente  d
where   u.id=e.usuario_id and e.id=pe.estudiante_id and pe.proyecto_id=p.id and p.id=t.proyecto_id and t.docente_id = d.id and d.id=3;');
$mysqli->close();


$grid->renderXML($result);

//echo $result[0];
?>