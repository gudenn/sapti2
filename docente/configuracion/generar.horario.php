<?php //
try {
  define ("MODULO", "DOCENTE");
  require('../_start.php');
  
if(!isDocenteSession())
    header("Location: ../login.php"); 

  /** HEADER */
  $smarty->assign('title','SAPTI - Registro Horarios');
  $smarty->assign('description','Horarios Disponibles para las Defensas');
  $smarty->assign('keywords','SAPTI,Materia,Registro');

  leerClase('Administrador');
  leerClase('Hora');
  leerClase('Docente');
  leerClase('Dia');
  leerClase('Horario_docente');
  
  
  $diass= new Dia();
  $docente=  getSessionDocente();
  
  $smarty->assign("diass", $diass);
  $smarty->assign("iddocente", $docente->id);
  
  $CSS[] = URL_CSS . "check.css";

  $smarty->assign('CSS', $CSS);
  
  
  /**
   * Menu superior
   */
  $menuList[] = array('url' => URL . Docente::URL, 'name' => 'Docente');
  $menuList[] = array('url' => URL . Docente::URL.'configuracion/' . basename(__FILE__), 'name' => 'Tiempo');
  $smarty->assign("menuList", $menuList);

  $smarty->assign('header_ui','1');


  $smarty->assign("ERROR", '');
  $smarty->assign('columnacentro','admin/dia/horario.tpl');
  

  if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token']  )
  {
       $docente->iniciarHorario();
    
     if(isset($_POST['hora_id'])  && sizeof($_POST['hora_id'])>0)
     {
     
        foreach ($_POST['hora_id'] as $id)
        {
          
         $horariodocente= new Horario_docente();
         $horariodocente->docente_id= $docente->id;
         $horariodocente->hora_id=$id;
         $horariodocente->estado=  Objectbase::STATUS_AC;
         $horariodocente->save();
        
          
        }
     }
   
  }
  
  
  
} 
catch(Exception $e) 
{
  mysql_query("ROLLBACK");
  $smarty->assign("ERROR", handleError($e));
}

$token                = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token',$token);

$TEMPLATE_TOSHOW = 'admin/2columnas.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>