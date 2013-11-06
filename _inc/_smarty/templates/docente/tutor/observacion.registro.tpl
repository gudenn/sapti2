      <div id="content">
        <h1 class="title">Registro De Observaciones</h1>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
            <p>
               <label for="nombre de proyecto"><small>Nombre  De Proyecto:</small></label>
               <span>{$proyecto->nombre}</span><br/>
               <label for="nombre de estudiante"><small>Nombre De Estudiante:</small></label>
               <span>{$usuario->getNombreCompleto()}</span>
            </p>
            <br/>
           
            <div id="div_1">
            <label  accesskey="">Observación:
            </label>
            </p>
            <input  type="text"  name="observaciones[]" id="observaciones[]" style="width:500px;" data-validation-engine="validate[required]"/> 
            <input class="bt_plus" id="1" type="button" value="Añadir Observacion" />
            <div class="error_form"></div>
            </div>

            <p>
              <input type="text" name="fecha_revision" id="fecha_revision" value="{$revision->fecha_revision}" size="22"/>
              <label for="fecha_revision"><small>Fecha De Revisión</small></label>
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
              yearRange: "2000:2050"
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
        