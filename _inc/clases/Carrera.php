<?php
/**
 * Objeto para guardar todas las carreras a las cuales se aplicara este software
 */
class Carrera extends Objectbase 
{
  
 /**
  * El nombre de la carrera
  * @var INT(11)
  */
  var $nombre;

  /**
   * Validamos que todos los datos enviados sean correctos
   */
  function validar() {
    leerClase('Formulario');
    Formulario::validar('nombre', $this->nombre, 'texto', 'El Nombre de la carrera');
    
  }
  

  /**
   * Inicia el filtro para el admin
   * @param Filtro $filtro el fitro que se usara en el admin
   */
  function iniciarFiltro(&$filtro) {

    if (isset($_GET['order']))
      $filtro->order($_GET['order']);
    $filtro->nombres[] = 'Nombre';
    $filtro->valores[] = array('input', 'nombre', $filtro->filtro('nombre'));
  }

  /**
   * Devuelve el order para el SQL
   * @param array $order_array arreglo con las claves para el order
   * @return string
   */
  function getOrderString(&$filtro) {
    $order_array = array();
    $order_array['id']     = " {$this->getTableName()}.id ";
    $order_array['nombre'] = " {$this->getTableName()}.nombre ";
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
    if ($filtro->filtro('nombre'))
      $filtro_sql .= " AND {$this->getTableName()}.nombre like '%{$filtro->filtro('nombre')}%' ";
    if ($filtro->filtro('estado'))
      $filtro_sql .= " AND {$this->getTableName()}.estado like '%{$filtro->filtro('estado')}%' ";
    return $filtro_sql;
  }
}

?>