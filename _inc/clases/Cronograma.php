<?php
class Cronograma extends Objectbase
{
    /**
  * semestre del  Cronograma
  * @var INT(45)
  */
  var $semestre_id;
 /**
  * nombre del  Cronograma
  * @var INT(45)
  */
  var $nombre_evento;
  
   /**
  * detalle del  Cronograma
  * @var INT(45)
  */
  var $detalle_evento;
  
 /**
  * fecha del  Cronograma
  * @var INT(45)
  */
  var $fecha_evento;
  
  /**
   * Validamos que todos los datos enviados sean correctos
   */
  function validar() {
    leerClase('Formulario');
    Formulario::validar('nombre_evento'     , $this->nombre     , 'texto', 'El Nombre');
    Formulario::validar('detalle_evento', $this->descripcion, 'texto', 'La Descripci&oacute;n');
    Formulario::validar('fecha__evento', $this->descripcion, 'texto', 'La fecha');
    
  }

  /**
   * Inicia el filtro para el admin
   * @param Filtro $filtro el fitro que se usara en el admin
   */
  function iniciarFiltro(&$filtro) {

    if (isset($_GET['order']))
      $filtro->order($_GET['order']);
    $filtro->nombres[] = 'Nombre';
    $filtro->valores[] = array('input', 'nombre_evento', $filtro->filtro('nombre_evento'));
    $filtro->nombres[] = 'Detalle';
    $filtro->valores[] = array('input', 'detalle_evento', $filtro->filtro('detalle_evento'));
   
  }

  /**
   * Devuelve el order para el SQL
   * @param array $order_array arreglo con las claves para el order
   * @return string
   */
  function getOrderString(&$filtro) {
    $order_array = array();
    $order_array['id']          = " {$this->getTableName()}.id ";
    $order_array['nombre_evento']      = " {$this->getTableName()}.nombre_evento ";
    $order_array['detalle_evento'] = " {$this->getTableName()}.detalle_evento ";
    $order_array['fecha_evento']      = " {$this->getTableName()}.fecha_evento ";
    return $filtro->getOrderString($order_array);
  }

  /**
   * Filtramos para la busqueda usando un objeto Filtro
   * @param Filtro $filtro el objeto filtro
   * @return boolean
   */
  public function filtrar(&$filtro) {
    parent::filtrar($filtro);
    $filtro_sql = ' ';
    if ($filtro->filtro('id'))
      $filtro_sql .= " AND {$this->getTableName()}.id like '%{$filtro->filtro('id')}%' ";
    if ($filtro->filtro('nombre_evento'))
      $filtro_sql .= " AND {$this->getTableName()}.nombre_evento like '%{$filtro->filtro('nombre_evento')}%' ";
    if ($filtro->filtro('detalle_evento'))
      $filtro_sql .= " AND {$this->getTableName()}.detalle_evento like '%{$filtro->filtro('detalle_evento')}%' ";
       if ($filtro->filtro('fecha_evento'))
      $filtro_sql .= " AND {$this->getTableName()}.fecha_evento like '%{$filtro->filtro('fecha_evento')}%' ";
    return $filtro_sql;
  }
}
