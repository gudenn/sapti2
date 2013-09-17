<?php
/**
 * Esta clase es para guardar la Configuracion para cada semestre
 *
 * @author Guyen Campero <guyencu@gmail.com>
 */
class Configuracion_semestral extends Objectbase 
{
 /**
  * id del semestre
  * @var VARCHAR(11)
  */
  var $semestre_id;
  
 /**
  * Nombre del campo
  * @var VARCHAR(100)
  */
  var $nombre;

  
 /**
  * Valor del campo
  * @var VARCHAR(300)
  */
  var $valor;

  function save($table = false , $father_id_value = false , $base = 'compania')
  {
    // Solo para valores nuevos
    if (!$this->id)
    {
      //Para sobreescribir 
      $load = new Configuracion_semestral();
      $load->getValor($this->nombre,$this->semestre_id);
      //Existe un valor previamente guardado
      if ($load->id)
      {
        echo "";
        $load->valor  = $this->valor;
        $load->estado = $this->estado;
        $load->save($table, $father_id_value, $base);
        return;
      }
    }
    parent::save($table, $father_id_value, $base);
    
  }

  /**
   * obtenemos un valor por el nombre del campo asociado a un semestre
   */
  function getValor($nombre = false , $semestre_id = false) {
    $this->valor = '';
    if ($semestre_id)
      $this->semestre_id = $semestre_id;
    if ($nombre)
    {
      leerClase('Formulario');
      Formulario::validar('nombre', $nombre, 'texto', 'El Nombre');
      $this->nombre = $nombre;
    }
    $valor = $this->getAll();
    if (is_array($valor) && isset($valor[0]))
      $valor = mysql_fetch_array($valor[0], MYSQL_ASSOC);
    parent::__construct($valor);
  }
  

  /**
   * Validamos que todos los datos enviados sean correctos
   */
  function validar() {
    leerClase('Formulario');
    Formulario::validar('nombre', $this->nombre, 'texto', 'El Nombre');
    Formulario::validar('valor' , $this->valor, 'texto', 'El Valor');
    
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
    $filtro->nombres[] = 'Valor';
    $filtro->valores[] = array('input', 'valor', $filtro->filtro('valor'));
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
    $order_array['valor']  = " {$this->getTableName()}.valor ";
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
    if ($filtro->filtro('valor'))
      $filtro_sql .= " AND {$this->getTableName()}.valor like '%{$filtro->filtro('valor')}%' ";
    if ($filtro->filtro('estado'))
      $filtro_sql .= " AND {$this->getTableName()}.estado like '%{$filtro->filtro('estado')}%' ";
    return $filtro_sql;
  }

}
?>