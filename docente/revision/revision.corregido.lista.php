<?php
try {
    define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php"); 

  leerClase("Estudiante");
  leerClase('Docente');
  leerClase('Usuario');
  leerClase('Avance');
  leerClase('Revision');
  leerClase('Dicta');
  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Lista de Correcciones');
  $smarty->assign('description','Lista de Correcciones realizadas el Proyecto');
  $smarty->assign('keywords','Gestion,Estudiantes,correcciones,revisiones');

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_CSS . "editablegrid.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "tablaeditable/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "tablaeditable/tabla.estudiante.lista.js";
  $smarty->assign('JS',$JS);
  $docente     = getSessionDocente();
  if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) && $docente->getDictaverifica($_GET['iddicta']))
  {
     $iddicta                = $_GET['iddicta'];
  }  else {
        header("Location: ../index.php");
  }
    if( isset($_GET['estudiente_id']) && is_numeric($_GET['estudiente_id']) ){
       $id_estudiante=$_GET['estudiente_id'];
  }  else {
      header("Location: ../index.php");
  }
  $dicta = new Dicta($iddicta);
  
   /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.proyecto-final.php?iddicta='.$iddicta,'name'=>$dicta->getNombreMateria());
  $menuList[]     = array('url'=>URL.Docente::URL.'estudiante/estudiante.lista.php?iddicta='.$iddicta,'name'=>'Estudiantes Inscritos');
  $menuList[]     = array('url'=>URL.Docente::URL.'revision/revision.corregido.lista.php?iddicta='.$iddicta.'&estudiente_id='.$id_estudiante,'name'=>'Lista de Correcciones');
  $smarty->assign("menuList", $menuList);
  
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
AND re.revisor_tipo='DP' OR re.revisor_tipo='DO'
AND re.revisor='".$docente->usuario_id."'
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