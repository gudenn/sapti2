<?php
/**
 * Esta clase es para guardar los datos tipo Revicion
 *
 * @author Sesai Quispe <sesaiquispe@gmail.com>
 */
class Revision extends Objectbase
{
  /** constantes para los valores del estado de la revision
   * estado 1 creado (CR), estado 2 visto (VI), estado 3 respondido  (RE), estado 4 aprobado (AP)
   */
  const E1_CREADO     = "CR";
  const E2_VISTO      = "VI";
  const E3_RESPONDIDO = "RE";
  const E4_APROBADO   = "AP";
  
  /** constantes para los valores del revisor tipo
   * revisor 1 docente proyectofinal (DO), revisor 2 docente perfil (DP), revisor 3 tutor  (TU), revisor 4 tribunal (TR)
   */
  const T1_DOCENTE        = "DO";
  const T2_DOCENTEPERFIL  = "DP";
  const T3_TUTOR          = "TU";
  const T4_TRIBUNAL       = "TR";
  
    /** constantes para los valores de materia tipo
   * materia 1 proyectofinal (PR), materia 2 perfil (PE)
   */
  const T1_PROYECTOFINAL  = "PR";
  const T2_PERFIL         = "PE";
 /**
  * Codigo identificador del Objeto Proyecto
  * @var INT(11)
  */
  var $proyecto_id;

 /**
  * Codigo identificador del Avance en el Proyecto
  * @var INT(11)
  */
  var $avance_id;

   /**
  * Codigo identificador del Objeto Revisor
  * @var INT(11)
  */
  var $revisor;
  
  /**
   * docente (DO),docente perfil (DP), tutor (TU), tribunal (TR)'
   * @var VARCHAR(2)
   */
  var $revisor_tipo;

 /**
  * Fecha de la revicion
  * @var DATE
  */
  var $fecha_revision;

 /**
  * Fecha de la correccion de revicion
  * @var DATE
  */
  var $fecha_correccion;

 /**
  * Fecha de la correccion de revicion
  * @var DATE
  */
  var $fecha_aprobacion;


  /**
   * estado 1 creado (CR), estado 2 visto (VI), estado 3 respondido  (RE), estado 4 aprobado (AP)
   * @var VARCHAR(2)
   */
  var $estado_revision;

  
 /**
  * (Arreglo de objetos) Observaciones que pertenecen a una revision
  * @var object|null 
  */
  var $observacion_objs;

  /**
   * Obtiene el avance al que esa relacionado una 
   * revision
   * @param INT(11) $revision_id
   * @return Avance
   * @deprecated since version 1.01 se a causa de una modificacion 
   * en la base de datos esta funcion queda obsoleta !!!
   */
  function getAvance($revision_id = false) {
    leerClase('Avance');
    if (!$revision_id)
      $revision_id = $this->id;
    $sql        = " SELECT * FROM ".$this->getTableName('Avance')." WHERE revision_id = '$revision_id' ";
    $resultados = mysql_query($sql);
    if (!$resultados)
      return false;
    $fila = mysql_fetch_array($resultados, MYSQL_ASSOC);
    $avance = new Avance($fila);
    return $avance;
  }
 
  function getRevisor($revisor_id = false,$tipo=false,$gettipo = false) 
  {
    if (!$revisor_id)
      return "Error en los datos";
    if (!$tipo)
      $tipo = $this->revisor_tipo;
    if ($tipo == '')
      return 'Desconocido';
    switch ($tipo) {
      case 'TU':
        $clase = 'Tutor';
        break;
      case 'DO':
        $clase = 'Docente';
        break;
      case 'DP':
        $clase = 'Docente';
        break;
      case 'TR':
        $clase = 'Tribunal';
        break;
      default:
        return 'Desconocido';
        return;
        break;
    }
    if ($gettipo)
    {
      return $clase;
    }
    leerClase($clase);
    $obj = new $clase($revisor_id);
    return $obj->getNombreCompleto();

  }
  function getRevisorTipoNom($tipo=false) 
  {
    if (!$tipo)
      $tipo = $this->revisor_tipo;
    if ($tipo == '')
      return 'Desconocido';
    switch ($tipo) {
      case 'TU':
        $clase = 'Tutor';
        break;
      case 'DO':
        $clase = 'Docente';
        break;
      case 'DP':
        $clase = 'Docente';
        break;
      case 'TR':
        $clase = 'Tribunal';
        break;
      default:
        return 'Desconocido';
        return;
        break;
    }
    return $clase;

  }
  function getEstadoRevision($estado_revision = '') 
  {
    $estado   = $this->estado_revision;
    if ( trim($estado_revision) != '' )
      $estado = $estado_revision;
    //estado 1 creado (CR), estado 2 visto (VI), estado 3 respondido  (RE), estado 4 aprobado (AP)
    switch ($estado) {
      case self::E1_CREADO:
        $estado = 'Nuevo';
        break;
      case self::E2_VISTO:
        $estado = 'Visto';
        break;
      case self::E3_RESPONDIDO:
        $estado = 'Respuesta';
        break;
      case self::E4_APROBADO:
        $estado = 'Aprobado';
        break;
      default:
        $estado = 'Nuevo';
        break;
        break;
    }
    return $estado;
  }
  
