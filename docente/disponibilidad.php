<?php
try {
  require('_start.php');
    if(!isDocenteSession())
    header("Location: login.php"); 
  global $PAISBOX;

  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

    $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";


  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";

  $smarty->assign('JS',$JS);
  leerClase("Horario_doc");
  leerClase("Docente");
  
  $docente     =  getSessionDocente();
  $docente_ids =  $docente->id;

  echo $docente_ids;
  
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Docente');
  $menuList[]     = array('url'=>URL.Docente::URL.basename(__FILE__),'name'=>'Tiempo');
  $smarty->assign("menuList", $menuList);  
  
$horario_doc= new Horario_doc();
 $sqldocente="select  d.id
from usuario u , docente d
where u.id= d.usuario_id and u.estado='AC' and d.estado='AC' and u.id=$docente_ids;";
 $resultadodocente= mysql_query($sqldocente);
$idocente=0;
 while ($filadocente = mysql_fetch_array($resultadodocente)) 
 {
   $idocente=$filadocente['id'];
    
 }
  

 if ( isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' )
  {     
      $horario_doc->objBuidFromPost();
      $horario_doc->estado = Objectbase::STATUS_AC;
      $horario_doc->docente_id= $idocente;
      $horario_doc->save();
      
         
 }

  
   if (isset($_GET['eliminar']) && isset($_GET['horario_id']) && is_numeric($_GET['horario_id']) )
  {
    $horarioborrar = new Horario_doc($_GET['horario_id']);
    $horarioborrar->delete();
  }

  

  
/////////////cargando los dias de la semana///////////
  $sqldia="SELECT DISTINCT(dia.id), dia.nombre
FROM dia, turno
WHERE NOT EXISTS (
SELECT *
FROM turno tu, horario_doc hd, dia d
WHERE hd.docente_id=$idocente
AND tu.id=hd.turno_id
AND d.id=hd.dia_id
AND dia.nombre=d.nombre
AND turno.nombre=tu.nombre
);";
 $resultadodia = mysql_query($sqldia);
 $diaid= array();
  $dianombre= array();
 
 while ($filadia = mysql_fetch_array($resultadodia)) 
                {
    $diaid[]=$filadia['id'];
    $dianombre[]=$filadia['nombre'];
 }
$smarty->assign('diaid'  , $diaid);
$smarty->assign('dianombre'  , $dianombre);
 
$sql="select DISTINCT(hd.id), d.nombre as nombredia, t.nombre as nombreturno
from turno t , dia d , horario_doc hd
where hd.turno_id= t.id and d.id=hd.dia_id and hd.docente_id=".$idocente.";";
 $resultado = mysql_query($sql);
 $listadias= array();
 
 while ($fila = mysql_fetch_array($resultado)) 
                {
    $listadias[]=$fila;
 }
$smarty->assign('listadias'  , $listadias);
$smarty->assign('iddocente'  , $idocente);



    
  $smarty->assign("ERROR", $ERROR);
  

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$columnacentro = 'docente/disponibilidad.tpl';
$smarty->assign('columnacentro',$columnacentro);



$TEMPLATE_TOSHOW = 'docente/docente.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>




