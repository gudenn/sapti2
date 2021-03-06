<?php
/*
 * jQuery File Upload Plugin PHP Example 5.14
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2010, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */
  require_once("../../_inc/_sistema.php");
  leerClase('Estudiante');
  if(!isUserSession())
    header("Location: ../../login.php");  

  leerClase('Usuario');
  leerClase('Estudiante');

  $id = '';
  if (isset($_GET['estudiante_id']) && is_numeric($_GET['estudiante_id']) )
    $id = $_GET['estudiante_id'];
    
  $estudiante = new Estudiante($id);
  if (!$id && isEstudianteSession())
  {
    $estudiante = getSessionEstudiante();
  }
  $proyecto = $estudiante->getProyecto(); 
  //var_dump($estudiante);
  //var_dump($proyecto);
  

error_reporting(E_ALL | E_STRICT);
require('UploadHandler.php');

$options = array(
            'upload_dir' => PATH.Estudiante::ARCHIVO_PATH.Proyecto::ARCHIVO_PATH.'/'.$estudiante->codigo_sis.'/'.$proyecto->getFolder().'/'.$_SESSION['avancedirectorio'].'/',
            'upload_url' => URL.Estudiante::ARCHIVO_PATH.Proyecto::ARCHIVO_PATH.'/'.$estudiante->codigo_sis.'/'.$proyecto->getFolder().'/'.$_SESSION['avancedirectorio'].'/',
            //'user_dirs' => false,
            'mkdir_mode' => MKDIRMMODE,
            'param_name' => 'files',
        );
$upload_handler = new UploadHandler($options);
