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
  leerClase('Helpdesk');
  if(!isAdminSession())
    header("Location: ../../index.php");  

  $help = new Helpdesk($_SESSION['helpdesk_id']);
  

error_reporting(E_ALL | E_STRICT);
require('UploadHandler.php');

$options = array(
            'upload_dir' => PATH.'/'.  Helpdesk::FOLDER.'/imagenes/'.$help->codigo.'/',
            'upload_url' => URL .'/'.  Helpdesk::FOLDER.'/imagenes/'.$help->codigo.'/',
            //'user_dirs' => false,
            'mkdir_mode' => MKDIRMMODE,
            'param_name' => 'files',
        );
$upload_handler = new UploadHandler($options);
