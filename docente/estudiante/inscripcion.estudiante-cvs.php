<?php
try {
    define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: login.php");  
    
  leerClase('Estudiante');
  leerClase('Usuario');
  leerClase('Inscrito');
  leerClase('Evaluacion');
  leerClase('Proyecto_dicta');
  leerClase('Proyecto');
  leerClase('Docente');
  leerClase('Dicta');
  leerClase('Materia');
  leerClase('Semestre');
  
  /** HEADER */
  $smarty->assign('title','SAPTI - Inscripcion de Estudiantes');
  $smarty->assign('description','Formulario de Inscripcion de Estudiantes');
  $smarty->assign('keywords','SAPTI,Estudiantes,Inscripcion');

  //CSS
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
     // Agregan el css
  $CSS[]  = URL_JS . "calendar/css/eventCalendar.css";
  $CSS[]  = URL_JS . "calendar/css/eventCalendar_theme.css";
  $CSS[]  = URL_CSS . "dashboard.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";

  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";
  $JS[]  = URL_JS . "calendar/js/jquery.eventCalendar.js";
  $smarty->assign('JS',$JS);
  
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Materias');
  $menuList[]     = array('url'=>URL.Docente::URL.'index.proyecto-final.php','name'=>'Proyecto Final');
  $menuList[]     = array('url'=>URL.Docente::URL.'estudiante/'.basename(__FILE__),'name'=>'Inscripcion Estudiantes');
  $smarty->assign("menuList", $menuList);
  
  if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) )
  {
     $iddicta = $_GET['iddicta'];
  }else{
      $iddicta=$_SESSION['iddictapro'];
  }
  $dicta = new Dicta($iddicta);
  $semestre=new Semestre();
  $semestre->getActivo();
  
    $docmaterias = "SELECT ma.nombre as materia, cg.nombre as grupo
FROM dicta di, materia ma, codigo_grupo as cg
WHERE di.materia_id=ma.id
AND di.codigo_grupo_id=cg.id
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
    if (mysql_num_rows($result)>0){
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
    $estudiantesaux=$estudiantes;
    if (count($estudiantes)>=1)
      foreach ($estudiantes as $estudiante_array) {
        $estudiante_array = explode(';', $estudiante_array);
        if (count($estudiante_array)>=1 && is_numeric($estudiante_array[1]) )
        {
                  $estudiante = new Estudiante();
          $estudiante->getByCodigoSis($estudiante_array[1]);
            if ($estudiante->id){
                if(estainscrito($estudiante_array[1], $iddicta)=='0'){
                    $estudiante->inscribirEstudianteDicta($semestre->id, $iddicta);
                    $proyid=$estudiante->getProyecto();
                    $proyecto       = new Proyecto($proyid->proyecto_id);
                    $proyecto->asignarDictaest($iddicta);
                    $proyecto->save();
                    $inscritos[]=$estudiante_array;
                    }else{
                    $yainscritos[]=$estudiante_array;
                    }
            }else{
                        $usuario = new Usuario();
                        $usuario->objBuidFromPost();
                        $estudiante->objBuidFromPost();
                        $usuario->parserNombreApellidos($estudiante_array[2]); //Nombres y apellidos
                        $usuario->estado    = Objectbase::STATUS_AC;
                        $usuario->login     = $estudiante_array[1];            //codigo sis
                        $usuario->clave     = $estudiante_array[1]; 
                        $usuario->estado = Objectbase::STATUS_AC;
                        $usuario->save();

                        //usuario pertenece a un grupo
                        $usuario->asignarGrupo(Grupo::GR_ES);

                        $estudiante->estado     = Objectbase::STATUS_AC;
                        $estudiante->codigo_sis = $estudiante_array[1];
                        $estudiante->usuario_id = $usuario->id;
                        $estudiante->save();

                          $materia = new Materia($dicta->materia_id);
                          $estudiante->crearProyectoInicial($iddicta, $materia->tipo);
                          $estudiante->inscribirEstudianteDicta($semestre->id, $iddicta);
               $noestudiante[]=$estudiante_array;
                 }
        }
      }
      if (isset($_POST['listaoficial'])) 
        $listaoficial=$_POST['listaoficial'];
        $smarty->assign("listaoficial", $listaoficial);

      if($listaoficial[0]=="borrar"){
              $listainscritos = "SELECT it.id as id, es.codigo_sis as sis
                    FROM inscrito it, estudiante es
                    WHERE it.estudiante_id=es.id
                    AND it.dicta_id='$iddicta'
                    AND it.semestre_id='$semestre->id'";
                  $resultins = mysql_query($listainscritos);
                  while ($rowins = mysql_fetch_array($resultins, MYSQL_ASSOC)) {
                       $listainsactu[] = $rowins;
                  }
                 if(count($listainsactu)>0 && count($listainsactu)>count($estudiantesaux)){
                  foreach ($estudiantesaux as $estaux) {
                     $estaux = explode(';', $estaux);
                     $listainsactu=array_values($listainsactu);
                      for ($i=0; $i<=count($listainsactu); $i++){
                          if ($estaux[1]==$listainsactu[$i]['sis']){
                              unset($listainsactu[$i]);
                          }  
                      }
                  }
                  foreach ($listainsactu as $ins){
                      $borrarins=new Inscrito($ins['id']);
                      $borrarins->borrarInscrito();
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