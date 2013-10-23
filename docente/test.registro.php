<?php

try {
  define("MODULO", "DOCENTE");

  require('_start.php');
  if (!isDocenteSession())
    header("Location: login.php");
  /** HEADER */
  $smarty->assign('title', 'Proyecto Final');
  $smarty->assign('description', 'Proyecto Final');
  $smarty->assign('keywords', 'Proyecto Final');

  //Leemos
  leerClase('Automatico');
  $automatico = new Automatico();
  $automatico->getListaParaProyecto(1);


  $smarty->assign("ERROR", $ERROR);
  $smarty->assign("columnacentro", 'docente/columna.test.tpl');


  //No hay ERROR
  $smarty->assign("ERROR", '');
} catch (Exception $e) {
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'docente/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);
?>