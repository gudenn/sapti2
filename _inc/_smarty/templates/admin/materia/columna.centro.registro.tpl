      <div id="content">
        <h1 class="title">Registro de Materia</h1>
        <p>Formulario de registro de Materia</p>
        <h2 class="title">Formulario de Registro</h2>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
              <p>
              <input type="text" name="sigla" value="{$materia->sigla}"  data-validation-engine="validate[required]">
              <label for="codigo"><small>Materia Sigla(*)</small></label>
            </p>
            <p>
              <input type="text" name="nombre" value="{$materia->nombre}"  data-validation-engine="validate[required]">
              <label for="codigo"><small>Nombre del Materia (*)</small></label>
            </p>
            <h2 class="title">Grabar Materia</h2>
            <p>
              <input type="hidden" name="id"    value="{$materia->id}">
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
        