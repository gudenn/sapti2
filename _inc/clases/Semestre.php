<?php
/**
 * Esta clase es para guardar los Semestres
 *
 * @author Guyen Campero <guyencu@gmail.com>
 */
class Semestre extends Objectbase 
{
  
  
 /**
  * Codigo del semestre
  * @var INT(45)
  */
  var $codigo;

  
 /**
  * Si el semestre es el actual o no
  * @var INT(11)
  */
  var $activo;



  /**
   * Guardamos este semestre
   */
  function save($table = false , $father_id_value = false , $base = 'compania') {
    if ($this->activo)
      $this->activar ();
    parent::save($table, $father_id_value, $base);
  }


  /**
   Activamos este semestre como el semestre actual
   */
  function activar() {
    $sql = " UPDATE  `{$this->getTableName()}` SET  `activo` =  '0' WHERE  1 ";
    //echo $sql;
    $result = mysql_query($sql);
    if (!$result)
      return false;
    $this->activo = 1;
  }
  
  /**
   * Validamos que todos los datos enviados sean correctos
   */
  function validar() {
    leerClase('Formulario');
    Formulario::validar('codigo', $this->codigo, 'texto', 'El Codigo');
    
  }

  /**
   * Inicia el filtro para el admin
   * @param Filtro $filtro el fitro que se usara en el admin
   */
  function iniciarFiltro(&$filtro) {

    if (isset($_GET['order']))
      $filtro->order($_GET['order']);
    $filtro->nombres[] = 'C&oacute;digo';
    $filtro->valores[] = array('input', 'codigo', $filtro->filtro('codigo'));
  }

  /**
   * Devuelve el order para el SQL
   * @param array $order_array arreglo con las claves para el order
   * @return string
   */
  function getOrderString(&$filtro) {
    $order_array = array();
    $order_array['id']     = " {$this->getTableName()}.id ";
    $order_array['codigo'] = " {$this->getTableName()}.codigo ";
    $order_array['activo'] = " {$this->getTableName()}.activo ";
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
    if ($filtro->filtro('codigo'))
      $filtro_sql .= " AND {$this->getTableName()}.codigo like '%{$filtro->filtro('codigo')}%' ";
    if ($filtro->filtro('activo'))
      $filtro_sql .= " AND {$this->getTableName()}.activo like '%{$filtro->filtro('activo')}%' ";
    return $filtro_sql;
  }

}
?>