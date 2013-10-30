<?php
try {
  define ("MODULO", "VISITA");
  require('_start.php');

  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Bienvenido a SAPTI');
  $smarty->assign('keywords','Proyecto Final');
 $CSS[]  = URL_CSS . "dashboard.css";
 $CSS[]  = URL_CSS . "acordion.css";
  //CSS
  $CSS[]  = "css/style.css";

  //JS
  $JS[]  = "js/jquery.js";

  //BOX
  $CSS[] = URL_JS . "box/box.css";
  $JS[]  = URL_JS . "box/jquery.box.js";
  
  
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);
  leerClase('Menu');
  
  $menus  = array();
  $menu = new Menu('Defensas');
  $link = "";
  $menu->agregarItem('Fechas de Defensa',' Lista de Defensas ','tribunal.png',$link);
   
    $menus[] = $menu;
    $smarty->assign("menus", $menus);

        $sqlr="SELECT  u.nombre, u.apellido_paterno, u.apellido_materno, p.nombre as nombreproyecto, l.nombre as nombrelugar, d.fecha_defensa, d.hora_inicio,d.hora_final
from   usuario  u, estudiante  e, proyecto_estudiante  pe , proyecto p , defensa  d , lugar l
where   u.id=e.usuario_id and e.id=pe.estudiante_id  and pe.proyecto_id=p.id
and p.id=d.proyecto_id and d.tipo_defensa='DPU' and p.estado_proyecto='LD'
and d.lugar_id= l.id  and d.fecha_defensa <= NOW()
ORDER  by   d.`fecha_defensa`  DESC;";
 $resultado = mysql_query($sqlr);
 $arraydefensa= array();

 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
   { 
     $arraydefensa[]= $fila;
       
   }
  $smarty->assign('listadefensas'  ,  $arraydefensa);
  
  
  if (isset($_GET['notienepermiso']))
    $smarty->assign("sinpermiso",1);
  
  $ERROR = '';
  $smarty->assign("ERROR",$ERROR);
  

  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'index.academic.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>