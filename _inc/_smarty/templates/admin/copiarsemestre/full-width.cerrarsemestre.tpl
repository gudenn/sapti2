{include file="docente/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
        <form action="#" method="post" id="registro" name="registro" >
      <h1 class="title">Copiar Configuracion de Semestre</h1>
      <table class="tbl_lista">
           <tr class="dark">
               <th>
             <p>
              <input type="text" name="nombre" id="nombre" value="{$semestre->codigo}"  readonly>
              <label for="nombre"><small>C&oacute;digo Semestre Actual {getHelpTip('semestre')}</small></label>
            </p>
               </th>
               <th>
              <select name="semestre_id" id="semestre_id" >
              {html_options values=$semestre_values selected=$semestre_selected output=$semestre_output}
              </select>
              <label for="semestre_id"><small>Seleccione Proximo Semestre (*){getHelpTip('semestre')}</small></label>
              </th>
              
           </tr>
           <tr class="light">
               <th>
            <p>
              <label><input type="checkbox" name=seleccion[] value="mate" class="checkbox" >Copiar Materias</label>
              <label><input type="checkbox" name=seleccion[] value="conf" class="checkbox" >Copiar Configuracion</label>
              <br><br><label for=""><small>Seleccione Minimamente Una Opcion(*)</small></label>
            </p>
            </th>
            <th>
            <p>
              <input type="button" href="javascript:;" onclick="realizaProceso({$semestre->id});return false;" value="Ver Configuracion Actual"/>
            </p>
            </th>
           </tr>
            </table>
            <p>Todos los campos con (*) son obligatorios.</p>
            <h2 class="title">Cerrar Semestre y Grabar Configuracion</h2>
            <p>
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
              <input name="submit" type="submit" id="submit" value="Grabar">
            </p>

          </form>
              <div id="tablaresultado" style="width:685px;min-height: 450px;"></div>
              
    </div>
    {$ERROR}
  </div>
  <script>
function realizaProceso(valorCaja1){
        var parametros = {
                "semestre" : valorCaja1
        };
        $.ajax({
                data:  parametros,
                url:   'cerrarsemestre2.php',
                type:  'post',
                beforeSend: function () {
                        $("#tablaresultado").html("Procesando, espere por favor...");
                },
                success:  function (response) {
                        $("#tablaresultado").html(response);
                }
        });
}
</script>
</div>
{include file="footer.tpl"}