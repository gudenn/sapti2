{if (isset($header_ui))}
  {include file="admin/header-ui.tpl"}
{else}
  {include file="admin/header-sjq.tpl"}
{/if}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container" >
      <p>Formulario de registro de Modelo de Carta</p>
      <div id="respond">

        <form action="#" method="post" id="registro" name="registro" >
          <p>
            <select name="tipo_proyecto" id="tipo_proyecto"  data-validation-engine="validate[required]" >
             {html_options values=$tipo_values output=$tipo_output selected=$modelo_carta->tipo_proyecto}
            </select>
             <label for="tipo_proyecto"><small>Se aplicar&aacute; a proyectos del tipo (*) {getHelpTip('tipo_proyecto')}</small></label>
          </p>
          <p>
            <select name="estado_proyecto" id="estado_proyecto"  data-validation-engine="validate[required]" >
             {html_options values=$estado_values output=$estado_output selected=$modelo_carta->estado_proyecto}
            </select>
             <label for="estado_proyecto"><small>Se aplicar&aacute; a proyectos en este estado (*) {getHelpTip('estado_proyecto')}</small></label>
          </p>
          <p>
            <textarea name="titulo" id="titulo" style="width: 308px;height: 30px;" data-validation-engine="validate[required]">{$modelo_carta->titulo}</textarea>
            <label for="titulo"><small>T&iacute;tulo (*) {getHelpTip('titulo')}</small></label>
          </p>
          <p>
            <textarea name="descripcion" id="descripcion" style="width: 308px;height: 30px;" data-validation-engine="validate[required]">{$modelo_carta->descripcion}</textarea>
            <label for="descripcion"><small>descripci&oacute;n (*) {getHelpTip('descripcion')}</small></label>
          </p>
          <h2 class="title">Contenido del Modelo de Carta (*)</h2>
          <p>
            <textarea name="contenido" id="contenido"  data-validation-engine="validate[required]">{if ($template)}{$template}{/if}</textarea>
          </p>
          <script>
            CKEDITOR.replace('contenido',{
              extraPlugins : 'carta_fecha,carta_director,carta_proyecto,carta_estudiante,carta_docente,carta_tutor,carta_responsable,carta_tribunal',
                toolbar :
                [
                  ['Save','-','Source','Preview','-','Templates'],
                  ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
                  ['Undo','Redo','-','Find','Replace'],
                  '/',        
                  ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','CreateDiv'],
                  ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
                  ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
                   '/',
                  ['Styles','Format','Font','FontSize'],
                  ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
                  ['Maximize'],
                   '/',
                  ['Fecha'],
                  ['Director'],
                  ['Proyecto','Estudiante'],
                  ['Docente','-','Tutor','-','Tribunal','-','Responsable']
                ]
            });
          </script>
          <h2 class="title">Grabar Modelo de Carta</h2>
          <p>
            <input type="hidden" name="id"    value="{$modelo_carta->id}">
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