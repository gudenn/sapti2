<?php
 
  leerClase('Usuario');
  leerClase('Notificacion');
  leerClase("Docente");
  leerClase("Email");

  global  $docente,$usuarios,$asunto,$mensaje,$notificacion;
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
  
  $mensajes_envio=array();
 foreach ($usuarios as $user)
     
  { 
    $email= new Email();
    $email->para=$user->email;
    $email->boddy_html =<<<___MAIL
    <div style="$style">
    Hola Estimado/a <b>$user->nombre $user->apellido_paterno</b>:<br>
    <br><br>
   Asunto : {$asunto}
      <br><br>
    {$mensaje}
    Fecha: {$date}<br>
    </div>
___MAIL;
    
    $email->boddy_txt= "    
   Hola  Estimado/a $user->nombre $user->apellido_paterno:
    
    Detalle:
    ------------------------------
    Detalle:\t\t{$asunto}
    Comentario:\t{$mensaje}
    ------------------------------
    Fecha:  \t  {$date}";
    

    $mensajes_envio[]= $email;
    
  //$to_addrs[] = $user->email;
  
  }
  
 
  
  //$Subject = "$url_name ingreso de mercaderia ";
  
 

  $detalleTXT = strip_tags($notificacion->detalle);
  $body_txt  = "    
    Estimado/a 
    Hemos registrado correccion {}
  
    Fecha:  \t  {$date}";
   $url_name="";
 $Subject = "$url_name ingreso de mercaderia ";


  if (ENDESARROLLO)
  {
    echo "<pre>";
    echo "</pre>";
    echo "<hr>";
    echo "Subject:$Subject";
    echo "<hr>";
    echo "<pre>";
    print_r($mensajes_envio);
    echo "</pre>";
    echo "<hr>";
  //  echo $body_html;
    echo "<hr>";
   // echo "<pre>".$body_txt."</pre>";
  }
  else /** Enviamos el email */
  {
    require_once(DIR_LIB.'/Mail/mime.php');
    

      $message = new Mail_mime();

      $extraheaders = array(
          'From'    => "\"$url_name\"<info@$url_mail>",
          'Subject' => $Subject
      );
      $headers = $message->headers($extraheaders);
      $mail    = Mail::factory('sendmail');//, $smtpinfo);

      foreach ($mensajes_envio as $enviar)
      {
       $message->setTXTBody($enviar->boddy_txt);
      $message->setHTMLBody($enviar->boddy_html);
      $body = $message->get();
      
          $rv1 = $mail->send($enviar->para, $headers,$body);
      }

  }

?>