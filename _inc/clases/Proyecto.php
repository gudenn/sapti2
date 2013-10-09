<?php

/**
 * Esta clase es para guardar los datos tipo Estudiante
 *
 * @author Guyen Campero <guyencu@gmail.com>
 */
class Proyecto extends Objectbase {
  /** constant to add in the begin of the key to find the date values   */

  const URL = "proyecto-final/";
  /** constant to add in the begin of the key to find the date values   */
  const ARCHIVO_PATH = "archivo";
  /** constant to add in the begin of the key to find the date values   */
  const ARCHIVO_PREFOLDER = "proyecto_";
  /** constant to add in the begin of the key to find the date values   */
  const ARCHIVO_CORRECIONES = "/CORRECIONES";

  /** Constante para el tipo de trabajo en grupo o en conjunto  */
  const TRABAJO_CONJUNTO_SI = "TC";
  /** Constante para el tipo de trabajo solo */
  const TRABAJO_CONJUNTO_NO = "TS";

  /** Constante para el tipo de proyecto si es perfil o proyecto final */
  /** Tipo perfil (PE) */
  const TIPO_PERFIL = "PE";
  /** Tipo Proyecto (PR) */
  const TIPO_PROYECTO = "PR";

  /**
   * Estado Proyecto 
   * Iniciado (IN)
   */
  const EST1_INI = "IN";

  /**
   * Estado Proyecto 
   * Visto Bueno de Docente, Tutores y Revisores (VB)
   */
  const EST2_BUE = "VB";
  
   

  /**
   * Estado Proyecto 
   * tribunales Visto Bueno (TV)
   */
  const EST3_TRI = "TV";

  /**
   * Estado Proyecto 
   * con defensa (LD)
   */
  const EST4_DEF = "LD";
  /**
   * Estado Proyecto 
   * Frormulario Perfil Pendiente
   */
  const EST5_P = "PD";
  
   /**
   * Estado Proyecto 
   * Frormulario Perfil Confirmaddo
   */
  const EST6_C = "CO";

  /**
   * Codigo iden de la modalidad
   * @var INT(11)
   */
  var $modalidad_id;

  /**
   * Codigo iden de la carrera
   * @var INT(11)
   */
  var $carrera_id;

  /**
   * Codigo iden de la Institucion
   * @var INT(11)
   */
  var $institucion_id;

  /**
   * Nombre del proyecto
   * @var VARCHAR(300)
   */
  var $nombre;

  /**
   * Numero asignado al proyecto
   * @var VARCHAR(45)
   */
  var $numero_asignado;

  /**
   * Objetivo General del proyecto
   * @var TEXT
   */
  var $objetivo_general;

  /**
   * descripcion del proyecto
   * @var TEXT
   */
  var $descripcion;

  /**
   * Si es trabajo conjunto (TC) o no (TS) consultar constantes de esta  clase
   * @var VARCHAR(2)
   */
  var $trabajo_conjunto;

  /**
   * director_carrera que aprobo el inicio del proyecto
   * @var VARCHAR(300)
   */
  var $director_carrera;

  /**
   * docente_materia que aprobo el inicio del proyecto
   * @var VARCHAR(300)
   */
  var $docente_materia;

  /**
   * Fecha que se aprobo el inicio del proyecto
   * @var VARCHAR(300)
   */
  var $fecha_registro;

  /**
   * Quien registro el proyecto
   * @var VARCHAR(300)
   */
  var $registrado_por;

  /**
   * Quien es reponsable por el proyecto en caso de adcripcion o trabajo dirigido
   * @var VARCHAR(300)
   */
  var $responsable;

  /**
   * Si un estudiante tiene muchos proyectos pasados o ha hecho muchos cambios 
   * esta variable senialara ($proyecto->es_actual en el proyecto)
   * si es que este proyecto es el proyecto actual del estudiante o no
   * @var BOOLEAN
   */
  var $es_actual;

  /**
   * El tipo de proyecto si es perfil o proyecto final
   * Tipo perfil (PE), tipo Proyecto Final (PR)
   * @var VARCHAR(2)
   */
  var $tipo_proyecto;

