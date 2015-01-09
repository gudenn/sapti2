{include file="estudiante/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
        <h1 class="title">Detalle de Avance</h1>

<!-- The file upload form used as target for the file upload widget -->
<form id="fileupload" action="../../estudiante/archivo/?estudiante_id={$estudiante->id}" method="POST" enctype="multipart/form-data">
    <!-- The table listing the files available for upload/download -->
    <h3><b>Archivos</b></h3>
    <table role="presentation"><tbody class="files"></tbody></table>
</form>
{literal}
<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade" style="display:none">
        <td>
            <span class="preview"></span>
        </td>
        <td>
            <p class="name">{%=file.name%}</p>
            {% if (file.error) { %}
                <div><span class="error">Error:</span> {%=file.error%}</div>
            {% } %}
        </td>
        <td>
            <p class="size">{%=o.formatFileSize(file.size)%}</p>
            {% if (!o.files.error) { %}
                <div class="progress" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"></div>
            {% } %}
        </td>
        <td>
            {% if (!o.files.error && !i && !o.options.autoUpload) { %}
                <button class="start">Subir</button>
            {% } %}
            {% if (!i) { %}
                <button class="cancel">Cancelar</button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade" style="display:none">
        <td>
            <span class="preview">
                {% if (file.thumbnailUrl) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                {% } %}
            </span>
        </td>
        <td>
            <p class="name">
                <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
            </p>
            {% if (file.error) { %}
                <div><span class="error">Error</span> {%=file.error%}</div>
            {% } %}
        </td>
        <td>
            <span class="size">{%=o.formatFileSize(file.size)%}</span>
        </td>
    </tr>
{% } %}
</script>
{/literal}
<!-- The Templates plugin is included to render the upload/download listings -->
<script src="{$URL_JS}jQfu/js/tmpl.min.js"></script>
<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="{$URL_JS}jQfu/js/load-image.min.js"></script>
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script src="{$URL_JS}jQfu/js/canvas-to-blob.min.js"></script>
<!-- blueimp Gallery script -->
<script src="{$URL_JS}jQfu/js/jquery.blueimp-gallery.min.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="{$URL_JS}jQfu/js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="{$URL_JS}jQfu/js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="{$URL_JS}jQfu/js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="{$URL_JS}jQfu/js/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="{$URL_JS}jQfu/js/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="{$URL_JS}jQfu/js/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="{$URL_JS}jQfu/js/jquery.fileupload-validate.js"></script>
<!-- The File Upload user interface plugin -->
<script src="{$URL_JS}jQfu/js/jquery.fileupload-ui.js"></script>
<!-- The File Upload jQuery UI plugin -->
<script src="{$URL_JS}jQfu/js/jquery.fileupload-jquery-ui.js"></script>
<!-- The main application script -->
<script src="{$URL_JS}jQfu/js/main.js"></script>
{literal}
<script>
// Initialize the jQuery UI theme switcher:
$('#theme-switcher').change(function () {
    var theme = $('#theme');
    theme.prop(
        'href',
        theme.prop('href').replace(
            /[\w\-]+\/jquery-ui.css/,
            $(this).val() + '/jquery-ui.css'
        )
    );
});
</script>
<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
{/literal}
        
        <h3><b>Porcentaje de Avance</b></h3>
        
        <p>
          {$avance->getPorcentaje()} %
        </p>
        {if (count($avance->avance_objetivo_especifico_objs))}
            <h4><b>Avance en los Objetivos espec&iacute;ficos</b></h4>
            {assign var='especificos' value=$avance->avance_objetivo_especifico_objs }
            <ul>
            {section name=oe loop=$especificos}
                <li>{$especificos[oe]->getDescripcion()} <b>{$especificos[oe]->porcentaje_avance} %</b></li>
            {/section}
            </ul>

        {/if}
        <h3><b>Descripci&oacute;n</b></h3>
        <p>
          {$avance->getDescripcion()}
        </p>
        {if $obsertabla=='si'}
        <h3><b>Observaciones Corregidas</b></h3>
        <form action="#" method="post" id="aprobado" name="aprobado" >
 <table class="tbl_lista">
  <thead>
    <tr>
      <th>Observaci&oacute;n    </th>
      <th>Respuesta      </th>
      <th>Estado         </th>
      <th>Opciones       </th>
    </tr>
  </thead>
  {section name=ic loop=$obser}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$obser[ic]['observacion']}</td>
      <td>{$observacion1->getRespuesta($obser[ic]['respuesta'])}</td>
      <td>{$observacion1->getEstadoObservacion($obser[ic]['estado_observacion'])}</td>
      <td>Aprobar: <input type="checkbox" name=seleccion[] value={$obser[ic]['id']} class="checkbox" ></td> 
    </tr>
  {/section}
    <tr class="{cycle values="light,dark"}">
      <td></td>
      <td></td>
      <td></td>
      <td>Marcar/Desmarcar Todo<input type="checkbox" id="marcar" value="" onclick="marcar_desmarcar();" /></td> 
    </tr>
  </tbody>
