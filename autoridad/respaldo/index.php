
<?php
try {
     define ("MODULO", "ADMIN-INDEX");
  require('../_start.php');
  //require '../../../..';
  //if(!isAdminSession())
  //header("Location: ../login.php"); 
  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');
  $CSS[]  = URL_JS . "ui/overcast/jquery-ui.css";
  $CSS[]  = URL_JS . "jQfu/css/jquery.fileupload-ui.css";
  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_CSS . "spams.css";
  $CSS[]  = URL_JS  . "validate/validationEngine.jquery.css";

  
   
  
  $JS[]  = URL_JS . "jquery.min.js";
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";
  $JS[]  = URL_JS . "validate/jquery.validate.min.js";

    
   $CSS[]  = URL_JS . "box/box.css";
   $JS[]  = URL_JS ."box/jquery.box.js";
  //CK Editor
  $JS[]  = URL_JS . "ckeditor/ckeditor.js";
  //BOX
  $smarty->assign('CSS',$CSS);
  $smarty->assign('JS',$JS);

  //Leendo las clases para 
  leerClase('Tribunal');
  leerClase("Proyecto");
  leerClase("Usuario");
  leerClase("Docente");
  leerClase("Estudiante");
  leerClase("Formulario");
  leerClase("Pagination");
  leerClase("Filtro");
  leerClase("Proyecto_estudiante");
  leerClase("Notificacion");
  leerClase("Notificacion_tribunal");
  leerClase("Automatico");
  leerClase("Consejo");
  leerClase("Semestre");
  leerClase("Mail_enviar");
  leerClase("Dia");
  leerClase('Html');
  leerClase("Respaldo");
  
 //  no hay error
  
  $smarty->assign("ERROR", '');
    /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.  Administrador::URL,'name'=>'ADMINISTRACI&Oacute;N');
  $menuList[]     = array('url'=>URL . Administrador::URL.'respaldo' ,'name'=>'BACKUP');
  $smarty->assign("menuList", $menuList);
 
   $editores = ",
                {toolbar: [ 
                  [ 'Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink' ],
                  [ 'FontSize', 'TextColor', 'BGColor' ]]}";
  
    $smarty->assign("editores", $editores);
    $diass= new Dia();
    $smarty->assign("diass", $diass);
    $html = new Html();
    
     $semestre = new Semestre('',1);
    
         /**
   * Menu central
   */
  $docente = getSessionDocente(); 
  leerClase('Menu');
  $menu = new Menu('');
   leerClase('Menu');
  $menu = new Menu('');
  $menus = $menu->getAdminIndex();
  $smarty->assign("menus", $menus);
    $smarty->assign("ERROR", $ERROR);
     
     
    $valorh = $semestre->getValor('Número máximo de tribunal',10);
    if (!$valorh)
    {
      //  echo $valorh;
       $semestre->setValor('Número máximo de tribunal',10);
    }

    
 //  $respaldos= new Respaldo();


//mysql --password=tuclave --user=tuusuario -h 192.168.1.134 basedatos < respaldo.sql

if(isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
 {
      
     $EXITO = false;
    $stado=0;
    mysql_query("BEGIN");
        /* Store All Table name in an Array */
$allTables = array();
$result = mysql_query('SHOW TABLES');
while($row = mysql_fetch_row($result)){
     $allTables[] = $row[0];
}

foreach($allTables as $table){
$result = mysql_query('SELECT * FROM '.$table);
$num_fields = mysql_num_fields($result);

$return.= 'DROP TABLE IF EXISTS '.$table.';';
$row2 = mysql_fetch_row(mysql_query('SHOW CREATE TABLE '.$table));
$return.= "\n\n".$row2[1].";\n\n";

for ($i = 0; $i < $num_fields; $i++) {
while($row = mysql_fetch_row($result)){
   $return.= 'INSERT INTO '.$table.' VALUES(';
     for($j=0; $j<$num_fields; $j++){
       $row[$j] = addslashes($row[$j]);
       $row[$j] = str_replace("\n","\\n",$row[$j]);
       if (isset($row[$j])) { $return.= '"'.$row[$j].'"' ; } 
       else { $return.= '""'; }
       if ($j<($num_fields-1)) { $return.= ','; }
     }
   $return.= ");\n";
}
}
$return.="\n\n";
}

// Create Backup Folder
$folder = 'respaldo/';
if (!is_dir($folder))
mkdir($folder, 0777, true);
chmod($folder, 0777);

$date = date('m-d-Y-H-i-s', time()); 
$filename = $folder."db-backup-".$date; 

$handle = fopen($filename.'.sql','w+');
fwrite($handle,$return);
fclose($handle);
  

    $respaldo= new Respaldo();
    $respaldo->fecha_respaldo=  date("j/n/Y H:i:s");
    $respaldo->archivo=$filename.'.sql';
   $respaldo->save();
    
     
      
 
    
    
     
    $EXITO = TRUE;
    $stado=1;
    mysql_query("COMMIT");
    

     $ERROR = '';
  leerClase('Html');
  $html  = new Html();
  if (isset($stado) &&$stado==1)
  {
      
    $html = new Html();
    $mensaje = array('mensaje'=>'No tiene permiso de acceder a este M&oacute;dulo','titulo'=>'No Tiene Permiso' ,'icono'=> 'warning_48.png');
    $ERROR = $html->getMessageBox ($mensaje);
   // sleep(50);
  }  else {
       $html = new Html();
    $mensaje = array('mensaje'=>'No tiene permiso de acceder a este M&oacute;dulo','titulo'=>'No Tiene Permiso' ,'icono'=> 'warning_48.png');
    $ERROR = $html->getMessageBox ($mensaje);
      
  }
  $smarty->assign("ERROR",$ERROR);
    
 
 
 }
    
 $sqlr='SELECT r.* FROM  respaldo r ORDER BY r.fecha_respaldo DESC';
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();

 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) 
   { 
        
        $lista_areas=array();
        $lista_areas[] =  $fila["id"];
        $lista_areas[] =  $fila["fecha_respaldo"];
        $lista_areas[] =  $fila["archivo"];
            
  $arraytribunal[]= $lista_areas;
  
 }
  $smarty->assign('listadocentes'  , $arraytribunal);
  $contenido = 'tribunal/registrotribunal.tpl';
  $smarty->assign('contenido',$contenido);
  
   
 
  


  $smarty->assign("ERROR",  $ERROR);
   
} 
catch(Exception $e) 
{
    
  $smarty->assign("ERROR", handleError($e));
}
$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);

$TEMPLATE_TOSHOW = 'admin/respaldo/respaldo.tpl';
$smarty->display($TEMPLATE_TOSHOW);


?>