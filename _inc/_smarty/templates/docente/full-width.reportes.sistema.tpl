{include file="docente/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
      <h1 class="title">Lista De Estudiantes Inscritos</h1>
      <table class="tbl_lista">
           <tr class="dark">
               <th>
              <select name="materia_selec" id="materia_selec" >
              {html_options values=$materia_values selected=$materia_selected output=$materia_output}
              </select>
              <label for="materia_selec"><small>Seleccione Materia(*)</small></label>
               </th>
               <th>
              <select name="tiporeporte_selec" id="tiporeporte_selec" >
              {html_options values=$tiporeporte_values selected=$tiporeporte_selected output=$tiporeporte_output}
              </select>
              <label for="tiporeporte_selec"><small>Seleccione Tipo Reporte(*)</small></label>
              </th>
              <th></th>
           </tr>
           <tr class="light">
               <th>
              <select name="evaluacion_selec" id="evaluacion_selec" >
              {html_options values=$evaluacion_values selected=$evaluacion_selected output=$evaluacion_output}
              </select>
              <label for="evaluacion_selec"><small>Mostrar Evaluación</small></label>
              </th>
              <th></th>
              <th></th>
           </tr>
      </table>
              <input type="button" href="javascript:;" onclick="realizaProceso($('#materia_selec').val(), $('#tiporeporte_selec').val(), $('#evaluacion_selec').val());return false;" value="Generar Reporte"/>
              <div id="tablaresultado" style="width:685px;min-height: 450px;"></div>
    </div>
    {$ERROR}
  </div>
  <script>
function realizaProceso(valorCaja1, valorCaja2, valorCaja3){
        var parametros = {
                "materia" : valorCaja1,
                "tiporeporte" : valorCaja2,
                "evaluacion" : valorCaja3
        };
        $.ajax({
                data:  parametros,
                url:   'reporte.sistema.tabla.php',
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