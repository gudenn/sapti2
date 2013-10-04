      <div id="content">
        <h1 class="title">Registro de Grupo</h1>
        <p>Formulario de registro de un Grupo Para Usuarios</p>
        <h2 class="title">Formulario de Registro</h2>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
            <p>
              <input type="text" name="codigo"  id="codigo" value="{$grupo->codigo}"  data-validation-engine="validate[required]">
              <label for="codigo"><small>Nombre del Grupo(*)</small></label>
            </p>
            <p>
              <input type="text" name="descripcion" id="descripcion" value="{$grupo->descripcion}"  data-validation-engine="validate[required]">
              <label for="descripcion"><small>Descripcion del Grupo (*)</small></label>
            </p>
            <h2 class="title">Grabar Grupo</h2>
            <p>
              <input type="hidden" name="id"    value="{$grupo->id}">
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
              <input name="submit" type="submit" id="submit" value="Grabar">
              &nbsp;
              <input name="reset" type="reset" id="reset" tabindex="5" value="Limpiar">
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
        