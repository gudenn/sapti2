      <div id="content">
        <div  class="notacontenido">
        <h1 class="title">Registro de Visto Bueno</h1>
        <div id="respond">
          <form action="#" method="post" id="registro" name="registro" >
            <p>
                <label for="nombre de estudiante"><small>Nombre De Estudiante:</small></label>
               <span>{$usuario->nombre} {$usuario->apellido_paterno} {$usuario->apellido_materno}</span><br/>
          
               <label for="nombre de proyecto"><small>Nombre De Proyecto:</small></label>
               <span>{$proyecto->nombre}</span><br/>
               
                <label for="nombre de proyecto"><small>Objetivo General:</small></label>
               <span>{$proyecto->nombre}</span><br/>
               
                <label for="nombre de proyecto"><small>Objetivos Especificos:</small></label>
               <span>{$proyecto->nombre}</span><br/>
              
               <label for="nombre de proyecto"><small>Descripcion:</small></label>
               <span>{$proyecto->nombre}</span><br/>
               
              <p>
              <input type="text" name="fecha" id="fecha" value="{$vistobueno->fecha}" size="22"/>
              <label for="fecha_revision"><small>Fecha De Visto Bueno</small></label>
            </p>
            <h2 class="title">Grabar </h2>
            <p>
              <input type="hidden" name="proyecto_id" value="{$proyecto->id}">
              <input type="hidden" name="visto_bueno_id" value="{$usuario->id}">
               <input type="hidden" name="estudiante_id" value="{$estudiante->id}">
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
            $('#fecha').datepicker({
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
        </div>
        