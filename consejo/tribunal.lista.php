<?php
try {
   define ("MODULO", "CONSEJO");

  require('_start.php');
 if(!isConsejoSession())
  header("Location: login.php"); 
//  if(!isAdminSession())
//    header("Location: login.php");

  leerClase("Evento");
  leerClase("Pagination");

  $ERROR = '';

  /** HEADER */
  $smarty->assign('title','Lista de Estudiantes');
  $smarty->assign('description','Pagina de Lista de Incritos');
  $smarty->assign('keywords','Gestion,Estudiantes');

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $smarty->assign('JS',$JS);

  $docente=  getSessionDocente();
  $docenteid=$docente->id;
      $sql="SELECT es.id as 'id', us.nombre as 'nombre', us.apellido_paterno as 'apellidos', pr.nombre as 'nombrep', pr.id as 'id_pr', it.evaluacion_id as 'eva'
      FROM docente dt, dicta di, estudiante es, usuario us, inscrito it, proyecto pr, proyecto_estudiante pe
      WHERE dt.id=5
      AND di.docente_id=dt.id 
      AND di.id=it.dicta_id
      AND it.estudiante_id=es.id
      AND es.usuario_id=us.id
      AND pe.estudiante_id=es.id
      AND pe.proyecto_id=pr.id";
 $resultado = mysql_query($sql);
 $arraylista= array();
 
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) {
   $arraylista[]=$fila;
 }
  $smarty->assign('arraylista'  , $arraylista);
  $smarty->assign('mascara'     ,'docente/tribunal/listas.mascara.tpl');
  $smarty->assign('lista'       ,'docente/tribunal/tribunal.lista.tpl');
  
  $objs_pg    = new Pagination($resultado, 'g_docente','',false,100);
  $smarty->assign("objs"     ,$arraylista);
  $smarty->assign("pages"    ,$objs_pg->p_pages);

  leerClase("Automatico");
  $automatico=new Automatico();
  $automatico->objBuidFromPost();
//LISTA DOCENTES
  $sqldoc="SELECT DISTINCT ap.docente_id AS iddoc
 FROM apoyo ap";
 $resultadodoc = mysql_query($sqldoc);
 while ($filadoc = mysql_fetch_array($resultadodoc, MYSQL_ASSOC)) {
   $arraylistadoc[]=$filadoc;
 }
 //ID DE AREA DEL PROYECTO
 $idareaproyecto=1;
 $maxvalor=100;
   if(count($arraylistadoc)>0){
       //LLENADO DE AREAS CON VALORES
 $arraylistaarea[]=array('idarea' => $idareaproyecto, 'valor' => $maxvalor);
  $sqlarea="SELECT DISTINCT apoyo.area_id AS idarea
FROM apoyo
WHERE NOT EXISTS(
SELECT DISTINCT area.id
FROM area
WHERE apoyo.area_id=".$idareaproyecto."
)";
 $resultadoarea = mysql_query($sqlarea);
 while ($filaarea = mysql_fetch_array($resultadoarea, MYSQL_ASSOC)) {
   $arraylistaarea[]=array('idarea' =>$filaarea['idarea'], 'valor' =>$maxvalor-1);
   $maxvalor--;
 }
 foreach ($arraylistaarea as $valuearea) {
       $sqldocarea="SELECT apoyo.docente_id as iddoc FROM apoyo WHERE apoyo.area_id=".$valuearea['idarea']."";
 $resultadodocarea = mysql_query($sqldocarea);
 while ($filadocarea = mysql_fetch_array($resultadodocarea, MYSQL_ASSOC)) {
   $arraylistadocarea[]=$filadocarea;
 }
    foreach ($arraylistadocarea as $valuedocarea)
      {
        $valor_turno1=0;
        $valor_turno2=0;
        $valor_turno3=0;
        $valor_turno4=0;
        $valor_turno5=0;
        $valor_turno6=0;
        $sqldocturno="SELECT hd.dia_id as dia, hd.turno_id as turno
        FROM horario_doc hd
        WHERE hd.docente_id=".$valuedocarea['iddoc']."
        ORDER BY dia ASC";
        $resultadodocturno = mysql_query($sqldocturno);
        while ($filadocturno = mysql_fetch_array($resultadodocturno, MYSQL_ASSOC)) {
        $arraylistadocturno[]=$filadocturno;
        }

            foreach ($arraylistadocturno as $valuedocturno) 
              {
                
                switch ($valuedocturno['dia']){
                    case 1:
                           $valor_turno1=$valor_turno1+$valuedocturno['turno']*30;
                    break;
                    case 2: 
                           $valor_turno2=$valor_turno2+$valuedocturno['turno']*30;
                    break;
                    case 3:
                           $valor_turno3=$valor_turno3+$valuedocturno['turno']*30;
                    break;
                    case 4:
                           $valor_turno4=$valor_turno4+$valuedocturno['turno']*30;
                    break;
                    case 5:
                           $valor_turno5=$valor_turno5+$valuedocturno['turno']*30;
                    break;
                    case 6:
                           $valor_turno6=$valor_turno6+$valuedocturno['turno']*30;
                    break;
                    default:
                    
                }
            }
            for($i=0; $i<6;$i++){
              $valturno='$valor_turno' ;
                $automatico=new Automatico();
                $automatico->objBuidFromPost();
                $automatico->docente_id=$valuedocarea['iddoc'];
                $automatico->area_id=$valuearea['idarea'];
                $automatico->valor_area=$valuearea['valor'];            
                $automatico->dia=$valuedocturno['dia'];
                $automatico->valor_tiempo=$valor_turno;
                $automatico->save();
                echo 'olas';
              
            }

        
    }
 }
   }
 
 
  
  
  


  //No hay ERROR
  $smarty->assign("ERROR",'');
  $smarty->assign("URL",URL);  

}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

if (isset($_GET['tlista']) && $_GET['tlista']) //recargamos la tabla central
  $smarty->display('docente/tribunal/listas.lista.tpl'); 
else
  $smarty->display('docente/tribunal/full-width.lista.tpl');


?>