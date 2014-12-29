<?php

/**
 * La relacion entre un proyecto y el estudiante
 */
class Proyecto_estudiante extends Objectbase 
{
 /**
  * id del proyecto
  * @var INT(11)
  */
  var $proyecto_id;
  
 /**
  * id del estudiante
  * @var INT(11)
  */
  Var $estudiante_id;
  
 /**
  * fecha que fue asignado como tutor
  * @var DATE
  */
  Var $fecha_asignacion;
  

  /**
   * Inicia el filtro para el admin
   * @param Filtro $filtro el fitro que se usara en el admin
   */
  function iniciarFiltro(&$filtro) {
    leerClase('Proyecto');
    if (isset($_GET['order']))
      $filtro->order($_GET['order']);
    $proyecto = new Proyecto();
    $proyecto->iniciarFiltro($filtro);
    //$estudiante = new Estudiante();
    //$estudiante->iniciarFiltro($filtro);
    //$usuario = new Usuario();
    //$usuario->iniciarFiltro($filtro);
    // Solo usaremos el  codigo sisdel estudiante
    $filtro->nombres[] = 'C&oacute;digo Sis';
    $filtro->valores[] = array('input', 'codigo_sis', $filtro->filtro('nombre'));
  }

  /**
   * Devuelve el order para el SQL
   * @param array $order_array arreglo con las claves para el order
   * @return string
   */
  function getOrderString(&$filtro) {
    $order_array = array();
    $order_array['codigo_sis'] = " {$this->getTableName()}.codigo_sis ";

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

