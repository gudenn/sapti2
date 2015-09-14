      <div id="content">
          <div align="right">
              <a href="../tribunal/">{icono('close.png','Cerrar')}</a>
          </div>
        <h1 class="title">Registro de Tribunal</h1>
        <p>Formulario de registro de Tribunales</p>
        <h2 class="title">Formulario de Registro</h2>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >

            <!-- ############ -->
            {include file="admin/usuario/registro.base.tpl"}
            <!-- ############ -->
         
            <h2 class="title">Grabar Tribunal</h2>
            <p>
              <input type="hidden" name="usuario_id"    value="{$usuario->id}">
              <input type="hidden" name="docente_id" value="{$docente->id}">
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
          $(function(){
            $('#fecha_nacimiento').datepicker({
              dateFormat:'dd/mm/yy',
              changeMonth: true,
              changeYear: true,
              yearRange: "1920:2013"
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
        