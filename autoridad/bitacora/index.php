<?php
try {
  define ("MODULO", "ADMIN-DOCENTE");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  

  
  $CSS[]  = "css/style.css";
  $smarty->assign('CSS','');

  $JS[]  = URL_JS . "jquery.min.js";
  $smarty->assign('JS',$JS);
  $smarty->assign('CSS',$CSS);
 
  
  
  
 //  no hay error
  
 
    /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.  Administrador::URL,'name'=>'ADMINISTRACI&Oacute;N');
  $menuList[]     = array('url'=>URL . Administrador::URL.'/bitacora' ,'name'=>'BITACORA');
  $smarty->assign("menuList", $menuList);
 
   $editores = ",
                {toolbar: [ 
                  [ 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink' ],
                  [ 'FontSize', 'TextColor', 'BGColor' ]]}";
  
    $smarty->assign("editores", $editores);
    
  
    
   
    
         /**
   * Menu central
   */
 
  
 
     
     
   

    
 
    
 $sqlr='SELECT r.* FROM  bitacora r ';
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();

 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
   { 
        
        $lista_areas=array();
        $lista_areas[] =  $fila["id"];
        $lista_areas[] =  $fila["operacion"];
        $lista_areas[] =  $fila["host"];
        $lista_areas[] =  $fila["modificado"];
        $lista_areas[] =  $fila["tabla"];
        $lista_areas[] =  $fila["tupla_antes"];
        $lista_areas[] =  $fila["tupla_despues"];
            
  $arraytribunal[]= $lista_areas;
  
 }
  $smarty->assign('listadocentes'  , $arraytribunal);
  
  //funcion para serializar
     function array_envia($url_array) 
           {
               $tmp = serialize($url_array);
               $tmp = urlencode($tmp);
               return $tmp;
           };
  $sql='r.operacion,r.host,r.modificado,r.tabla,r.tupla_antes,r.tupla_despues from  bitacora r';
  $smarty->assign('sql'  , array_envia($sql));
 
   
 
  
 $smarty->assign("ERROR", $ERROR);
  

  //No hay ERROR
  $smarty->assign("ERROR",'');
  
} 
catch(Exception $e) 
{
  $smarty->assign("ERROR", handleError($e));
}

$TEMPLATE_TOSHOW = 'admin/bitacora/bitacora.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>