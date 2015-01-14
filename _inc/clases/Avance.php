<?php
/**
 * Esta clase es para guardar los avances hechos por el estudiante
 *
 * @author Guyen Campero <guyencu@gmail.com>
 */
class Avance extends Objectbase
{
  /** constant to add in the begin of the key to find the date values   */
  const BASEDIRECTORIO = "avance";

  /** constantes para los valores del estado de la avance
   * estado 1 ceado (CR), estado 2 visto por el tutor (VI), estado 3 aprobado por el tutor (AP)
   */
  const E1_CREADO     = "CR";
  const E2_VISTO      = "VI";
  const E2_CORREGIDO  = "CO";
  const E3_APROBADO   = "AP";
  
  
 /**
  * Codigo identificador del Objeto Proyecto
  * @var INT(11)
  */
  var $proyecto_id;


 /**
  * Fecha de registro de avance
  * @var DATE
  */
  var $fecha_avance;

 /**
  * Direcotio donde seran guardados los archivos
  * @var VARCHAR(45)
  */
  var $directorio;

 /**
  * Detalle de avance
  * @var TEXT
  */
  var $descripcion;

 /**
  * Porcentaje de avance
  * @var TEXT
  */
  var $porcentaje;

 /**
  * Estado de avance con respecto de
  * estado 1 creado (CR), estado 2 visto por el tutor (VI), estado 3 aprobado por el tutor (AP)
  * @var TEXT
  */
  var $estado_avance;


 /**
  * (Objeto simple) Todas las Revisioness que tiene este avance
  * @var Revision|null 
  */
  var $revision_objs;  

 /**
  * (Objeto simple) Si esta ligado con algun objetivo especifico
  * @var Avance_objetivo_especifico|null 
  */
  var $avance_objetivo_especifico_objs;  
  
  
  function asignarDirectorio() 
  {
    if (!$this->directorio)
      $this->directorio = Avance::BASEDIRECTORIO.time();
    $_SESSION['avancedirectorio'] = $this->directorio;
    return;
  }


  function getEstadoAvance($estado_avance = '') 
  {
    $estado   = $this->estado_avance;
    if ( trim($estado_avance) != '' )
      $estado = $estado_avance;
    //estado 1 creado (CR), estado 2 visto por el tutor (VI), estado 3 aprobado por el tutor (AP)
    switch ($estado) {
      case self::E1_CREADO:
        $estado = 'Nuevo';
        break;
      case self::E2_VISTO:
        $estado = 'Revisando';
        break;
      case self::E3_APROBADO:
        $estado = 'Aprobado';
        break;
      default:
        $estado = 'Nuevo';
        break;
        break;
    }
    return $estado;
  }

  function getDescripcion($descripcion = '')
  {
    $resumen   = $this->descripcion;
    if ( trim($descripcion) != '' )
      $resumen = $descripcion;
    $resumen   = htmlspecialchars_decode( $resumen );
    return $resumen;
  }

  function getResumen($descripcion = '' , $length = '70') 
  {
    $resumen   = $this->descripcion;
    if ( trim($descripcion) != '' )
      $resumen = $descripcion;
    $resumen   = cortar( trim( strip_tags( htmlspecialchars_decode( $resumen ) ) ) , $length);
    return $resumen;
  }


  function iniciarFiltro(&$filtro) 
  {
    
    if (isset($_GET['order']))
      $filtro->order($_GET['order']);

    $filtro->nombres[] = 'Estado';
    $filtro->valores[] = array ('select','estado'  ,$filtro->filtro('estado'),
        array(''      ,'CR'    ,'VI'    ),
        array('Todos' ,'Nuevos','Vistos'));
    $filtro->nombres[] = 'Descripci&oacute;n';
    $filtro->valores[] = array ('input' ,'descripcion',$filtro->filtro('descripcion'));

  }

  function getOrderString(&$filtro) 
  {
    $order_array                        = array();
    $order_array['id']                  = " {$this->getTableName ()}.id ";
    $order_array['proyecto_id']         = " {$this->getTableName ()}.proyecto_id ";
    $order_array['fecha_avance']        = " {$this->getTableName ()}.fecha_avance ";
    $order_array['estado']              = " {$this->getTableName ()}.estado ";
    return $filtro->getOrderString($order_array);
  }
  public function filtrar(&$filtro)
  {
    parent::filtrar($filtro);
    $filtro_sql = '';
    return $filtro_sql;
  }
  
  function getDirectorioAvance($codigo_sis,$formatourl = true) 
  {
    leerClase('Estudiante');
    leerClase('Proyecto');
    $proyecto = new Proyecto($this->proyecto_id);
    if ($formatourl)
      $archivo  = URL.Estudiante::ARCHIVO_PATH.Proyecto::ARCHIVO_PATH.'/'.$codigo_sis.'/'.$proyecto->getFolder().'/'.$this->directorio.'/';
    else
      $archivo  = PATH.Estudiante::ARCHIVO_PATH.Proyecto::ARCHIVO_PATH.'/'.$codigo_sis.'/'.$proyecto->getFolder().'/'.$this->directorio.'/';
    return $archivo;
  }
    function getDirectorioAvancedir($codigo_sis,$formatourl = true) 
  {
    leerClase('Estudiante');
    leerClase('Proyecto');
    $proyecto = new Proyecto($this->proyecto_id);
    if ($formatourl)
      $archivo  = Estudiante::ARCHIVO_PATH.Proyecto::ARCHIVO_PATH.'/'.$codigo_sis.'/'.$proyecto->getFolder().'/'.$this->directorio.'/';
    else
      $archivo  = Estudiante::ARCHIVO_PATH.Proyecto::ARCHIVO_PATH.'/'.$codigo_sis.'/'.$proyecto->getFolder().'/'.$this->directorio.'/';
    return $archivo;
  }
     /**
   Cambiar estado de Avances a Corregidos
   */
  function cambiarEstadoVisto() {
    $visto = self::E2_VISTO;
    $sql = " UPDATE  `{$this->getTableName()}` SET `estado_avance` = '$visto' WHERE id='$this->id'";
    $result = mysql_query($sql);
    if (!$result)
      return false;
  }
    function cambiarEstadoCorregido() {
    $corregido = self::E2_CORREGIDO;
    $sql = " UPDATE  `{$this->getTableName()}` SET `estado_avance` = '$corregido' WHERE id='$this->id'";
    $result = mysql_query($sql);
    if (!$result)
      return false;
  }
    /**
   muestra array con estudiante_id
   */
  function getEstudiante() {
  $buscar = " SELECT av.id as avaid, pe.estudiante_id as estuid
FROM avance av, proyecto pr, proyecto_estudiante pe
WHERE av.proyecto_id=pr.id
AND pe.proyecto_id=pr.id
AND av.id='$this->id'";
   $sqlbus = mysql_query($buscar);
while ($fila1b = mysql_fetch_array($sqlbus, MYSQL_ASSOC)) {
   $arraybus=$fila1b['estuid'];
 }
  return $arraybus;
    }
}