  /**
   * Iniciado (IN), Visto Bueno de Docente, Tutores y Revisores (VB) , 
   * TRibunales asignados (TA), tribunales Visto Bueno (TV), con defensa (LD)
   * @var VARCHAR(2)
   */
  var $estado_proyecto;

  /**
   * (Objeto simple)  Todos los Objetivos Especificos del proyecto
   * @var object|null 
   */
  var $objetivo_especifico_objs;

  /**
   * (Objeto simple) todas las reviciones que tiene este proyecto
   * @var object|null 
   */
  var $revision_objs;

  /**
   * (Objeto simple) Todos los proyecto_estudiante que tiene este proyecto
   * @var object|null 
   */
  var $proyecto_estudiante_objs;

  /**
   * (Objeto simple) Todos los proyecto_docente que tiene este proyecto
   * @var object|null 
   */
  var $proyecto_dicta_objs;

  /**
   * (Objeto simple) Todos los proyecto_tutor que tiene este proyecto
   * @var object|null 
   */
  var $proyecto_tutor_objs;

  /**
   * (Objeto simple) Todos los proyecto_revisor que tiene este proyecto
   * @var object|null 
   */
  var $proyecto_revisor_objs;

  /**
   * (Objeto simple) Todos los tribunales que tiene este proyecto
   * @var object|null 
   */
  var $tribunal_objs;

  /**
   * (Objeto simple) Todas las areas asignadas a este proyecto
   * @var object|null 
   */
  var $proyecto_area_objs;

  /**
   * (Objeto simple) Todas las subareas asignadas a este proyecto
   * @var object|null 
   */
  var $proyecto_sub_area_objs;

  /**
   * 
   * @param string $codigo_sis el codigo_sis
   * @param type $verSiEstaDisponible para solo verificar si es que se puede usar este email
   * @return boolean
   * @throws Exception 
   */
  function getProyectoAprobados() {
    //@TODO revisar
    //leerClase('Proyecto_area');
    leerClase('Area');

    $activo = Objectbase::STATUS_AC;
    $sql = "select p.* from " . $this->getTableName('Proyecto_estudiante') . " as pe , " . $this->getTableName('Proyecto') . " as p   where pe.estudiante_id = '$this->id' and pe.proyecto_id = p.id and pe.estado = '$activo' and p.estado = '$activo'  ";

    //$sql = "select a.* from ".$this->getTableName('Proyecto_area')." as pa , ".$this->getTableName('Area')." as a   where pa.proyecto_id = '$this->id' and pa.area_id = a.id and pa.estado = '$activo' and a.estado = '$activo'  ";
//echo $sql;
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $proyecto = mysql_fetch_array($resultado);
    $proyecto = new Proyecto($proyecto);
    return $proyecto;
  }

  function getProyectoAsignados() {
    //leerClase('Proyecto');
    $activo = Objectbase::STATUS_AC;
    // $sql = "select p.* from ".$this->getTableName('Proyecto_estudiante')." as pe , ".$this->getTableName('Proyecto')." as p   where pe.estudiante_id = '$this->id' and pe.proyecto_id = p.id and pe.estado = '$activo' and p.estado = '$activo'  ";

    $sql = "select p.* from " . $this->getTableName('Proyecto_estudiante') . " as pe , " . $this->getTableName('Proyecto') . " as p   where pe.estudiante_id = '$this->id' and pe.proyecto_id = p.id and pe.estado = '$activo' and p.estado = '$activo'  ";

//echo $sql;
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $proyecto = mysql_fetch_array($resultado);
    var_dump($proyecto);
    $proyecto = new Proyecto($proyecto);
    return $proyecto;
  }

  function getFolder() {
    return self::ARCHIVO_PREFOLDER . $this->id;
  }

  /**
   * Creamos un proyecto inicial de tal manera que los estudiantes nunca estnen sin proyectos
   */
  function crearProyectoInicial($estudiante_id , $dicta_id,$tipo, $grabar = true) {
    $this->estado_proyecto = Proyecto::EST1_INI;
    $this->es_actual       = 1;
    $this->tipo_proyecto   = $tipo;
    $this->estado          = Objectbase::STATUS_AC;
    if ($grabar)
      $this->save();
    $this->asignarEstudiante($estudiante_id);
    $this->asignarDicta($dicta_id);
    
    if ($grabar)
      $this->saveAllSonObjects(TRUE);
  }

