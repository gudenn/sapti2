<?php

class Tutor extends Objectbase
{
    /**
     * Codigo identificador del Objeto Usuario
     * @var INT(11)
     */
    var $usuario_id;

    
    /**
     * Retorna el nombre completo del usuario
     * @param boolean $echo si muestra o solo devuelve
     * @return boolean
     */
    function getNombreCompleto($echo = false) 
    {
      leerClase('Usuario');
      if (!$this->usuario_id)
        return false;
      $usuario = new Usuario($this->usuario_id);
      return $usuario->getNombreCompleto($echo);
    }

    /**
     * buscamos el tutor por el login y la clave
     * @param type $login
     * @param type $clave
     * @return object
     */
    public function issetTutor($login, $clave) {
        if ($login == "" || $clave == "") {
            return false;
        }
        $activo = Objectbase::STATUS_AC;
        $sql = "select * , a.id as tutor_id from ".$this->getTableName()." as a , ".$this->getTableName('usuario')." as u   where u.login = '$login' and u.clave = '$clave' and a.usuario_id = u.id and u.estado = '$activo' and a.estado = '$activo'  ";
        //echo $sql;
        $resultado = mysql_query($sql);
        if (!$resultado) {
            return false;
        }
        $user = mysql_fetch_object($resultado);
        return $user;
    }

  
  /**
   * Validamos al usuario ya sea para actualizar o para crear uno nuevo
   * @param type $es_nuevo
   */
  function validar($es_nuevo = true) {
    leerClase('Formulario');
    Formulario::validar('ci'                ,$this->ci          ,'texto','El CI');
    Formulario::validar('nombre'            ,$this->nombre      ,'texto','El Nombre');
    Formulario::validar('apellidos'         ,$this->apellidos   ,'texto','Los Apellidos',TRUE);
    Formulario::validar('login'             ,$this->login      ,'texto','El Login');
    if ( $es_nuevo ) // nuevo
    {
      $this->getByLogin($this->login,true);
      Formulario::validarPassword('clave',$this->clave, isset($_POST['clave2'])?$_POST['clave2']:false ,TRUE);
    }
    else
    {
      $pas1 = isset($_POST['password1'])?$_POST['password1']:false;
      $pas2 = isset($_POST['password2'])?$_POST['password2']:false;
      $pas3 = isset($_POST['password3'])?$_POST['password3']:false;
      Formulario::validarCambioPassword('password',$this->clave,$pas1,$pas2,$pas3,true,'texto','La Clave de acceso',FALSE);
      $this->password = $pas2;
    }
    Formulario::validar_fecha('fecha_cumple',$this->fecha_cumple,TRUE);
  }
  
  

  /**
   * Inicia el filtro para el admin
   * @param Filtro $filtro el fitro que se usara en el admin
   */
  function iniciarFiltro(&$filtro) 
  {
    
    if (isset($_GET['order']))
      $filtro->order($_GET['order']);

    $filtro->nombres[] = 'Estado';
    $filtro->valores[] = array ('select','estado'  ,$filtro->filtro('estado'),
        array(''      ,'AC'         ,'NC'           ,'IN'          ,'DE'        ),
        array('Todos' ,'Confirmados','No Confirmado','Desctivado'  ,'Eliminado' ));
    $filtro->nombres[] = 'Nombre';
    $filtro->valores[] = array ('input' ,'nombre',$filtro->filtro('nombre'));
    $filtro->nombres[] = 'Apellidos';
    $filtro->valores[] = array ('input' ,'apellidos',$filtro->filtro('apellidos'));
    $filtro->nombres[] = 'Login';
    $filtro->valores[] = array ('input' ,'login',$filtro->filtro('login'));
    $filtro->nombres[] = 'Email';
    $filtro->valores[] = array ('input' ,'email',$filtro->filtro('email'));
  }

  /**
   * Devuelve el order para el SQL
   * @param array $order_array arreglo con las claves para el order
   * @return string
   */
  function getOrderString(&$filtro) 
  {
    $order_array                        = array();
    $order_array['id']                  = " {$this->getTableName ()}.id ";
    $order_array['nombre']              = " {$this->getTableName ('Usuario')}.nombre ";
    $order_array['apellidos']           = " {$this->getTableName ('Usuario')}.apellidos ";
    $order_array['login']               = " {$this->getTableName ('Usuario')}.login ";
    $order_array['email']               = " {$this->getTableName ('Usuario')}.email ";
    $order_array['estado']              = " {$this->getTableName ('Usuario')}.estado ";
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
    return $filtro_sql;
  }

}
