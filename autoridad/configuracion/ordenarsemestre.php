<?php
try {
  define ("MODULO", "ADMIN-CONFIGURACION");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php"); 
  
  leerClase('Administrador');
  leerClase('Semestre');
  leerClase('Dicta');
  leerClase('Configuracion_semestral');
  /** HEADER */
  $smarty->assign('title','Lista de Estudiantes');
  $smarty->assign('description','P&aacute;gina de Lista de Incritos');
  $smarty->assign('keywords','Gestion,Estudiantes');

  //CSS
  $CSS[]  = URL_CSS . "academic/tables.css";
  $CSS[]  = URL_JS . "box/box.css";  
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "jquery-ui-1.10.3.custom.min.js";
  $JS[]  = URL_JS ."box/jquery.box.js";
  
  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";
  $smarty->assign('JS',$JS);
  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/','name'=>'Configuraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'configuracion/'.basename(__FILE__),'name'=>'Ordenar Semestre');
  $smarty->assign("menuList", $menuList);

  $semestre=new Semestre();
  $semestre->getActivo();
  $smarty->assign("semestre", $semestre);
   
       $sql2 = "SELECT *
                FROM semestre se
                ORDER BY se.valor ASC";
   $resultsem = mysql_query($sql2);
   
  while ($row2 = mysql_fetch_array($resultsem, MYSQL_ASSOC)) {
       $semestreorden[] = $row2;
 }
  $smarty->assign("semestreorden", $semestreorden);

  //No hay ERROR
  $ERROR = ''; 
  $smarty->assign("ERROR",$ERROR);

}
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}
  $smarty->display('admin/copiarsemestre/full-width.ordenarsemestre.tpl');
?>