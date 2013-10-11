      <div id="content">
        <h1 class="title">Registro de valor para la configuraci&oacute;n del Semestre</h1>
        <p>Formulario de registro de Configuraci&oacute;n para el semestre</p>
        <h2 class="title">Formulario de Registro</h2>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
            <p>
              <input type="text" name="nombre"  id="nombre" value="{$configuracion_semestral->nombre}"  data-validation-engine="validate[required]">
              <label for="nombre"><small>Nombre del Campo (*){getHelpTip('nombre')}</small></label>
            </p>
            <p>
              <input type="text" name="valor" id="valor" value="{$configuracion_semestral->valor}"  data-validation-engine="validate[required]">
              <label for="valor"><small>Valor del Campo (*){getHelpTip('valor')}</small></label>
            </p>
            <h2 class="title">Grabar Valor de configuraci&oacute;n</h2>
            <p>
              <input type="hidden" name="semestre_id"    value="{$semestre->id}">
              <input type="hidden" name="id"    value="{$configuracion_semestral->id}">
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
        