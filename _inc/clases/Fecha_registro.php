<?php
class Fecha_registro extends Objectbase
{
   
   /**
  * semestre del  Cronograma
  * @var INT(45)
  */
  var $semestre_id;
  
  
 /**
  * fecha del  inicio
  * @var INT(45)
  */
  var $fecha_inicio;
  /**
  * fecha del  fin
  * @var INT(45)
  */
  var $fecha_fin;
  
  var $descripcion;
  
  /**
   * Validamos que todos los datos enviados sean correctos
   */
  function validar() {
    leerClase('Formulario');
    Formulario::validar('descripcion'     , $this->descripcion     , 'texto', 'El Nombre');
    Formulario::validar('fecha_inicio', $this->fecha_inicio, 'texto', 'La Fecha de inicio');
    Formulario::validar('fecha_fin', $this->fecha_fin, 'texto', 'La fecha fin');
    
  }

  /**
   * Inicia el filtro para el admin
   * @param Filtro $filtro el fitro que se usara en el admin
   */
  
   function iniciarFiltro(&$filtro) {

    if (isset($_GET['order']))
      $filtro->order($_GET['order']);
    $filtro->nombres[] = 'Fecha Inicio';
    $filtro->valores[] = array('input', 'fecha_inicio', $filtro->filtro('fecha_inicio'));
    $filtro->nombres[] = 'Fecha Fin';
    $filtro->valores[] = array('input', 'fecha_fin', $filtro->filtro('fecha_fin'));
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
    $order_array['id']          = " {$this->getTableName()}.id ";
     $order_array['fecha_inicio']      = " {$this->getTableName()}.fecha_inicio ";
    $order_array['fecha_fin']      = " {$this->getTableName()}.fecha_fin ";
   
    $order_array['descripcion']      = " {$this->getTableName()}.descripcion ";
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
    if ($filtro->filtro('fecha_inicio'))
      $filtro_sql .= " AND {$this->getTableName()}.fecha_inicio like '%{$filtro->filtro('fecha_inicio')}%' ";
    if ($filtro->filtro('fecha_fin'))
      $filtro_sql .= " AND {$this->getTableName()}.fecha_fin like '%{$filtro->filtro('fecha_fin')}%' ";
    
    return $filtro_sql;
  }
}