  function iniciarFiltro(&$filtro) 
  {
    
    if (isset($_GET['order']))
      $filtro->order($_GET['order']);

    $filtro->nombres[] = 'Estado';
    $filtro->valores[] = array ('select','estado_revision'  ,$filtro->filtro('estado_revision'),
        array(''      ,'CR'   ,'VI'   ,'RE'          ,'AP'        ),
        //estado 1 creado (CR), estado 2 visto (VI), estado 3 respondido  (RE), estado 4 aprobado (AP)
        array('Todos' ,'Nuevo','Visto','Respondido'  ,'Aprobado' ));
    //$filtro->nombres[] = 'proyecto_id';
    //$filtro->valores[] = array ('input' ,'proyecto_id',$filtro->filtro('proyecto_id'));
    $filtro->nombres[] = 'Revisor';
    $filtro->valores[] = array ('select','revisor_tipo'  ,$filtro->filtro('revisor_tipo'),
        array(''      ,'DO'     ,'TU'   ,'IN'       ),
        array('Todos' ,'Docente','Tutor','Tribunal' ));
    $filtro->nombres[] = 'Fecha';
    $filtro->valores[] = array ('input' ,'fecha_revision',$filtro->filtro('fecha_revision'));

  }
    function getOrderString(&$filtro) 
  {
    $order_array                        = array();
    $order_array['id']                  = " {$this->getTableName ()}.id ";
    $order_array['proyecto_id']         = " {$this->getTableName ()}.proyecto_id ";
    $order_array['revisor']             = " {$this->getTableName ()}.revisor";
    $order_array['fecha_revision']      = " {$this->getTableName ()}.fecha_revision ";
    $order_array['estado']              = " {$this->getTableName ()}.estado ";
    return $filtro->getOrderString($order_array);
  }
  public function filtrar(&$filtro)
  {
    parent::filtrar($filtro);
    $filtro_sql = '';
    return $filtro_sql;
  }
      function crearRevisionDocente($usu_id, $pro_id, $tipo) 
  {
    date_default_timezone_set('America/La_Paz');
    $this->estado = Objectbase::STATUS_AC;
    $this->revisor=$usu_id;
    if($tipo==self::T1_PROYECTOFINAL){
        $this->revisor_tipo= self::T1_DOCENTE;
    }elseif ($tipo==self::T2_PERFIL) {
            $this->revisor_tipo= self::T2_DOCENTEPERFIL;
        }  else {
            $this->revisor_tipo= $tipo;
        }
    $this->estado_revision=  self::E1_CREADO;
    $this->proyecto_id=$pro_id;
    $this->fecha_revision=date("d/m/Y");
      }
   /**
   Actualizar fecha de aprobacion de revisiones
   */
  function fechaAprobacion() {
    $fecha = date("Y/m/d");
    $sql = " UPDATE  `{$this->getTableName()}` SET `fecha_aprobacion` = '$fecha' WHERE id='$this->id'";
    $result = mysql_query($sql);
    if (!$result)
      return false;
  }
       /**
   Array de observaciones no Aprobadas
   */
  function listaDesaprobados() {
      leerClase('Observacion');
    $aprobado = self::E4_APROBADO;
    $sql = " SELECT ob.* FROM ".$this->getTableName('Observacion')." as ob WHERE ob.revision_id='$this->id'
            AND not ob.estado_observacion='$aprobado'";
    $resultados = mysql_query($sql);
    if (!$resultados)
      return false;
    while ($fila = mysql_fetch_array($resultados, MYSQL_ASSOC)) {
    $obser[]=$fila['id'];
    }
      return $obser;
    }
  /**
   Array de id de todas las observaciones
   */
  function listaObservaciones() {
      leerClase('Observacion');
    $sql = " SELECT ob.* FROM ".$this->getTableName('Observacion')." as ob WHERE ob.revision_id='$this->id'";
    $resultados = mysql_query($sql);
    if (!$resultados)
      return false;
    while ($fila = mysql_fetch_array($resultados, MYSQL_ASSOC)) {
    $obser[]=$fila['id'];
    }
      return $obser;
    }
     /**
   Actualizar estado aprobacion de revisiones
   */
  function estadoAprobado() {
    $aprobado = self::E4_APROBADO;
    $sql = " UPDATE  `{$this->getTableName()}` SET `estado_revision` = '$aprobado' WHERE id='$this->id'";
    $result = mysql_query($sql);
    if (!$result)
      return false;
  }
      /**
   muestra array con estudiante_id
   */
  function getEstudiante() {
  $buscar = " SELECT re.id as revid, pe.estudiante_id as estuid
FROM revision re, proyecto pr, proyecto_estudiante pe
WHERE re.proyecto_id=pr.id
AND pe.proyecto_id=pr.id
AND re.id='$this->id'";
   $sqlbus = mysql_query($buscar);
while ($fila1b = mysql_fetch_array($sqlbus, MYSQL_ASSOC)) {
   $arraybus=$fila1b['estuid'];
 }
  return $arraybus;
    }
  /**
   Evia Notificacion al estudiande responsable del proyecto
   */
  function notificacionRevision($idest,$idpro,$nomrev) {
    leerClase('Notificacion');
    $noti = new Notificacion();
    $noti->detalle = 'Revision de Avance con observaciones realizadas por '.$nomrev.' para su consideracion.';
    $noti->asunto  = 'Revision de Avance';
    $noti->tipo=  Notificacion::TIPO_MENSAJE;
    $noti->fecha_envio=date("d/m/Y");
    $noti->estado=  Objectbase::STATUS_AC;
    $noti->proyecto_id=$idpro;
    $noti->prioridad=3;
    $usuarios['estudiantes'] = array($idest);
    $noti->enviarNotificaion($usuarios);
  }
  function getRevisorTipo(){
      $tipo=  $this->revisor_tipo;
      return $tipo;
  }

}
?>