<?php
/**
* @author          Guyen Campero<guyencu@gmail.com>
* @version         0.13.0.02
*/
class Administrador extends Objectbase
{

  /** constant to find the admin folder  */
  const URL                  = "autoridad/";

 /**
  * Codigo identificador del Objeto Usuario
  * @var INT(11)
  */
  var $usuario_id;

  
  /**
   * Obtiene el usuario del administrador
   * @return Grupo
   */
  public function getUsuario() 
  {
    leerClase('Usuario');
    $usuario = new Usuario($this->usuario_id);
    return $usuario;    
  }  
  
  
  /**
   * No hay nada que validar en el admin
   */
  function validar() {
  }
  
  
/**
  * get user if exist else return 0
  * @param type $login
  * @param type $clave
  * @return object 
  */
  public function issetAdmin($login, $clave) {
    if ($login == "" || $clave == "")
      return false;
    $activo = Objectbase::STATUS_AC;
    $sql  = "select * , a.id as administrador_id  , u.id as usuario_id   from ".$this->getTableName()." as a , ".$this->getTableName('usuario')." as u   where u.login = '$login' and u.clave = '$clave' and a.usuario_id = u.id and u.estado = '$activo' and a.estado = '$activo'  ";
    //echo $sql; 
    $resultado = mysql_query($sql);
    if (!$resultado)
      return false;
    $user = mysql_fetch_object($resultado);
    //grabamos en la tabla pertenece si es que no tiene 
    leerClase('Grupo');
    leerClase('Pertenece');
    $grupo    = new Grupo('', Grupo::GR_AD);
    if ($grupo->id && isset($user->usuario_id) && $user->usuario_id )
    {
      $pertenece = new Pertenece('',$grupo->id,$user->usuario_id );
      if (!$pertenece->id)
      {
        $pertenece->usuario_id = $user->usuario_id;
        $pertenece->grupo_id   = $grupo->id;
        $pertenece->estado     = Objectbase::STATUS_AC;
        $pertenece->save();
      }
    }
    return $user;
  }


} 
