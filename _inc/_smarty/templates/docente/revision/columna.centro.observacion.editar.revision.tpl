        <div id="content" style="width:685px;min-height: 450px;">
        <h1 class="title">Edición De Observaciones</h1>
          <p>
            <label for="revisor"><small>Nombre del Revisor: </small></label>
            <span><i>{$arrayobser[0]['nom']}</i></b ><i>{$arrayobser[0]['ap']}</i></span>
          </p>
          <p>
            <label for="proyecto_id"><small>Nombres de Proyecto: </small></label>
            <span>{$arrayobser[0]['nomp']}</span>
          </p>
          <p>
            <label for="fecha_observacion"><small>Fecha de Observación: </small></label>
            <span>{$arrayobser[0]['fere']}</span>            
          </p>
        <h2 class="title">Formulario de Edici&oacute;n</h2>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       	
        </head>
        
        <div id="wrap">
			<!-- Grid contents -->
			<div id="tablecontent"></div>

	    <form name="nueva_observacion" id="nueva_observacion" action="" onsubmit="enviarDatosObservacion(); return false">
		<h1>Nueva Observaci&oacute;n</h1>
            <table>
                <tr>
                <td>
            <h2 class="title">Observación: </h2>
                <input name="observacion" type="text" style="width:300px;" data-validation-engine="validate[required]"/>
                </td>
                <td>
            <h2 class="title">Grabar Observación:</h2>
            <p>
              <input name="submit" type="submit" value="Grabar">
              &nbsp;
              <input name="reset" type="reset" tabindex="3" value="Resetear">
            </p>
                </td>
                </tr>
            </table>
                <a href="revision.lista.php?iddicta={$iddicta}&estudiente_id={$revision->getEstudiante()}" type="button" class="sendme">Enviar</a>  
          </form>
        </div>
        <p>{$ERROR}</p>
        <script type="text/javascript">
                    datagrid = new DatabaseGrid({$revisionesid});
        </script>
        <script type="text/javascript">
        {literal} 
          jQuery(document).ready(function(){
            jQuery("#nueva_observacion").validationEngine();
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