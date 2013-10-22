<?php
  /**
   * Menu Izquierdo
   */
  leerClase('Menu');
  leerClase('Docente');
  $docente   = false;
  if (getSessionDocente())
  {
    $docente = getSessionDocente();
  }
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getDocenteIndex($docente));

?>