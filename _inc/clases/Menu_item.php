<?php

/**
 * Esta clase es para manejar los menus no interactua con la base de datos
 *
 * @author Guyen Campero <guyencu@gmail.com>
 */
class Menu_item
{

 /**
  * Titulo del item de menu
  * @var VARCHAR(100)
  */
  var $titulo;

 /**
  * Descripcion del item
  * @var VARCHAR(100)
  */
  var $descripcion;

 /**
  * El URL del item
  * @var string $link
  */
  var $link;

 /**
  * El contador para los pendientes
  * @var string $link
  */
  var $pendientes;

 /**
  * El contador para los nopendientes
  * @var string $link
  */
  var $nopendientes;

 /**
  * El target del item
  * @var string $link
  */
  var $target;

 /**
  * El icono que acompania al item
  * @var Menu_icono
  */
  var $menu_icono;

  /**
   * creamos los items para el menu
   * @param string $titulo
   * @param string $descripcion
   * @param string $file_icono
   */
  public function __construct($titulo,$descripcion,$file_icono,$link,$pendientes = 0,$nopendientes = 0,$target = '_self') {
    $this->link          = $link;
    $this->titulo        = $titulo;
    $this->target        = $target;
    $this->pendientes    = $pendientes;
    $this->nopendientes  = $nopendientes;
    $this->descripcion   = $descripcion;
    $this->menu_icono    = new Menu_icono($file_icono, $titulo);    
  }
  
  /**
   * Mostramos el item
   */
  function mostrar() 
  {
    
  }


}

?>