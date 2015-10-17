

<div id="content">
  <div class="clear"></div>
  <div class='contenido'>
    <a class="sendme" href="javascript:history.back()" >Atras</a></br></br>
    <h1> Fecha de Env&iacute;o</h1>
    <p>{$notificacion->fecha_envio}</p>

    <p>Asunto</p>
    <p>{$notificacion->asunto}</p>

    <p>Detalle</p>
    <p>{$mensaje}</p>
    {if ($notificacion->tipo!=$tiponotificacion && $notificacion->tipo!=$tiponotificacion1)}
    {if $secionUser=='ES'}
        {if $tip=='CR'}
            <a href="../proyecto-final/observacion.gestion.php?revision_id={$link1}" class="sendme">Corregir Observaciones</a>
        {else}
            <a href="../proyecto-final/avance.detalle.php?avance_id={$link1}" class="sendme">Ver Avance</a>
        {/if}
    {/if}
    {if $secionUserd=='DO'}
        {if $tip=='CO'}
        <a href="../revision/revision.lista.php?iddicta={$idicta}&estudiente_id={$estudiante->id}" class="sendme">Revisar Correcciones de Docente</a>
        {else}
            <a href="../revision/revision.lista.php?iddicta={$idicta}&estudiente_id={$estudiante->id}" class="sendme">Revisi&oacute;n Docente</a>
            {/if}
    {/if}
    {if $secionUsert=='TU'}
        {if $tip=='CO'}
        <a href="../tutor/revision.corregido.lista.php?estudiente_id={$estudiante->id}" class="sendme">Revisar Correcciones de Tutor</a>
        {else}
            <a href="../tutor/revision.lista.php?id_estudiante={$estudiante->id}" class="sendme">Revisi&oacute;n Tutor</a>
            {/if}
    {/if}
    {if $secionUsertr=='TR'}
        {if $tip=='CO'}
            <a href="../tribunal/revision.corregido.lista.php?estudiente_id={$estudiante->id}" class="sendme">Revisar Correcciones de Tribunal</a>
        {else}
            <a href="../tribunal/revision.lista.php?estudiente_id={$estudiante->id}" class="sendme">Revisi&oacute;n Tribunal</a>
            {/if} 
    {/if}
    {/if}
    {if ($notificacion->tipo)==$tiponotificacion && $secionUser!='ES'}
        {if $proyecto->tipo_proyecto=="PR"}
           <a href="../../autoridad/detalle/proyecto.pdf.php?estudiante_id={$estudiante->id}" target="_blank" >{icono('basicset/filepd.png','Descargar Pdf')} Pdf ver Tema</a>
        {/if}
    {/if}
{if ($estadonotificacion)=="Pendiente"}
    {if ($notificacion->tipo)==$tiponotificacion && $secionUser!='ES'}
      <form action="" method="post" >
        <select name=accion>
          {html_options options=$accion}
        </select><br/>
          <div>
          Detalle<br/>
          <textarea name="detalle" rows="4" style="width: 90%"></textarea>
        </div>

        <div style="text-align: center">
          <input type="hidden"  id="id_notificacion" name="id_notificacion" value="{$notificacion->id}" />
          <input type="hidden" name="tarea" value="registrar">
          <input type="hidden" name="token" value="{$token}">
          <input name="submit" type="submit" id="submit" value="Grabar"  style="text-align: center">
        </div>

      </form>
    {/if}
    {/if}
  </div>
</div>
<p>{$ERROR}</p>


