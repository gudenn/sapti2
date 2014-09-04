
<?php
try {
    define ("MODULO", "DOCENTE");
  
  require('../_start.php');
  if(!isDocenteSession())
  header("Location: ../login.php"); 
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
  leerClase("Email");
  
 //  no hay error
  
  $smarty->assign("ERROR", '');
    /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL.Docente::URL,'name'=>'Asignaturas');
  $menuList[]     = array('url'=>URL . Docente::URL.'email' ,'name'=>'Envio de Email');
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
  $menus = $menu->getDocenteIndex($docente);
  $smarty->assign("menus", $menus);
  $smarty->assign("docente", $docente);
  $smarty->assign("ERROR", $ERROR);
     
     
    $valorh = $semestre->getValor('Número máximo de tribunal',10);
    if (!$valorh)
    {
      //  echo $valorh;
       $semestre->setValor('Número máximo de tribunal',10);
    }

    
   
 $sqlr='SELECT us.id as id, es.codigo_sis as codigosis, us.nombre as nombre, CONCAT(us.apellido_paterno," ",us.apellido_materno) as apellidos, pr.nombre as nombrep, us.email as mail
FROM dicta di, estudiante es, usuario us, inscrito it, proyecto pr, proyecto_estudiante pe
WHERE di.id=it.dicta_id
AND it.estudiante_id=es.id
AND es.usuario_id=us.id
AND pe.estudiante_id=es.id
AND pe.proyecto_id=pr.id
AND pr.es_actual=1
AND di.docente_id="'.$docente->id.'"';
 $resultado = mysql_query($sqlr);
 $arraytribunal= array();

 while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC)) {
        $doc = new Docente($fila["id"]);
        $listaareas = array();
        $lista_areas = array();
        $lista_areas[] = $fila["id"];
        $lista_areas[] = $fila["nombre"];
        $lista_areas[] = $fila["apellidos"];
        $lista_areas[] = $fila["mail"];

        $arraytribunal[] = $lista_areas;
    }
    $smarty->assign('listadocentes'  , $arraytribunal);
  $contenido = 'tribunal/registrotribunal.tpl';
  $smarty->assign('contenido',$contenido);
  


if(isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
 {
    
       $array=array();
        if (isset($_POST['seleccion'])) 
           {
            $seleccion=$_POST['seleccion'];
           if(count($seleccion)>0){
           foreach ($seleccion as $id){
              $array[]= new Usuario($id); 
               
           }
                       $usuarios=$array;
                       $asunto= Email::tipo_avance;
                       $mensaje= $_POST['detalle'];
                    
        //  $enviar= new Mail_enviar();
         // $enviar->enviar($array, "jaaaaaa","Hola mundo", $_POST['detalle']);
            require_once(DIR_MAILTPL.'mail_02.php');
          
   
     $EXITO = false;
    $stado=0;
    mysql_query("BEGIN");
    
    
     
    $EXITO = TRUE;
    $stado=1;
    mysql_query("COMMIT");
    
  if(isset($stado))
   {
   
          $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente la asignacion de tribunales','titulo'=>'Registro De Asignaci&oacute; de Tribunales' ,'icono'=> 'warning_48.png');
          $ERROR = $html->getMessageBox ($mensaje);
       
    }
    
    
        
     }else
 {
   $mensaje = array('mensaje' => 'Error,La Cantidad minima de Tribunales debe Ser 3', 'titulo' => 'Numero De Tribunales', 'icono' => 'warning_48.png');
    $ERROR = $html->getMessageBox($mensaje);;
 }
 }else
 {
     $mensaje = array('mensaje' => 'Hubo un problema, No se grabo correctamente la Asignacion de Tribunales', 'titulo' => 'Registro de Tribunales', 'icono' => 'warning_48.png');
    $ERROR = $html->getMessageBox($mensaje);
 }

 }
 


  $smarty->assign("ERROR",  $ERROR);
   
} 
catch(Exception $e) 
{
   
  $smarty->assign("ERROR", handleError($e));
}





$token = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token', $token);

$TEMPLATE_TOSHOW = 'docente/email/email.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>