<?php
try {
    define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php");  
  
  leerClase('Evaluacion');
  leerClase('Docente');
  leerClase("Dicta");
  
  /** HEADER */
  $smarty->assign('title','Gesti&oacute;n de Evaluaciones');
  $smarty->assign('description','Formulario de Gesti&oacute;n de Evaluaciones');
  $smarty->assign('keywords','Gestion,Evaluacion,Estudiantes,Inscritos');

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
  $docenteid     = getSessionDocente();
  if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) && $docenteid->getDictaverifica($_GET['iddicta']))
  {
     $iddicta                = $_GET['iddicta'];
  }  else {
        header("Location: ../index.php");
  }
  $dicta = new Dicta($iddicta);
  
   /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Asignaturas');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.materias.php','name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.proyecto-final.php?iddicta='.$iddicta,'name'=>$dicta->getNombreMateria());
  $menuList[]     = array('url'=>URL.Docente::URL.'evaluacion/estudiante.evaluacion-editar.php?iddicta='.$iddicta,'name'=>'Evaluacion de Estudiantes');
  $menuList[]     = array('url'=>URL.Docente::URL.'evaluacion/evaluacion.estudiante-cvs.php?iddicta='.$iddicta,'name'=>'Evaluacion de Estudiantes por CSV');
  $smarty->assign("menuList", $menuList);

    function estainscrito($sis) {
      $cond=0;
    $sql = "SELECT *
    FROM inscrito it, estudiante es
    WHERE it.estudiante_id=es.id
    AND es.codigo_sis='$sis'";
    $result = mysql_query($sql);
    if (mysql_num_rows($result)){
        $cond=1;
    };
    return $cond;
    };
   function busquedaeva($sis) {
      $cond='';
    $sql = "SELECT *
    FROM inscrito it, estudiante es
    WHERE it.estudiante_id=es.id
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
 function esvacio($val){
     if($val!=null){
         if($val>0 && $val<=100){
             $res=$val;
         }else{
         $res=0;             
         }
     }else{
     $res=0;    
     }
     return $res;
 }
  $inscritos=array();
  $noestudiante=array();
  $sql="
        SELECT ev.id as id, es.codigo_sis as codigo
FROM docente dt, dicta di, estudiante es, inscrito it, evaluacion ev
WHERE di.docente_id=dt.id
AND di.id=it.dicta_id
AND it.estudiante_id=es.id
AND it.evaluacion_id=ev.id
AND dt.id=$docenteid->id
AND di.id=$iddicta    
        ";
         $resultado = mysql_query($sql);
 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) {
   $arrayestudiantes[]=$fila;
  }

  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar'  && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    $aux      = str_replace(array("\r\n", "\r", "\n"), '#CODIGOX#', trim($_POST['cvs'])); 
    $estudiantes = explode('#CODIGOX#', $aux);
    if (count($estudiantes)>=1)
          foreach ($estudiantes as $estudiante_array) {
            $ins=0;
        $estudiante_array = explode(';', $estudiante_array);
        if (count($estudiante_array)>=1 && is_numeric($estudiante_array[1]) )
        {
                  for($i=0;$i<count($arrayestudiantes);$i++){
                      if($estudiante_array[1]==$arrayestudiantes[$i]['codigo']){
                  $evaluacion = new Evaluacion($arrayestudiantes[$i]['id']); 
                  $evaluacion->objBuidFromPost();
                  $evaluacion->evaluacion_1=esvacio($estudiante_array[3]);
                  $evaluacion->evaluacion_2=esvacio($estudiante_array[4]);
                  $evaluacion->evaluacion_3=esvacio($estudiante_array[5]);
                  $evaluacion->save();
                  $inscritos[]=$estudiante_array;
                  $ins=1;
                  $i=count($arrayestudiantes);
                    }
                  }
                  if($ins==0)
                  $noestudiante[]=$estudiante_array;
        }
      }
      $inscritos=array_envia($inscritos);
      $noestudiante=array_envia($noestudiante);
      $url="evaluacion.estudiante-cvs-lista.php?iddicta=$iddicta&inscritos=$inscritos&noestudiante=$noestudiante";
            $ir = "Location: $url";
      header($ir);
  }
  $columnacentro = 'docente/evaluacion/columna.centro.evaluacion.estudiante-cvs.tpl';
  $smarty->assign('columnacentro',$columnacentro);
  //No hay ERROR
  $smarty->assign("ERROR",'');
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$token                = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token',$token);

$TEMPLATE_TOSHOW = 'docente/docente.3columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>