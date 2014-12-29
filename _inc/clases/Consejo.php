<?php
class Consejo extends Objectbase
{
    const URL                  = "consejo/";
 /**
  * Codigo del usuario
  * @var INT
  */
  var $usuario_id;
   /**
  * 
  * fecha inicio date
  */
  var $fecha_inicio;

  /**
  * 
  * fecha inicio date
  */
  var $fecha_fin;
  /**
  * 
  *  Fecha final date
  */
  var $activo;

  /**
   * Validamos que todos los datos enviados sean correctos
   */
  function validar() {
    leerClase('Formulario');
    Formulario::validar('login'     , $this->login     , 'texto', 'El Nombre de Usuario');
    Formulario::validar('clave', $this->clave, 'texto', 'Contraseña');
    
  }
  
    /**
   * get user if exist else return 0
   * @param type $login
   * @param type $clave
   * @return object 
   */
  public function issetConsejo($login, $clave) {
    if ($login == "" || $clave == "")
      return false;
    $activo = Objectbase::STATUS_AC;
    $sql = "select * , c.id as consejo_id from " . $this->getTableName() . " as c , " . $this->getTableName('usuario') . " as u   where c.login = '$login' and c.clave = '$clave' and c.usuario_id = u.id and u.estado = '$activo' and c.estado = '$activo'  ";
    //echo $sql; 
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $user = mysql_fetch_object($resultado);
    return $user;
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
  public function filtrar(&$filtro)
  {
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
  public function getListaParaAsignarTribunales() {
      $sql='
SELECT DISTINCT (es.id) as id ,es.codigo_sis as codigosis , u.nombre ,CONCAT(u.apellido_paterno,"  ",u.apellido_materno) as apellidos, p.nombre as nombrep
FROM  usuario u, estudiante es , proyecto_estudiante pe, proyecto p
WHERE  u.id=es.usuario_id and  es.id=pe.estudiante_id and  pe.proyecto_id=p.id 
and p.estado_proyecto="VA" and p.tipo_proyecto="PR"
and u.estado="AC" and es.estado="AC" and pe.estado="AC"  and p.estado="AC"
and p.es_actual=1';
      
      $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $user = mysql_num_rows($resultado);
    return $user;
      
  }
  public function getListaconTribunales() {

     $sql='select DISTINCT (es.id), es.codigo_sis as codigosis , u.nombre as nombre, CONCAT(u.apellido_paterno," ",  u.apellido_materno) apellidos, p.nombre as nombrep
  from proyecto p , usuario u, estudiante es , proyecto_estudiante pe, tribunal t
  where  u.id=es.usuario_id and  es.id=pe.estudiante_id and  pe.proyecto_id=p.id and p.id=t.proyecto_id';
      
      $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $user = mysql_num_rows($resultado);
    return $user; 
      
  }
  
  public function getListaParaDefensa() {
      $sql='SELECT DISTINCT (es.id) as id ,es.codigo_sis  as codigosis, u.nombre ,CONCAT(u.apellido_paterno,"  " ,u.apellido_materno) as apellidos, p.nombre as nombrep
FROM  usuario u, estudiante es , proyecto_estudiante pe, proyecto p , tribunal t
WHERE  u.id=es.usuario_id and  es.id=pe.estudiante_id and  pe.proyecto_id=p.id and p.id=t.proyecto_id
and p.estado_proyecto="TV" and p.tipo_proyecto="PR"
and u.estado="AC" and es.estado="AC" and pe.estado="AC"  and p.estado="AC" and t.estado="AC"
and p.es_actual=1';
       $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $user = mysql_num_rows($resultado);
    return $user; 
      
  }
  public function getListaDefensas() {
        $sql='SELECT DISTINCT (d.id) as id ,es.codigo_sis  as codigosis, u.nombre ,CONCAT(u.apellido_paterno,"  " ,u.apellido_materno) as apellidos, p.nombre as nombrep
FROM  usuario u, estudiante es , proyecto_estudiante pe, proyecto p , tribunal t,defensa d
WHERE d.proyecto_id=p.id and  u.id=es.usuario_id and  es.id=pe.estudiante_id and  pe.proyecto_id=p.id and p.id=t.proyecto_id
and p.estado_proyecto="LD" and p.tipo_proyecto="PR" and d.estado="AC"
and u.estado="AC" and es.estado="AC" and pe.estado="AC"  and p.estado="AC" and t.estado="AC"
and p.es_actual=1';
       $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $user = mysql_num_rows($resultado);
    return $user; 
  }
  public function getListaTribunalesNoAceptados() {

       $sql='select   DISTINCT(e.id)  as id ,e.codigo_sis  as codigosis, "  ",u.nombre , CONCAT(u.apellido_paterno ,"  ", u.apellido_materno) apellidos, p.nombre as nombrep
from  usuario  u,  estudiante e  , proyecto_estudiante  pe , proyecto  p , tribunal t
where    u.id= e.usuario_id  and e.id= pe.estudiante_id  and pe.proyecto_id= p.id
 and t.accion="RE"  and  t.estado="AC" and p.id= t.proyecto_id  and u.estado="AC"
 and e.estado="AC" and pe.estado="AC" and p.estado="AC"';
       $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $user = mysql_num_rows($resultado);
    return $user; 
  }
}
?>