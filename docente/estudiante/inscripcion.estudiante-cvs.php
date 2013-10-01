<?php
try {
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: login.php");  
    
  leerClase('Estudiante');
  leerClase('Inscrito');
  leerClase('Evaluacion');
  leerClase('Proyecto_docente');
  
  /** HEADER */
  $smarty->assign('title','SAPTI - Inscripcion de Estudiantes');
  $smarty->assign('description','Formulario de Inscripcion de Estudiantes');
  $smarty->assign('keywords','SAPTI,Estudiantes,Inscripcion');

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";

  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";
  $smarty->assign('JS',$JS);
  
      if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) )
  {
     $iddicta = $_GET['iddicta'];
  }
  
    $docmaterias = "SELECT ma.nombre as materia, di.grupo as grupo
FROM dicta di, materia ma
WHERE di.materia_id=ma.id
AND di.id='$iddicta'";
  $resultmate = mysql_query($docmaterias);
  while ($row2 = mysql_fetch_array($resultmate, MYSQL_ASSOC)) {
       $materiagrupo[] = $row2;
 }

 $smarty->assign('materiagrupo',$materiagrupo);
    function estainscrito($sis,$idd) {
      $cond=0;
    $sql = "SELECT *
FROM inscrito it, estudiante es
WHERE it.estudiante_id=es.id
AND it.dicta_id='$idd'
AND es.codigo_sis='$sis'";
    $result = mysql_query($sql);
    if (mysql_num_rows($result)){
        $cond=1;
    };
    return $cond;
  };
  function array_envia($url_array) 
           {
               $tmp = serialize($url_array);
               $tmp = urlencode($tmp);
           
               return $tmp;
           };
  function array_recibe($url_array) { 
     $tmp = stripslashes($url_array); 
     $tmp = urldecode($tmp); 
     $tmp = unserialize($tmp); 

    return $tmp; 
  };

  $inscritos=array();
  $yainscritos=array();
  $noestudiante=array();
  
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar'  && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    mysql_query("BEGIN");
    $aux      = str_replace(array("\r\n", "\r", "\n"), '#CODIGOX#', trim($_POST['cvs'])); 
    $estudiantes = explode('#CODIGOX#', $aux);
    if (count($estudiantes)>=1)
      foreach ($estudiantes as $estudiante_array) {
        $estudiante_array = explode(';', $estudiante_array);
        if (count($estudiante_array)>=1 && is_numeric($estudiante_array[1]) )
        {

                  $estudiante = new Estudiante();
                  $inscrito   = new Inscrito();
                  $evaluacion = new Evaluacion();
                  $proyecto_dicta = new Proyecto_dicta();
          $estudiante->getByCodigoSis($estudiante_array[1]);
            if ($estudiante->id){
                if(estainscrito($estudiante_array[1], $iddicta)=='0'){
                    $evaluacion->estado= Objectbase::STATUS_AC;
                    $evaluacion->evaluacion_1=0;
                    $evaluacion->evaluacion_2=0;
                    $evaluacion->evaluacion_3=0;
                    $evaluacion->save();
                    $inscrito->evaluacion_id = $evaluacion->id;
                    $inscrito->estado        = Objectbase::STATUS_AC;
                    $inscrito->dicta_id      = $iddicta;
                    $inscrito->estudiante_id = $estudiante->id;
                    $inscrito->save();
                    $proyecto_dicta->estado= Objectbase::STATUS_AC;
                    $proyecto_dicta->dicta_id = $iddicta;
                    $proyecto       = $estudiante->getProyecto();
                    $proyecto_dicta->proyecto_id = $proyecto->proyecto_id;
                    $inscritos[]=$estudiante_array;
                    }else{
                    $yainscritos[]=$estudiante_array;
                    }
            }else{
               $noestudiante[]=$estudiante_array;
                 }
        }
      }
      $yainscritos=array_envia($yainscritos);
      $inscritos=array_envia($inscritos);
      $noestudiante=array_envia($noestudiante);
      $url="inscripcion.estudiante-cvs-lista.php?yainscritos=$yainscritos&inscritos=$inscritos&noestudiante=$noestudiante";
            $ir = "Location: $url";
      header($ir);
      mysql_query("COMMIT");
  }
  $columnacentro = 'docente/estudiante/columna.centro.inscripcion.estudiante-cvs.tpl';
  $smarty->assign('columnacentro',$columnacentro);
  //No hay ERROR
  $smarty->assign("ERROR",'');
} 
catch(Exception $e) 
{
  mysql_query("ROLLBACK");
  $smarty->assign("ERROR", handleError($e));
}

$token                = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token',$token);

$TEMPLATE_TOSHOW = 'docente/docente.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>