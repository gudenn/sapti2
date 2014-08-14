      <div id="content" style="width:685px;min-height: 400px;">
        <div id="respond">
            <h1 class="title">Formulario De Inscripción De Estudiantes A <b>{$materiagrupo[0]['materia']}</b></h1>
            <p>
               <label for="nombre de materia"><small>Nombre De Materia: </small></label>
               <span><b>{$materiagrupo[0]['materia']} </b><br />Grupo: <b>{$materiagrupo[0]['grupo']}</b></span><br/>
            </p>
          <form action="#" method="post" id="registro" name="registro" enctype="multipart/form-data">
            <fieldset>
                    <legend>Importar CSV/Excel file</legend>
                    <div class="control-group">
                            <div class="control-label">
                                    <label>CSV/Excel File:</label>
                            </div>
                            <div class="controls">
                                       <input type="file" name="file" id="file" class="input-large" style="width: 250pt">
                            </div>
                    </div>
            </fieldset>
            <h2 class="title">Grabar Estudiantes</h2>
            <p>
            <label>Lista Oficial</label> 
            <input type="checkbox" name=listaoficial[] value="borrar" class="checkbox" >
            <label>Se eliminara a todos los estudiantes que no estén en esta lista.</label>         
            </p>

            <p>
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">

              <button type="submit" id="submit" name="submit" data-loading-text="Grabando...">Grabar</button>
              &nbsp;
              <input name="reset" type="reset" id="reset" tabindex="5" value="Resetear">
            </p>
          </form>
        </div>
        <p>{$ERROR}</p>
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
        