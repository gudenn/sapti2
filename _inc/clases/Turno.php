<?php
/**
 * Esta clase es para guardar los datos tipo Tutor
 *
 * @author Guyen Campero <guyencu@gmail.com>
 */
class Turno extends Objectbase 
{
 /**
  * 
  */
  var $nombre;
  var $descripcion;
  
  
   function validar() {
    leerClase('Formulario');
    Formulario::validar('nombre'     , $this->nombre     , 'texto', 'El Nombre');
   Formulario::validar('descripcion'     , $this->descripcion     , 'texto', 'El Descrpcion');
    
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
    $filtro->nombres[] = 'descripcion';
    $filtro->valores[] = array('input', 'sigla', $filtro->filtro('descripcion'));
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
   $order_array['descripcion']      = " {$this->getTableName()}.descripcion ";
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
  
  
  /**
  function getDocentesDictan($semestre_id)
  {
    leerClase('Dicta');
    leerClase('Docente');
    $docentesQueDictan = new Dicta();
    $docentesQueDictan->materia_id  = $this->id;
    $docentesQueDictan->semestre_id = $semestre_id;
    $docentesQueDictan->estado      = Objectbase::STATUS_AC;
    $result =  $docentesQueDictan->getAll();
    if (!$result)
      return false;
    $docentes = array();
    while ($row = mysql_fetch_array($result[0]))
    {
      $docente_aux = new Docente($row['docente_id']);
      $docente_aux->dicta_id = $row['id'];
      $docentes[]  = $docente_aux;
    }
    return $docentes;    
    
  }
  
   */
}
