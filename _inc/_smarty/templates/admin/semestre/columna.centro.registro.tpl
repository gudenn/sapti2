      <div id="content">
        <h1 class="title">Registro de Semestre</h1>
        <p>Formulario de registro de Semestre</p>
        <h2 class="title">Formulario de Registro</h2>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
            <p>
              <input type="text" name="codigo" value="{$semestre->codigo}"  data-validation-engine="validate[required]">
              <label for="codigo"><small>Codigo de Semestre (*)</small></label>
            </p>
            <!--
            <p>
              <select name="activo" id="activo"  data-validation-engine="validate[required]" >
                <option value="">-- Seleccione --</option>
                <option value="1" {if ($semestre->activo === '1')} selected="selected" {/if}>Activo</option>
                <option value="0" {if ($semestre->activo === '0')} selected="selected" {/if}>Inactivo</option>
              </select>
              <label for="activo"><small>Es el semestre actual (*)</small></label>
            </p>
            -->
            <br>
            <h2 class="title">Grabar Semestre</h2>
            <p>
              <input type="hidden" name="id"    value="{$semestre->id}">
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
        