  function getArea() {
    //@TODO revisar
    //  leerClase('Proyecto_area');
    leerClase('Area');
    $areas = array();
    $activo = Objectbase::STATUS_AC;
    $sql = "select a.* from " . $this->getTableName('Proyecto_area') . " as pa , " . $this->getTableName('Area') . " as a   where pa.proyecto_id = '$this->id' and pa.area_id = a.id and pa.estado = '$activo' and a.estado = '$activo'";
 /**
    $sql = "SELECT a.*
from  proyecto_area  pa ,area a
where pa.area_id=a.id  and pa.proyecto_id='$this->id' and pa.estado='AC'  and a.estado='AC';";
  
  */
    $resultado = mysql_query($sql);
  // var_dump(mysql_fetch_array($resultado, MYSQL_ASSOC));
    if (!$resultado)
      return false;
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) {
      $areas[] = new Area($fila);
    }
    return $areas;
  }

  /**
   * Asignamos Estudiante
   * @param INT(11) $estudiante_id codigo del estudiante
   */
  function asignarEstudiante($estudiante_id) {
    leerClase('Estudiante');
    leerClase('Proyecto_estudiante');
    //$estudiante = new Estudiante($estudiante_id);

    $asignado                         = new Proyecto_estudiante($estudiante_id);
    $asignado->proyecto_id            = $this->id;
    $asignado->estudiante_id          = $estudiante_id;
    $asignado->estado                 = Objectbase::STATUS_AC;
    $asignado->fecha_asignacion       = date('d/m/Y');
    $this->proyecto_estudiante_objs[] = $asignado;
  }

  /**
   * Asignamos A Dicta
   * @param INT(11) $dicta_id codigo de grupo asignado
   */
  function asignarDicta($dicta_id) {
    leerClase('Proyecto_dicta');
    //$estudiante = new Estudiante($estudiante_id);

    $asignado                         = new Proyecto_dicta();
    $asignado->proyecto_id            = $this->id;
    $asignado->dicta_id               = $dicta_id;
    $asignado->estado                 = Objectbase::STATUS_AC;
    $this->proyecto_dicta_objs[]      = $asignado;
  }

  /**
   * Asignamos Estudiante
   * @param INT(11) $estudiante_id codigo del estudiante
   */
  function asignarAreaSubArea($area_id, $subarea_id) {
    if (!$area_id || !$subarea_id)
      return false;
    leerClase('Proyecto_area');
    leerClase('Proyecto_sub_area');
    // Area
    $p_area = new Proyecto_area();
    $p_area->area_id = $area_id;
    $p_area->estado = Objectbase::STATUS_AC;
    $this->proyecto_area_objs[] = $p_area;

    //Subarea
    $ps_area = new Proyecto_sub_area($subarea_id);
    $ps_area->sub_area_id = $subarea_id;
    $ps_area->estado = Objectbase::STATUS_AC;
    $this->proyecto_sub_area_objs[] = $ps_area;
  }

  /**
   * Validamos proyecto
   */
  function validar() {
    leerClase('Formulario');
    Formulario::validar('proyecto_nombre', $this->nombre, 'texto', 'El Nombre');
    Formulario::validar('proyecto_objetivo_general', $this->objetivo_general, 'texto', 'El Objetivo General');
    Formulario::validar('proyecto_descripcion', $this->descripcion, 'texto', 'La descripci&oacute;n del Proyecto');
    Formulario::validar('proyecto_director_carrera', $this->director_carrera, 'texto', 'El Nombre de Director de Carrera');
    Formulario::validar('proyecto_docente_materia', $this->docente_materia, 'texto', 'El Nombre del Docente de la Materia');
    Formulario::validar('proyecto_responsable', $this->docente_materia, 'texto', 'El Nombre del Responsable del Proyecto', TRUE);

    leerClase('Semestre');
    $semestre = new Semestre('', TRUE);
    // Por lo menos un area y una sub area
    if (sizeof($this->proyecto_area_objs) < $semestre->getValor('Minimo numero de areas asignadas al proyecto', 1))
      throw new Exception("?proyecto_area_id_1&m=No Asigno el <b>m&iacute;nimo n&uacute;mero de &Aacute;rea(s)</b> requerido para un Proyecto.");
    if (sizeof($this->proyecto_sub_area_objs) < $semestre->getValor('Minimo numero de sub areas', 1))
      throw new Exception("?proyecto_subarea_id_1&m=No Asigno el <b>m&iacute;nimo n&uacute;mero de sub &Aacute;rea</b> requerido para un Proyecto.");
    if (sizeof($this->objetivo_especifico_objs) < $semestre->getValor('Minimo de objetivos especificos', 2))
      throw new Exception("?objetivo_especifico_1&m=No cumple la cantidad de Objetivos Espec&iacute;ficos M&iacute;nimo para un Proyecto.");
    //
  }

  /**
   * 
   * @return boolean|\Estudiante
   * retorna el estudiante del proyectto
   */
  function getEstudiante() {

    //@TODO revisar
    leerClase('Estudiante');

    $activo = Objectbase::STATUS_AC;
    $sql = "select e.* from " . $this->getTableName('Proyecto_estudiante') . " as pe , " . $this->getTableName('Estudiante') . " as e   where pe.proyecto_id = '$this->id' and pe.estudiante_id = e.id and pe.estado = '$activo' and e.estado = '$activo' ";
    $resultados = mysql_query($sql);
    if (!$resultados)
      return false;
    $estudiantes = mysql_fetch_array($resultados);
    $estudiante = new Estudiante($estudiantes);
    return $estudiante;
  }
  /**
   * 
   * @param type $docente
   * @param type $idproyecto
   * @return boolean|\Estudiante
   * retorna un tribunal del proyecto dado el docente_id , proyecto_id 
   */
   function getTribunal($docente,$idproyecto) 
  {
    //@TODO revisar
    //leerClase('Estudiante');
    //
     /**
      * select  t.`id`
  from  `proyecto` p, `tribunal` t
where  p.`id`=t.`proyecto_id` and p.`id`=1 and t.`docente_id`=1;
      */
    leerClase('Tribunal');
    $activo = Objectbase::STATUS_AC;
    $sql = "select t.* from " . $this->getTableName('Tribunal') . " as t  where t.proyecto_id = '$this->id' and t.docente_id='$docente' and t.estado = '$activo' and  '$idproyecto'='$this->id'  and '$this->estado' = '$activo' ";
    $resultados= mysql_query($sql);
    if (!$resultados)
      return false;
    $estudiantes= mysql_fetch_array($resultados);
    $estudiante = new Tribunal($estudiantes);
    return $estudiante;
  }

  /**
   * Consultamos el estado del tutor
   * @param type $tutor_id
   */
  function getTutores($estado_tutoria = '') {
    leerClase('Tutor');
    leerClase('Proyecto_tutor');

    if ($estado_tutoria == '')
      $estado_tutoria = Proyecto_tutor::ACEPTADO;

    $activo = Objectbase::STATUS_AC;

    $sql = "select * from " . $this->getTableName('Proyecto_tutor') . " where proyecto_id = '$this->id' and estado_tutoria = '$estado_tutoria' AND estado = '$activo'";
    //echo $sql;
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $tutores = array();
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) {
      $tutores[] = new Tutor($fila['tutor_id']);
    }
    return $tutores;

  }

  /**
   * Consultamos el estado del tutor
   * @param type $tutor_id
   */
  function consultarEstadoTutor($tutor_id) {
    leerClase('Tutor');
    $tutor = new Tutor($tutor_id);

    $proyecto_tutor = $tutor->esTutorEnProyecto($this);
    if (!$proyecto_tutor)
      return Proyecto_tutor::FINALIZADO;
    return $proyecto_tutor->estado_tutoria;
  }

  /**
   * 
   * @return
   * retorna la vigencia del proyecto
   */
  function getVigencia() {
    //@TODO revisar
    //  leerClase('Proyecto_area');
    leerClase('Vigencia');

   $vigencias = array();

     $vigencias = array();

    $activo = Objectbase::STATUS_AC;
    $sql = "select v.* from " . $this->getTableName('Vigencia') . " as v    where v.proyecto_id = '$this->id' and v.estado = '$activo'";
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) {
      $vigencias[] = new Vigencia($fila);
    }
    return $vigencias;
  }
  
  /**
   * 
   * @return
   * retorna los Vistos buenos Docentes
   */
  
  function getVbDocente() {
    //@TODO revisar
    //  leerClase('Proyecto_area');
    leerClase('Visto_bueno');
     $vistos= array();
     $d=  Visto_bueno::E1_DOCENTE;
    
    $activo = Objectbase::STATUS_AC;
    $sql = "select v.* from " . $this->getTableName('Visto_bueno') . " as v    where v.proyecto_id = '$this->id' and v.visto_bueno_tipo='$d' and v.estado = '$activo'";
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) {
      $vistos[] = new Visto_bueno($fila);
    }
    return $vistos;
  }
  
  
  /**
   * 
   * @return
   * Retorna la Visto Bueno  del Tutor
   */
 function getVbTutor() {
    //@TODO revisar
    //  leerClase('Proyecto_area');
    leerClase('Visto_bueno');
     $vistos= array();
     $d= Visto_bueno::E2_TUTOR;
    
    $activo = Objectbase::STATUS_AC;
    $sql = "select v.* from " . $this->getTableName('Visto_bueno') . " as v    where v.proyecto_id = '$this->id' and v.visto_bueno_tipo='$d' and v.estado = '$activo'";
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) {
      $vistos[] = new Visto_bueno($fila);
    }
    return $vistos;
  }
  
  
  /**
   * 
   * @return
   * Retorna la Visto Bueno  del Tutor
   */
 function getVbTribunal() {
    //@TODO revisar
    //  leerClase('Proyecto_area');
    leerClase('Visto_bueno');
     $vistos= array();
     $d= Visto_bueno::E3_TRIBUNAL;
    
    $activo = Objectbase::STATUS_AC;
    $sql = "select v.* from " . $this->getTableName('Visto_bueno') . " as v    where v.proyecto_id = '$this->id' and v.visto_bueno_tipo='$d' and v.estado = '$activo'";
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) {
      $vistos[] = new Visto_bueno($fila);
    }
    return $vistos;
  }

   

  /**
   * 
   * @return boolean|\Area
   * retorna los vistos buenos del proyecto
   */
  
  function getTutoress()
  {
    //@TODO revisar
    //  leerClase('Proyecto_area');
    leerClase('Tutor');
    $tutores= array();
    $activo = Objectbase::STATUS_AC;
    $sql = "select t.* from " . $this->getTableName('Tutor') . " as t , " . $this->getTableName('Usuario') . " as u , " . $this->getTableName('Proyecto_tutor') . " as pt  where u.id =t.usuario_id  and t.id=pt.tutor_id and pt.proyecto_id ='$this->id' and u.estado = '$activo' and t.estado = '$activo'  ";
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
      { 
        $tutores[] =new Tutor($fila);
      }
       return $tutores;
  }
  /**
   * 
   * @return 
   * retorna la cantidad de tribunales
   */
  
    function getTribunales()
  {
    
    $total= 0;
    $activo = Objectbase::STATUS_AC;
    $sql = "select t.* from " . $this->getTableName('Tribunal') . " as t   where t.proyecto_id ='$this->id' and t.estado = '$activo'  ";
    $resultado = mysql_query($sql);
    if (!$resultado)
      return $total;
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
      { 
        $total=$total+1;
      }
       return $total;
  }
  /**
   * 
   * @return boolean
   * retur
   */
 function getTotalVB()
  {
    
    $totalvb= 0;
    $activo = Objectbase::STATUS_AC;
    $sql = "select v.* from " . $this->getTableName('Visto_bueno') . " as v   where v.proyecto_id ='$this->id'  and v.	visto_bueno_tipo='TR' and v.estado = '$activo'  ";
    $resultado = mysql_query($sql);
    if (!$resultado)
      return  $totalvb;
    while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
      { 
         $totalvb= $totalvb+1;
      }
       return  $totalvb;
  }
}

?>