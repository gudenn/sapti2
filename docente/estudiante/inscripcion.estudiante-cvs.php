<?php
try {
    define ("MODULO", "DOCENTE");
  require('../_start.php');
  if(!isDocenteSession())
    header("Location: ../login.php");  
    
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
  $docente     = getSessionDocente();
  if ( isset($_GET['iddicta']) && is_numeric($_GET['iddicta']) && $docente->getDictaverifica($_GET['iddicta']))
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
  $menuList[]     = array('url'=>URL.Docente::URL.'estudiante/inscripcion.estudiante-cvs.php?iddicta='.$iddicta,'name'=>'Inscripci&oacute;n Estudiantes');
  $smarty->assign("menuList", $menuList);
  
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
  $total=0;
  
  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar'  && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
    mysql_query("BEGIN");
    $estudiantes=array();
		$filename=$_FILES["file"]["tmp_name"];
		 if($_FILES["file"]["size"] > 0)
		 {
		  	$file = fopen($filename, "r");
	         while (($estudiante = fgetcsv($file, 10000, ",")) !== FALSE){
                     $estudiantes[]=implode($estudiante);
	         }
	         fclose($file);
                 }
    $estudiantesaux=$estudiantes;
    $total=count($estudiantes);

    if (count($estudiantes)>=1){
      foreach ($estudiantes as $estudiante_array) {
        $estudiante_array = explode(';', $estudiante_array);

        if (count($estudiante_array)>=2)
        {
          $estudiante = new Estudiante();
          $estudiante->getByCodigoSis($estudiante_array[1]);
            if ($estudiante->id){
                $usuario=new Usuario($estudiante->usuario_id);
                if(estainscrito($estudiante_array[1], $iddicta)=='0'){
                    $estudiante->inscribirEstudianteDicta($semestre->id, $iddicta);
                    $proyid=$estudiante->getProyecto();
                    $proyid->asignarDictaest($iddicta);
                    $proyid->save();
                    $inscritos[]=array('codigosis'=>$estudiante->codigo_sis,'nombre'=>$usuario->apellido_paterno.' '.$usuario->apellido_materno.' '.$usuario->nombre);
                    }else{
                    $yainscritos[]=array('codigosis'=>$estudiante->codigo_sis,'nombre'=>$usuario->apellido_paterno.' '.$usuario->apellido_materno.' '.$usuario->nombre);
                    }
            }else{
                        $usuario = new Usuario();
                        $usuario->parserNombreApellidos(trim($estudiante_array[2])); //Nombres y apellidos
                        $usuario->estado    = Objectbase::STATUS_AC;
                        $usuario->login     = trim($estudiante_array[1]);            //codigo sis
                        $usuario->clave     = trim($estudiante_array[1]); 
                        $usuario->titulo_honorifico= Estudiante::TITULOHONORIFICO;
                        $usuario->email=isset($estudiante_array[3])?trim($estudiante_array[2]):'';
                        $usuario->save();

                        //usuario pertenece a un grupo
                        $usuario->asignarGrupo(Grupo::GR_ES);

                        $estudiante->estado     = Objectbase::STATUS_AC;
                        $estudiante->codigo_sis = trim($estudiante_array[1]);
                        $estudiante->usuario_id = $usuario->id;
                        $estudiante->save();

                          $materia = new Materia($dicta->materia_id);
                          $estudiante->crearProyectoInicial($iddicta, $materia->tipo);
                          $estudiante->inscribirEstudianteDicta($semestre->id, $iddicta);
               $noestudiante[]=array('codigosis'=>$estudiante->codigo_sis,'nombre'=>$usuario->apellido_paterno.' '.$usuario->apellido_materno.' '.$usuario->nombre);
                 }
        }else{
            $errorestudiante[]=array('linea'=>trim($estudiante_array[0]));
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
                      $est=new Estudiante($borrarins->estudiante_id);
                      $borrarins->borrarInscrito();
                      $us=new Usuario($est->usuario_id);
                      $borradoestudiante[]=array('codigosis'=>$est->codigo_sis,'nombre'=>$us->apellido_paterno.' '.$us->apellido_materno.' '.$us->nombre);
                  }
                  }
      }

    }
      $yainscritos=array_envia($yainscritos);
      $inscritos=array_envia($inscritos);
      $noestudiante=array_envia($noestudiante);
      $errorestudiante=array_envia($errorestudiante);
      $borradoestudiante=array_envia($borradoestudiante);
      $url="inscripcion.estudiante-cvs-lista.php?iddicta=$iddicta&yainscritos=$yainscritos&inscritos=$inscritos&noestudiante=$noestudiante&errorestudiante=$errorestudiante&borradoestudiante=$borradoestudiante&total=$total";
            $ir = "Location: $url";
      header($ir);
      mysql_query("COMMIT");
  }
  $columnacentro = 'docente/estudiante/columna.centro.inscripcion.estudiante-cvs.tpl';
  $smarty->assign('columnacentro',$columnacentro);
  $smarty->assign('iddicta',$iddicta);
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