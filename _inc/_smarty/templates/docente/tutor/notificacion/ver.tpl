<div id="content">
   <div class='contenido'>
 <div class="clear"></div>
 <form action="" method="post" >
  <p>SEÑOR</p>
   <p>{$docente->getNombreCompleto()}</p>
   <p>{$detalle}</p>
   <input type="hidden"  name="idproyectotutor" value="{$proyectotutor}" /><br />

   <select name=accion>
   {html_options options=$accion}
  </select>
  
       <div>
        Observaci&oacute;n<br/>
        <textarea name="descripcion" rows="4" style="width: 90%"></textarea>
      </div>
   
        <div style="text-align: center">
        <input type="hidden" name="id" value="" />
        <input type="hidden" name="salida_id" value="25" />
        <input type="submit" value="grabar" name="tarea" class="sendme"  />
        </div>
 </form>
   </div>
  </div>    
