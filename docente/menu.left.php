<?php
  /**
   * Menu Izquierdo
   */
  leerClase('Menu');
  leerClase('Docente');
  $docente   = false;
  if (isDocenteSession())
  {
    $docente = getSessionDocente();
  }
  $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getDocenteIndex($docente));

?>