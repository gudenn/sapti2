<?php
try {
  define ("MODULO", "ADMIN-HELPDESK");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");  


  leerClase('Administrador');
  leerClase('Tooltip');
  leerClase('Html');

  //CREAR 
  leerClase('Tooltip');
  $smarty->assign('columnacentro','admin/tooltip/registro.tpl');
  
  
  
  if (isset($_POST['tooltip_id']) && isset($_POST['titulo']) && isset($_POST['descripcion']))
  {
    $EXITO = false;
    mysql_query("BEGIN");
    $id = '';
    if (isset($_POST['tooltip_id']))
      $id = $_POST['tooltip_id'];
    $tooltip = new Tooltip($id);
    //Primero lo grabamos grabamos si es que hay post
    $tooltip->objBuidFromPost();
    $tooltip->estado = Objectbase::STATUS_AC;
    $tooltip->validar();
    if ( $tooltip->estado_tooltip != Tooltip::EST02_APROBA)
      $tooltip->estado_tooltip = Tooltip::EST02_APROBA;
    leerClase('Administrador');
    leerClase('Usuario');
    $editar  = false;
    $usuario = getSessionUser();
    if ( isset($usuario->id) && $usuario->id)
    {
      $permiso = $usuario->getPermiso('ADMIN-HELPDESK');
      if ($permiso['ver'])
      {
        $tooltip->mostrar = true;
        if ($_POST['ocultar'] == 'true' )
          $tooltip->mostrar = false;
                
        $tooltip->save();
        if ($_POST['actualizar'] == 'true' )
          $tooltip->actualizarPorMismoCodigo();
      }
    }
      
    $EXITO = TRUE;
    mysql_query("COMMIT");
  }
  
} 
catch(Exception $e) 
{
  mysql_query("ROLLBACK");
  exit('FALSE');
}

echo 'TRUE';

?>