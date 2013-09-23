<?php
class Modalidad extends Objectbase 
{
  /** Constante para el tipo de trabajo en grupo o en conjunto  */
  const DATOS_AD_NO  = "0";
  /** Constante para el tipo de trabajo solo */
  const DATOS_AD_SI  = "1";

  /**
  * Nombre del Modalida
  * @var INT(45)
  */
  var $nombre;
  
 /**
  * Descripcion del Modalida
  * @var INT(45)
  */
  var $descripcion;
  
 /**
  * Si esta modalidad tiene datos adicionales como que exige revisor o institucion
  * @var BOOLEAN
  */
  var $datos_adicionales;
  
  /**
   * Validamos que todos los datos enviados sean correctos
   */
  function validar() {
    leerClase('Formulario');
    Formulario::validar('nombre'     , $this->nombre     , 'texto', 'El Nombre');
    Formulario::validar('descripcion', $this->descripcion, 'texto', 'La Descripci&oacute;n');
    
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
    $order_array['nombre']      = " {$this->getTableName()}.nombre ";
    $order_array['descripcion'] = " {$this->getTableName()}.descripcion ";
    $order_array['estado']      = " {$this->getTableName()}.estado ";
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
    if ($filtro->filtro('descripcion'))
      $filtro_sql .= " AND {$this->getTableName()}.descripcion like '%{$filtro->filtro('descripcion')}%' ";
    return $filtro_sql;
  }
}

?>