</table>
            <p>
              <input type="hidden" name="tarea" value="aprobar">
              <input type="hidden" name="token" value="{$token}">

              <input name="submit" type="submit" id="submit" value="Aprobar y Revisar">
              &nbsp;
              <input name="reset" type="reset" id="reset" tabindex="5" value="Resetear">
            </p>
</form>
      
      {else}
      <h3><b>Revisar Avance</b></h3>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
 <div>
                <br>
                <h3><b>Registre el porcentaje de avance del Proyecto {getHelpTip('Avance')}</b></h3>
                <input type="range" id="porcentaje" name="porcentaje" min="1" max="100" value="{$avance->getPorcentaje()}" style="width: 400px;">
                <output for="range" id="output">{$avance->getPorcentaje()}</output> %
            </div>
            <script>
                {literal}
                (function () {
                    var registro = document.getElementById("registro");
                    if ("oninput" in registro) {
                        registro.addEventListener("input", function () {
                            output.value = porcentaje.value;
                        }, false);
                    }
                })();
                {/literal}
            </script>
            <label  accesskey="">OBSERVACIÓN(ES):
            </label>
            <div id="div_1">
            </p>
            <input  type="text"  name="observaciones[]" id="observaciones[]" style="width:500px;" data-validation-engine="validate[required]"/> 
            <input class="bt_plus" id="1" type="button" value="Añadir Observación" />
            <div class="error_form"></div>
            </div>

            <p>
              <input type="text" name="fecha_revision" id="fecha_revision" value="{$revision->fecha_revision}" size="22"/>
              <label for="fecha_revision"><small>FECHA DE REVISIÓN</small></label>
            </p>

            <h2 class="title">Grabar Revisión</h2>
            <p>
              <input type="hidden" name="id" value="{$revision->id}">
              <input type="hidden" name="id" value="{$observacion->id}">
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">

              <input name="submit" type="submit" id="submit" value="Grabar">
              &nbsp;
              <input name="reset" type="reset" id="reset" tabindex="5" value="Resetear">
            </p>
          </form>
        </div>
        <p>{$ERROR}</p>
        <p>Todos los campos con (*) son obligatorios.</p>
        <script type="text/javascript">
        {literal} 
          $(function(){
            $('#fecha_revision').datepicker({
              dateFormat:'dd/mm/yy',
              changeMonth: true,
              changeYear: true,
        {/literal} 
              yearRange: "2010:{date('Y')+3}"
        {literal}
            });
          });
          jQuery(document).ready(function(){
            jQuery("#registro").validationEngine();
            var wo = 'bottomRight';
            jQuery('input').attr('data-prompt-position',wo);
            jQuery('input').data('promptPosition',wo);
            jQuery('textarea').attr('data-prompt-position',wo);
            jQuery('textarea').data('promptPosition',wo);
            jQuery('select').attr('data-prompt-position',wo);
            jQuery('select').data('promptPosition',wo);
          });
        {/literal} 
        </script>
      </div>
      {/if}
        <hr>
    {$ERROR}
    </div>
  </div>
</div>
{include file="footer.tpl"}
<script type="text/javascript">

function marcar_desmarcar(){
var marca = document.getElementById('marcar');
var cb = document.getElementsByName('seleccion[]');
 
for (i=0; i<cb.length; i++){
if(marca.checked == true){
cb[i].checked = true
}else{
cb[i].checked = false;
}
}
}

</script>