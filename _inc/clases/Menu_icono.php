<?php

/**
 * Esta clase es para manejar los menus no interactua con la base de datos
 *
 * @author Guyen Campero <guyencu@gmail.com>
 */
class Menu_icono
{

 /**
  * Archivo del icono
  */
  var $file;

 /**
  * Titulo del icono
  */
  var $title;

 /**
  * Ancho
  */
  var $width;

 /**
  * Alto
  */
  var $height;

 /**
  * Alto
  */
  var $extra;

 /**
  * Alter texto
  */
  var $alt;

 /**
  * Mostrar el icono
  */
  var $echo;

  /**
   * 
   * @param String $file
   * @param String $title
   * @param String $width
   * @param String $height
   * @param String $extra
   * @param String $alt
   * @param String $echo
   */
  public function __construct($file,$title,$width = '48px',$height = false,$extra = false,$alt = false,$echo = true) {
    $this->file    = $file  ; 
    $this->title   = $title ; 
    $this->width   = $width ; 
    $this->height  = $height; 
    $this->extra   = $extra ; 
    $this->alt     = $alt   ; 
    $this->echo    = $echo  ;
  }
  
  /**
   * Muestra el icono
   */
  function mostrar() 
  {
    $file   = $this->file   ;
    $title  = $this->title  ;
    $width  = $this->width  ;
    $height = $this->height ;
    $extra  = $this->extra  ;
    $alt    = $this->alt    ;
    $echo   = $this->echo   ;
    icono($file, $title, $width, $height, $extra, $alt, $echo);
    
  }
  

}

?>