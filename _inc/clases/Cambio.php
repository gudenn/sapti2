<?php
/**
 * Objeto para guardar todas las carreras a las cuales se aplicara este software
 */
class Cambio extends Objectbase 
{
 /** constant to add in the begin of the key to find the date values   */
  const CAMBIOLEVE                  = "LE";
  /** constant to add in the begin of the key to find the date values   */
  const CAMBIOTOTAL                  = "TO";
   /** constant to add in the begin of the key to find the date values   */
  const CANTCAMBIO                  =1;
 /**
  * El id del Proyecto
  * @var INT(11)
  */
  var $proyecto_id;
  /**
  * El Tipo de Cambio
  * @var VARCHAR(100)
  */
  var $tipo;
  /**
  * La Fecha de Cambio
  * @var DATE(100)
  */
  var $fecha_cambio;

  

  /**
   * Inicia el filtro para el cambio
   * @param Filtro $filtro el fitro que se usara en el cambio
   */
  function iniciarFiltro(&$filtro) {

    if (isset($_GET['order']))
      $filtro->order($_GET['order']);
    $filtro->nombres[] = 'Tipo';
    $filtro->valores[] = array('input', 'tipo', $filtro->filtro('tipo'));
  }

  /**
   * Devuelve el order para el SQL
   * @param array $order_array arreglo con las claves para el order
   * @return string
   */
  function getOrderString(&$filtro) {
    $order_array = array();
    $order_array['id']     = " {$this->getTableName()}.id ";
    $order_array['tipo'] = " {$this->getTableName()}.tipo ";
    $order_array['estado'] = " {$this->getTableName()}.estado ";
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
    if ($filtro->filtro('id'))
      $filtro_sql .= " AND {$this->getTableName()}.id like '%{$filtro->filtro('id')}%' ";
    if ($filtro->filtro('tipo'))
      $filtro_sql .= " AND {$this->getTableName()}.nombre like '%{$filtro->filtro('tipo')}%' ";
    if ($filtro->filtro('estado'))
      $filtro_sql .= " AND {$this->getTableName()}.estado like '%{$filtro->filtro('estado')}%' ";
    return $filtro_sql;
  }
}

