<?php
try {
    define ("MODULO", "DOCENTE");
  require('../_start.php');

    if(!isDocenteSession())
    header("Location: ../login.php"); 
    
  leerClase("Docente");
  leerClase("Evaluacion");
  leerClase("Dicta");
  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Gestion de Observaciones');
  $smarty->assign('description','Pagina de gestion de Observaciones');
  $smarty->assign('keywords','Gestion,Observaciones');

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_CSS . "editablegrid.css";
  $CSS[]  = URL_JS . "ventanasmodales/simplemodaldetalle.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "tablaeditable/editablegrid-2.0.1.js";
  $JS[]  = URL_JS . "tablaeditable/tabla.editable.evaluacion.js";
  $JS[]  = URL_JS . "ventanasmodales/historial.notas.js";
  $JS[]  = URL_JS . "ventanasmodales/jquery.simplemodal-1.4.4.js";
  $smarty->assign('JS',$JS);
  if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) )
  {
     $iddicta                = $_GET['iddicta'];
  }  else {
        header("Location: ../index.php");
  }
  $dicta = new Dicta($iddicta);
   /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.proyecto-final.php?iddicta='.$iddicta,'name'=>$dicta->getNombreMateria());
  $menuList[]     = array('url'=>URL.Docente::URL.'evaluacion/estudiante.evaluacion-editar.php?iddicta='.$iddicta,'name'=>'Evaluacion de Estudiantes');
  $smarty->assign("menuList", $menuList);
  
  function promedio($promedio){
    $est='';
    if($promedio >='51'){
        $est='APRO';
    }else{
        if($promedio =='0'){
        $est='ABA';    
        }  else {
            $est='REPRO';
        }
    }
    return $est;
        };
  function array_envia($url_array) 
           {
               $tmp = serialize($url_array);
               $tmp = urlencode($tmp);
           
               return $tmp;
           };
  $resul = "
      SELECT ev.id as id
FROM dicta di, estudiante es, usuario us, inscrito it, proyecto pr, proyecto_estudiante pe, evaluacion ev
WHERE di.id=it.dicta_id
AND it.estudiante_id=es.id
AND es.usuario_id=us.id
AND pe.estudiante_id=es.id
AND pe.proyecto_id=pr.id
AND it.evaluacion_id=ev.id
AND di.id='".$iddicta."' 
          ";
   $sql = mysql_query($resul);
   if(mysql_num_rows($sql)>0){
while ($fila1 = mysql_fetch_array($sql, MYSQL_ASSOC)) {
   $idevaluacion[]=$fila1;
 }
     foreach ($idevaluacion as $idevaluacion_array) {
     $evaluacion = new Evaluacion($idevaluacion_array['id']);
     $evaluacion->objBuidFromPost();
     $eva1=$evaluacion->evaluacion_1;
     $eva2=$evaluacion->evaluacion_2;
     $eva3=$evaluacion->evaluacion_3;
     $promedio=  round((($eva1+$eva2+$eva3)/3));
     $evaluacion->promedio=$promedio;
     $evaluacion->rfinal=  promedio($promedio);
     $evaluacion->save();
 }
 $sqlreporte="SELECT es.codigo_sis as Codigo_Sis, CONCAT(us.apellido_paterno,' ', us.apellido_materno,' ', us.nombre) as Estudiante, pr.nombre as Nombre_Proyecto, ev.evaluacion_1 as E1, ev.evaluacion_2 as E2, ev.evaluacion_3 as E3, ev.promedio as Pro, ev.rfinal as Apro
 FROM dicta di, estudiante es, usuario us, inscrito it, proyecto pr, proyecto_estudiante pe, evaluacion ev
 WHERE di.id=it.dicta_id
 AND it.estudiante_id=es.id
 AND es.usuario_id=us.id
 AND pe.estudiante_id=es.id
 AND pe.proyecto_id=pr.id
 AND it.evaluacion_id=ev.id
 AND pr.es_actual=1
 AND di.id='".$iddicta."'";
  $sqlreporte=  array_envia($sqlreporte);
      $smarty->assign("sqlreporte", $sqlreporte);
 };
$smarty->assign("iddicta", $iddicta);
  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
$TEMPLATE_TOSHOW = 'docente/evaluacion/full-width.lista.evaluacion-editar.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>