{include file="admin/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container" >
      <h1 class="title">Subir im&aacute;genes para conformar el tema de Ayuda</h1>
<!-- The file upload form used as target for the file upload widget -->
<form id="fileupload" action="{$URL}{Helpdesk::FOLDER}/imagenes/" method="POST" enctype="multipart/form-data">
    <!-- Redirect browsers with JavaScript disabled to the origin page -->
    <noscript><input type="hidden" name="redirect" value="{$URL}"></noscript>
{literal}
    <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
    <div class="fileupload-buttonbar">
        <div class="fileupload-buttons">
            <!-- The fileinput-button span is used to style the file input field as button -->
            <span class="fileinput-button">
                <span>Add files...</span>
                <input type="file" name="files[]" multiple>
            </span>
            <button type="submit" class="start">Subir Archivos</button>
            <button type="reset" class="cancel">Cancelar</button>
            <button type="button" class="delete">Borrar</button>
            <input type="checkbox" class="toggle">
            <!-- The loading indicator is shown during file processing -->
            <span class="fileupload-loading"></span>
        </div>
        <!-- The global progress information -->
        <div class="fileupload-progress fade" style="display:none">
            <!-- The global progress bar -->
            <div class="progress" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
            <!-- The extended global progress information -->
            <div class="progress-extended">&nbsp;</div>
        </div>
    </div>
    <!-- The table listing the files available for upload/download -->
    <table role="presentation"><tbody class="files"></tbody></table>
</form>
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
        <td>
            <button class="delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>Borrar</button>
            <input type="checkbox" name="delete" value="1" class="toggle">
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

<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
{/literal}
      <p>Formulario de registro de Temas de Ayuda</p>
      <div id="respond">

        <form action="#" method="post" id="registro" name="registro" >
          <!--<p>
            <span><b>{$helpdesk->codigo}</b></span>
            <label for="codigo"><small>Codigo de helpdesk (*)</small></label>
          </p>-->
          <p>
            <textarea name="descripcion" id="descripcion" style="width: 308px;height: 30px;" data-validation-engine="validate[required]">{$helpdesk->descripcion}</textarea>
            <label for="descripcion"><small>descripci&oacute;n (*)</small></label>
          </p>
          <h2 class="title">Contenido del tema de ayuda (*)</h2>
          <p>
            <textarea name="contenido" id="contenido"  data-validation-engine="validate[required]">{if ($template)}{$template}{/if}</textarea>
          </p>
          <script>
            CKEDITOR.replace('contenido');
          </script>          <h2 class="title">Grabar Helpdesk</h2>
          <p>
            <input type="text" name="keywords" id="keywords" value="{$helpdesk->keywords}"  data-validation-engine="validate[required]">
            <label for="codigo"><small>Palabras Clave para Busquedas(*)</small></label>
          </p>
          <p>
            <input type="hidden" name="id"    value="{$helpdesk->id}">
            <input type="hidden" name="tarea" value="registrar">
            <input type="hidden" name="token" value="{$token}">
            <input name="submit" type="submit" id="submit" value="Grabar">
            &nbsp;
            <input name="reset" type="reset" id="reset" tabindex="5" value="Cancelar">
          </p>
        </form>


            
      </div>
      <p>{$ERROR}</p>
      <p>Todos los campos con (*) son obligatorios.</p>
      <script type="text/javascript">
      {literal} 
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
  {$ERROR}
  </div>
  {$ERROR}
</div>

{include file="footer.tpl"}