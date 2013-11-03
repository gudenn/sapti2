<?php

class Materia extends Objectbase 
{
  
 
    /**
   * Materia tipo
   */
  const  MATERIA_PE  = "PE";
  /**
   * 
   */
  const  MATERIA_PR  = "PR";
 
 /**
  * sigla de la materia
  * @var INT(11)
  */
     var $sigla;
     
 /**
  * nombre de la materia
  * @var INT(11)
  */    
     var $nombre;
     
 /**
  * tipo de la materia puede ser PR o PE
  * @var INT(11)
  */
     var $tipo;
    
  
  /**
   * Obtiene todos los docentes que dictan una materia por semestre
   * 
   * @author Guyen Campero <guyencu@gmail.com>
   * 
   * @param type $semestre_id identificador del semestre
   * @return boolean|\Docente
   */
   /**
   * Validamos que todos los datos enviados sean correctos
   */
  function validar() {
    leerClase('Formulario');
    Formulario::validar('nombre'     , $this->nombre     , 'texto', 'El Nombre');
  Formulario::validar('sigla'     , $this->nombre     , 'texto', 'la sigla');
    
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
    $filtro->nombres[] = 'Sigla';
    $filtro->valores[] = array('input', 'sigla', $filtro->filtro('sigla'));
  }

  /**
   * Devuelve el order para el SQL
   * @param array $order_array arreglo con las claves para el order
   * @return string
   */
  function getOrderString(&$filtro) {
    $order_array = array();
    $order_array['id']          = " {$this->getTableName()}.id ";
     $order_array['sigla']      = " {$this->getTableName()}.sigla ";
    $order_array['nombre']      = " {$this->getTableName()}.nombre ";
   
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
    if ($filtro->filtro('sigla'))
      $filtro_sql .= " AND {$this->getTableName()}.sigla like '%{$filtro->filtro('sigla')}%' ";
    if ($filtro->filtro('nombre'))
      $filtro_sql .= " AND {$this->getTableName()}.nombre like '%{$filtro->filtro('nombre')}%' ";
    
    return $filtro_sql;
  }
  
  
  /**
   * Obtenemos todos los docentes que dictan una materia
   * @param type $semestre_id
   * @return boolean|\Docente
   */
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
  
  /**
   * Obtenemos una lista de todas los grupos
   * @param type $semestre_id
   * @return boolean|array
   */
  function getGruposDictan($semestre_id)
  {
    leerClase('Dicta');
    leerClase('Docente');
    leerClase('Codigo_grupo');
    $gruposQueDictan = new Dicta();
    $gruposQueDictan->materia_id  = $this->id;
    $gruposQueDictan->semestre_id = $semestre_id;
    $gruposQueDictan->estado      = Objectbase::STATUS_AC;
    $result                       =  $gruposQueDictan->getAll();
    if (!$result)
      return false;
    $dictan = array();
    while ($row = mysql_fetch_array($result[0],MYSQL_ASSOC))
    {
      $docente        = new Docente($row['docente_id']);
      $grupo        = new Codigo_grupo($row['codigo_grupo_id']);
      $row['codigo_grupo'] = $grupo->nombre;
      $row['docente'] = $docente->getNombreCompleto();
      $dictan[]  = $row;
    }
    return $dictan;    
    
  }
}


?>
