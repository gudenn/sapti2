<?php
  require_once("../_sistema.php");
  leerClase('Usuario');
  leerClase('Notificacion');
  leerClase("Docente");
  echo "Error";
  //leerClase('Mail');
//$usuarios = array();
  global  $docente,$usuarios,$mensaje,$asunto,$notificacion;
  $docente  = getSessionDocente();
  if (!isset($docente) || !isset($docente->id) || !($docente->id))
    
  if (!isset($notificacion) || !isset($notificacion->id) || !($notificacion->id) )
    $notificacion = new Notificacion(1);

  $style = "font-family: Verdana,Arial;font-size: 12px;"; 
  $date = date("F j, Y, g:i a");  ;
  
    /** Cuerpo del Email */
 // require_once("mail_01.php");

  /** destinatarios */
  //$url_name = $MATERIA->getTheUrlNAME(1);
 // $url_mail = str_replace('www.', '', $url_name);
  
 // $almacen   = new Almacen();
//  $almacen->pais_id = $estudiante->pais_id;
 // $almacenes = $almacen->getAll();
  //while ($row = mysql_fetch_array($almacenes[0])) 
  //{
  //  $administrador = new Administrador($row['administrador_id']);
 //   if ( trim($administrador->email) != '' )
   //   $to_addrs[]    = $administrador->email;
 //}
// foreach ($usuarios as $user)
     
  {
   //    $to_addrs[] = $user->email;
  
  }
  
 
  
  //$Subject = "$url_name ingreso de mercaderia ";
  
  $body_html = <<<___MAIL
    <div style="$style">
    Estimado/a <b>  estudiante </b>:<br>
    <br><br>
   {$notificacion->detalle}

    Fecha: {$date}<br>
    </div>
___MAIL;

  $detalleTXT = strip_tags($notificacion->detalle);
  $body_txt  = "    
    Estimado/a 
    Hemos registrado correccion {}
    

   

    Fecha:  \t  {$date}";



  if (ENDESARROLLO)
  {
    echo "<pre>";
    print_r($almacenes);
    echo "</pre>";
    echo "<hr>";
    echo "Subject:$Subject";
    echo "<hr>";
    echo "<pre>";
    print_r($to_addrs);
    echo "</pre>";
    echo "<hr>";
    echo $body_html;
    echo "<hr>";
    echo "<pre>".$body_txt."</pre>";
  }
  else /** Enviamos el email */
  {
    require_once(DIR_LIB.'/Mail/mime.php');
    

      $message = new Mail_mime();
      $message->setTXTBody($body_txt);
      $message->setHTMLBody($body_html);
      $body = $message->get();
      $extraheaders = array(
          'From'    => "\"$url_name\"<envios@$url_mail>",
          'Subject' => $Subject
      );
      $headers = $message->headers($extraheaders);
      $mail    = Mail::factory('sendmail');//, $smtpinfo);

      foreach ($to_addrs as $to_addr)
      {
          $rv1 = $mail->send($to_addr, $headers, $body);
      }

  }

?>