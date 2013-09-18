      <div id="content">
        <h1 class="title">Asignar Subarea</h1>
        <p>Formulario de Asignar Subarea</p>
        <h2 class="title">Formulario de Registro</h2>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
               <p>
              <select name="subarea_id" id="subarea_id" >
              {html_options values= $subarea_values selected=$subarea_selected output=$subarea_output}
              </select>
              <label for="semestre_id"><small>Subarea (*)</small></label>
            </p>
            
            <h2 class="title">Grabar Departamento</h2>
            <p>
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
              <input name="submit" type="submit" id="submit" value="Grabar">
              &nbsp;
              <input name="reset" type="reset" id="reset" tabindex="5" value="Cancelar">
            </p>
          </form>
        </div>
        <p>{$ERROR}</p>
        <a href="subarea.crear.php?area_id={$objs[ic]['id']}" >{icono('basicset/agregarboton.png','Aniadir Nuevo')} A&ntildeadir Subarea </a>
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
        