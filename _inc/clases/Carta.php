<?php
/**
 * Carta
 */
class Carta extends Objectbase
{
  /** Para Estado Impresion
   * Pendiente (PE)
   */
  const EST1 = "PE";  

  /** Para Estado Impresion
   * Impreso (IP)
   */
  const EST2 = "IP";  

 /**
  * codigo del proyecto
  * @var INT(11) 
  */
  var $proyecto_id;

 /**
  * codigo del modelo de carta
  * @var INT(11) 
  */
  var $modelo_carta_id;

 /**
  * Estado de la impresion
  * Pendiente (PE), Impreso (IP)
  * @var VARCHAR(2) 
  */
  var $estado_impresion;

 /**
  * La fecha de la impression
  * @var DATE 
  */
  var $fecha_impresion;

  /**
   * Creamos las cartas correspondientes a este proyecto
   * segun su estado
   * @param Proyecto $proyecto
   */
  function crearCartasParaProyecto($proyecto) {
    // verificamos que exista el modelo de carta 
    // para el tipo de proyecto (PE,PR) y 
    // para el estado del proyecto
    leerClase('Modelo_carta');
    $modelos = Modelo_carta::buscarModelos($proyecto->tipo_proyecto,$proyecto->estado_proyecto);
    //vereficamos que para cada modelo exista o se cree una carta
    foreach ($modelos as $modelo) {
      $this->crearCartaModelo($proyecto,$modelo);
    }
  }
  
  /**
   * Creamos las cartas solo si no existen
   * @param Proyecto $proyecto
   * @param Modelo_carta $modelo
   */
  function crearCartaModelo($proyecto,$modelo) {
    //verificamos que no exista la carta y la creamos
    if ($this->existeCarta($proyecto,$modelo))
      return;
    $nueva = new Carta();
    $nueva->estado_impresion = self::EST1;
    $nueva->modelo_carta_id  = $modelo->id;
    $nueva->proyecto_id      = $proyecto->id;
    $nueva->estado           = Objectbase::STATUS_AC;
    $nueva->save();
    return;
  }
  

  /**
   * Mostramos el icono por el estado de la impresion
   * 
   * @param string(2) $id
   * @return icon
   */
  function getIconEstado($estado_impresion , $width = "25px") 
  {
    $estado_impresion = (trim($estado_impresion)=='')?self::EST1:$estado_impresion;
    $icono               = '';
    $descripcion         = '';
    switch ($estado_impresion) {
      case self::EST1: // Cartas pendientes de impresion
      default:
        $icono       = 'basicset/impresora.png';
        $descripcion = 'Carta Pendiente de Impresi&oacute;n';
        break;
      case self::EST2: // Cartas ya impresas
        $icono       = 'basicset/impreso.png';
        $descripcion = 'Carta ya Impresa';
        break;
    }
    return icono($icono, $descripcion, $width);
  }
  
  /**
   * Buscamos si existe ya lacarta para este proyecto segun el modelo
   * @param Proyecto $proyecto
   * @param Modelo_carta $modelo
   * @return boolean
   */
  function existeCarta($proyecto,$modelo) {
      //buscamos 
      $activo = Objectbase::STATUS_AC;
      $sql = "select * from " . $this->getTableName() . " where proyecto_id = '$proyecto->id' AND  modelo_carta_id = '$modelo->id' AND estado = '$activo' ";
      $result = mysql_query($sql);
      if ($result === false)
        throw new Exception("?" . $this->getTableName() . "&m=Cant getByEmail <br />$sql<br /> " . $this->getTableName() . ' -> ' . mysql_error());
      
      if (mysql_num_rows($result))
        return true;
      return false;
  }

