<?php
try {
  define ("MODULO", "ADMIN-DOCENTE");
  require('../_start.php');
  if(!isAdminSession())
    header("Location: ../login.php");
  
  leerClase("Dicta");
  leerClase("Docente");
  leerClase("Materia");
  leerClase("Semestre");

  /** HEADER */
  $smarty->assign('title','Proyecto Final');
  $smarty->assign('description','Proyecto Final');
  $smarty->assign('keywords','Proyecto Final');

  $CSS[]  = URL_CSS . "academic/3_column.css";
  $CSS[]  = URL_JS  . "/validate/validationEngine.jquery.css";
    //BOX
  $CSS[]  = URL_JS . "box/box.css";
  $smarty->assign('CSS',$CSS);

  //JS
  $JS[]  = URL_JS . "jquery.min.js";

  //Validation
  $JS[]  = URL_JS . "validate/idiomas/jquery.validationEngine-es.js";
  $JS[]  = URL_JS . "validate/jquery.validationEngine.js";
    //BOX
  $JS[]  = URL_JS ."box/jquery.box.js";
  $smarty->assign('JS',$JS);

  /**
   * Menu superior
   */
  $menuList[]     = array('url'=>URL . Administrador::URL , 'name'=>'Administraci&oacute;n');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'docente/','name'=>' Docentes');
  $menuList[]     = array('url'=>URL . Administrador::URL . 'docente/'.basename(__FILE__),'name'=>'Gesti&oacute;n de Materias');
  $smarty->assign("menuList", $menuList);  
  
  $semestre=new Semestre();
  $semestre->getActivo();

  ////////////CARGANDO COMBOBOX///////////
  $sqlmateria="SELECT DISTINCT(materia.id), materia.nombre
FROM materia, codigo_grupo
WHERE NOT EXISTS (
SELECT *
FROM dicta di, materia ma, codigo_grupo cg, semestre se
WHERE di.materia_id=ma.id
AND di.codigo_grupo_id=cg.id
AND materia.id=ma.id
AND di.semestre_id=se.id
AND se.activo=1
AND codigo_grupo.id=cg.id)
    ";
 $resultadomateria = mysql_query($sqlmateria);
    $materia_values[] = '';
    $materia_output[] = '- Seleccione Materia -';
 while ($filamateria = mysql_fetch_array($resultadomateria, MYSQL_ASSOC)){
    $materia_values[] = $filamateria['id'];
    $materia_output[] = $filamateria['nombre'];
 }

  $sqldoc="SELECT dc.id as id, CONCAT(us.titulo_honorifico,' ',us.apellido_paterno,' ', us.apellido_materno,' ', us.nombre) as nombre
FROM usuario us, docente dc
WHERE us.id=dc.usuario_id
AND us.estado='AC'
AND dc.estado='AC'
    ";
 $resultadodoc = mysql_query($sqldoc);
    $docentes_values[] = '';
    $docentes_output[] = '- Seleccione Docente -';
 while ($filadoc = mysql_fetch_array($resultadodoc, MYSQL_ASSOC)){
    $docentes_values[] = $filadoc['id'];
    $docentes_output[] = $filadoc['nombre'];
 }
 
    $smarty->assign('semestre'  , $semestre);
    $smarty->assign('docentes_values'  , $docentes_values);
    $smarty->assign('docentes_output'  , $docentes_output);
    $smarty->assign('docentes_selected'  , '');
    $smarty->assign('materia_values'  , $materia_values);
    $smarty->assign('materia_output'  , $materia_output);
    $smarty->assign('materia_selected'  , '');
    
    if (isset($_POST['tarea']) && $_POST['tarea'] == 'registrar' && isset($_POST['token']) && $_SESSION['register'] == $_POST['token'])
  {
        $EXITO = false;
        if($_POST['docente_id']>0 &&$_POST['materia_id']>0){
    mysql_query("BEGIN");
     $dicta=new Dicta();
     $dicta->objBuidFromPost();
     $dicta->estado = Objectbase::STATUS_AC;
      $dicta->docente_id       = $_POST['docente_id'];
      $dicta->materia_id       = $_POST['materia_id'];
      $dicta->semestre_id      = $semestre->id;
      $dicta->codigo_grupo_id  = $_POST['grupo_id'];
     $dicta->save();
    $EXITO = TRUE;
    mysql_query("COMMIT");
        }
  }
    //No hay ERROR
  leerClase('Html');
  $html  = new Html();
  if (isset($EXITO))
  {
    $html = new Html();
    if ($EXITO)
      $mensaje = array('mensaje'=>'Se grabo correctamente el Grupo','titulo'=>'Grupo' ,'icono'=> 'tick_48.png');
    else
      $mensaje = array('mensaje'=>'Hubo un problema, No se grabo correctamente el Grupo','titulo'=>'Registro de Grupo' ,'icono'=> 'warning_48.png');
   $ERROR = $html->getMessageBox ($mensaje);
  }
if (isset($_GET['eliminar']) && isset($_GET['dicta_id']) && is_numeric($_GET['dicta_id']) )
  {
    $dictaborrar = new Dicta($_GET['dicta_id']);
    $dictaborrar->delete();
  }
  
 $sql="SELECT di.id as id, se.codigo as semestre, CONCAT(us.titulo_honorifico,' ',us.apellido_paterno,' ', us.apellido_materno,' ', us.nombre) as nombre, ma.nombre as materia, cg.nombre as grupo
FROM dicta di, docente dc, usuario us, materia ma, semestre se, codigo_grupo cg
WHERE di.docente_id=dc.id
AND dc.usuario_id=us.id
AND di.materia_id=ma.id
AND di.semestre_id=se.id
AND di.codigo_grupo_id=cg.id
AND se.activo=1
ORDER BY ma.nombre, cg.nombre";
 $resultado = mysql_query($sql);
  while ($fila = mysql_fetch_array($resultado)) 
                {
    $tabla[]=$fila;
 }

  $smarty->assign("tabla", $tabla);
 
  //No hay ERROR
  $smarty->assign("ERROR",$ERROR);
  
} 
catch(Exception $e) 
{
  mysql_query("ROLLBACK");
  $smarty->assign("ERROR", handleError($e));
}

$token                = sha1(URL . time());
$_SESSION['register'] = $token;
$smarty->assign('token',$token);

$TEMPLATE_TOSHOW = 'admin/dicta/configuracion.dicta.tpl';
$smarty->display($TEMPLATE_TOSHOW);

?>




