<?php
  /**
   * Menu Izquierdo
   */
  leerClase('Menu');
 
   $menuizquierda = new Menu('');
  $smarty->assign("menuizquierda", $menuizquierda->getConsejoIndex());
  

?>