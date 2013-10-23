<?php
try {
    define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: login.php"); 

  leerClase("Estudiante");
  leerClase('Docente');
  leerClase('Usuario');
  leerClase('Avance');
  leerClase('Revision');
  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Lista de Estudiantes');
  $smarty->assign('description','Pagina de Lista de Incritos');
  $smarty->assign('keywords','Gestion,Estudiantes');

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_CSS . "editablegrid.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "tablaeditable/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "tablaeditable/tabla.estudiante.lista.js";
  $smarty->assign('JS',$JS);
  
   /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.proyecto-final.php','name'=>'Proyecto Final');
  $menuList[]     = array('url'=>URL.Docente::URL.'estudiante/'.basename(__FILE__),'name'=>'Lista de Correcciones');
  $smarty->assign("menuList", $menuList);
  
  if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) )
  {
     $iddicta = $_GET['iddicta'];
  }else{
      $iddicta=$_SESSION['iddictaproyectofinal'];
  }
  if (isset($_GET['id_estudiante'])) 
  $id_estudiante=$_GET['id_estudiante'];
  
  $docente=  getSessionDocente();
  $estudiante     = new Estudiante($id_estudiante);
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();

    	function obtener_directorios($ruta){
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
		return $archi;
	}

  $avance   = new Avance(2);
  $revision   = new Revision();
  $dir='../../'.$avance->getDirectorioAvancedir(201001201);
  $archivosruta=obtener_directorios($dir);
  $smarty->assign("archivosruta", $archivosruta);
  $smarty->assign("dir", $dir);
  $smarty->assign("avance", $avance);
  $smarty->assign("revision", $revision);
  $smarty->assign("estudiante", $estudiante);
  $smarty->assign("usuario", $usuario);
  $smarty->assign("proyecto", $proyecto);
  $smarty->assign("iddicta", $iddicta);

  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('docente/revision/full-width.revision.detalle.tpl');
?>