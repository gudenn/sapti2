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
  $smarty->assign('description','P&aacute;gina de Lista de Incritos');
  $smarty->assign('keywords','Gestion,Estudiantes');

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_CSS . "editablegrid.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "tablaeditable/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "tablaeditabletribunal/tabla.estudiante.lista.js";
  $smarty->assign('JS',$JS);
  
   /**
   * Menu superior
   */
   $menuList[]     = array('url'=>URL.Docente::URL.'tribunal','name'=>'Tribunal');
   $menuList[]     = array('url'=>URL.Docente::URL.'tribunal/estudiante.lista.php','name'=>'Lista Estudiante');
   $smarty->assign("menuList", $menuList);
   
  if ( isset($_SESSION['iddictapro']) && is_numeric($_SESSION['iddictapro']) ){
      $iddicta=$_SESSION['iddictapro'];
  }
  if( isset($_SESSION['pro_estudiente_id']) && is_numeric($_SESSION['pro_estudiente_id']) ){
       $id_estudiante=$_SESSION['pro_estudiente_id'];
  }
  
  $docente=  getSessionDocente();
  $estudiante     = new Estudiante($id_estudiante);
  $usuario        = $estudiante->getUsuario();
  $proyecto       = $estudiante->getProyecto();

  $resul = "
SELECT av.id as id, pr.nombre as nombrep, av.descripcion as descripcion, av.fecha_avance as fecha, av.revision_id as correcionrevision, av.estado_avance as estoavance
FROM proyecto pr, avance av, revision re
WHERE av.proyecto_id=pr.id
AND av.revision_id=re.id
AND re.estado_revision='RE'
AND av.proyecto_id='".$proyecto->id."'
AND re.revisor_tipo='DO'
AND re.revisor='".$docente->id."'
ORDER BY av.fecha_avance
          ";
   $sql = mysql_query($resul);
while ($fila1 = mysql_fetch_array($sql, MYSQL_ASSOC)) {
   $avances[]=$fila1;
 }
  $avance   = new Avance();
  $revision   = new Revision();

  $smarty->assign("avance", $avance);
  $smarty->assign("revision", $revision);
  $smarty->assign("avances", $avances);
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
  $smarty->display('docente/revision/full-width.revision.corregido.lista.tpl');
?>