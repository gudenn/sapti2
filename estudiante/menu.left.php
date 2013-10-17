<?php
  /**
   * Menu Izquierdo
   */
  leerClase('Menu');
  leerClase('Usuario');
  leerClase('Proyecto');
  leerClase('Estudiante');
  $proyecto   = false;
  if (isEstudianteSession())
  {
    $estudiante = getSessionEstudiante();
    $proyecto   = $estudiante->getProyecto();
  }
  
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getestudianteIndex($proyecto));

?>