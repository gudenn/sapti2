<?php

/**
 * Esta clase es para guardar los datos de usuarios que pertenecen a un grupo
 * @author Guyen Campero <guyencu@gmail.com>
 */
class Pertenece extends Objectbase {

  /**
   * Codigo identificador de Usuario
   * @var INT(11)
   */
  var $usuario_id;

  /**
   * Codigo identificador de Grupo
   * @var INT(11)
   */
  var $grupo_id;

  /**
   * Sobrecarga de la funcion para llamar al objeto a travez del $usuario_id y el $grupo_id
   * @param type $id
   * @param type $grupo_id id del grupo
   * @param type $usuario_id id del modulo
   * @param type $helpdesk_id id del helpdesk
   * @return boolean
   */
  function __construct($id = '', $grupo_id = false, $usuario_id = false) {
    if ($usuario_id && $grupo_id) {
      $sql = "SELECT * FROM " . $this->getTableName() . " WHERE usuario_id = '$usuario_id' AND grupo_id = '$grupo_id' ";
      //echo $sql;
      $result = mysql_query($sql);
      if (!$result)
        return false;
      if (mysql_num_rows($result) == 0)
        return parent::__construct($id);
      $row = mysql_fetch_array($result, MYSQL_ASSOC);
      foreach ($this as $key => $value) {
        /**  if the $key refer to an object continue */
        if ($this->isKeyObject($key))
          continue;
        if (isset($row[strtolower($key)]))
          $this->$key = $row[strtolower($key)];
      }
      /** solo para los leidos desde la base de datos */
      // $this->datesSTH();
    }
    else
      parent::__construct($id);
  }
  
  /**
   * Inicia el filtro para el admin
   * @param Filtro $filtro el fitro que se usara en el admin
   */
  function iniciarFiltro(&$filtro) {

    if (isset($_GET['order']))
      $filtro->order($_GET['order']);
    $usuario = new Usuario();
    $usuario->iniciarFiltro($filtro);
  }

  /**
   * Devuelve el order para el SQL
   * @param array $order_array arreglo con las claves para el order
   * @return string
   */
  function getOrderString(&$filtro) {
    $order_array = array();
    $order_array['id']               = " {$this->getTableName('Usuario')}.id ";
    $order_array['nombre']           = " {$this->getTableName('Usuario')}.nombre ";
    $order_array['apellido_paterno'] = " {$this->getTableName('Usuario')}.apellido_paterno ";
    $order_array['apellido_materno'] = " {$this->getTableName('Usuario')}.apellido_materno ";
    $order_array['login']            = " {$this->getTableName('Usuario')}.login ";
    $order_array['email']            = " {$this->getTableName('Usuario')}.email ";
    $order_array['estado']           = " {$this->getTableName('Usuario')}.estado ";
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
    if ($filtro->filtro('email'))
      $filtro_sql .= " AND {$this->getTableName('usuario')}.email like '%{$filtro->filtro('email')}%' ";
    if ($filtro->filtro('login'))
      $filtro_sql .= " AND {$this->getTableName('usuario')}.login like '%{$filtro->filtro('login')}%' ";
    if ($filtro->filtro('nombre'))
      $filtro_sql .= " AND {$this->getTableName('usuario')}.nombre like '%{$filtro->filtro('nombre')}%' ";
    if ($filtro->filtro('apellido_paterno'))
      $filtro_sql .= " AND {$this->getTableName('usuario')}.apellido_paterno like '%{$filtro->filtro('apellido_paterno')}%' ";
    if ($filtro->filtro('apellido_materno'))
      $filtro_sql .= " AND {$this->getTableName('usuario')}.apellido_materno like '%{$filtro->filtro('apellido_materno')}%' ";
    return $filtro_sql;
  }

}

?>