  /**
   * Inicia el filtro para el admin
   * @param Filtro $filtro el fitro que se usara en el admin
   */
  function iniciarFiltro(&$filtro) {

    if (isset($_GET['order']))
      $filtro->order($_GET['order']);
    $filtro->nombres[] = 'Estado';
    $filtro->valores[] = array ('select','estado_impresion'  ,$filtro->filtro('estado_impresion'),
        array(''      ,'PE'        ,'IP'             ),
        array('Todos' ,'Pendiente' ,'Impreso' ));
    $filtro->nombres[] = 'Estado';
    $filtro->nombres[] = 'Tipo';
    $filtro->valores[] = array ('select','tipo_proyecto'  ,$filtro->filtro('tipo_proyecto'),
        array(''      ,'PE'          ,'PR'             ),
        array('Todos' ,'Tipo PErfil' ,'Tipo Proyecto' ));
    $filtro->valores[] = array ('select','estado_proyecto'  ,$filtro->filtro('estado_proyecto'),
        array(''      ,'VB'          ,'TA'                ,'TV'                  ,'LD'               ,'PF'                    ),
        array('Todos' ,'Visto Bueno' ,'Tribunal Asignado' ,'Visto Bueno Tribunal','Defensa Asignada' ,'Proyecto Finalizado'  ));
    $filtro->nombres[] = 'T&iacute;tulo';
    $filtro->valores[] = array('input', 'titulo', $filtro->filtro('titulo'));
    $filtro->nombres[] = 'Descripci&oacute;n';
    $filtro->valores[] = array('input', 'descripcion', $filtro->filtro('descripcion'));
  }
  
  /**
   * Devuelve el order para el SQL
   * @param array $order_array arreglo con las claves para el order
   * @return string
   */
  function getOrderString(&$filtro) {
    $order_array = array();
    $order_array['estado_impresion'] = " {$this->getTableName()}.estado_impresion ";
    $order_array['titulo']           = " {$this->getTableName('Modelo_carta')}.titulo ";
    $order_array['descripcion']      = " {$this->getTableName('Modelo_carta')}.descripcion ";
    $order_array['id']               = " {$this->getTableName()}.id ";
    $order_array['estado']           = " {$this->getTableName()}.estado ";
    $order_array['tipo_proyecto']    = " {$this->getTableName('Modelo_carta')}.tipo_proyecto ";
    $order_array['estado_proyecto']  = " {$this->getTableName('Modelo_carta')}.estado_proyecto ";
    return $filtro->getOrderString($order_array);
  }

  /**
   * Filtramos para la busqueda usando un objeto Filtro
   * @param Filtro $filtro el objeto filtro
   * @return boolean
   */
  public function filtrar(&$filtro) {
    parent::filtrar($filtro);
    $filtro_sql = '';
    if ($filtro->filtro('estado'))
      $filtro_sql .= " AND {$this->getTableName()}.estado like '%{$filtro->filtro('codigo')}%' ";
    if ($filtro->filtro('descripcion'))
      $filtro_sql .= " AND {$this->getTableName('Modelo_carta')}.descripcion like '%{$filtro->filtro('descripcion')}%' ";
    if ($filtro->filtro('titulo'))
      $filtro_sql .= " AND {$this->getTableName('Modelo_carta')}.titulo like '%{$filtro->filtro('titulo')}%' ";
    if ($filtro->filtro('tipo_proyecto'))
      $filtro_sql .= " AND {$this->getTableName('Modelo_carta')}.tipo_proyecto like '%{$filtro->filtro('tipo_proyecto')}%' ";
    if ($filtro->filtro('estado_proyecto'))
      $filtro_sql .= " AND {$this->getTableName('Modelo_carta')}.estado_proyecto like '%{$filtro->filtro('estado_proyecto')}%' ";
    if ($filtro->filtro('estado'))
      $filtro_sql .= " AND {$this->getTableName()}.estado like '%{$filtro->filtro('estado')}%' ";
    if ($filtro->filtro('id'))
      $filtro_sql .= " AND {$this->getTableName()}.id like '%{$filtro->filtro('id')}%' ";
    return $filtro_sql;
  }
  
}

