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

}

?>