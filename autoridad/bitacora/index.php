
<?php
try {
     define ("MODULO", "ADMIN-BITACORA");
  require('../_start.php');
  if(!isUserSession())
    header("Location: ../login.php");
  /** HEADER */
   /** HEADER */
 
/**
   * Menu superior
   */
  
  
  $CSS[]  = "css/style.css";
  $smarty->assign('CSS','');

    
   $CSS[]  = URL_JS . "box/box.css";
   $JS[]  = URL_JS ."box/jquery.box.js";
  //CK Editor
  $JS[]  = URL_JS . "ckeditor/ckeditor.js";
  //BOX
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);

  
  
  
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
 
   
 
  


  $smarty->assign("ERROR",  $ERROR);
   
} 
catch(Exception $e) 
{
    
  $smarty->assign("ERROR", handleError($e));
}


$TEMPLATE_TOSHOW = 'admin/bitacora/bitacora.tpl';
$smarty->display($TEMPLATE_TOSHOW);


?>