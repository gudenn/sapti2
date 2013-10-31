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
              </select>&nbsp;<span id='Buscando'></span>
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

      </table>
              <input type="button" href="javascript:;" onclick="realizaProceso($('#materia_selec').val(), $('#tiporeporte_selec').val());return false;" value="Generar Reporte"/>
              <div id="tablaresultado" style="width:685px;min-height: 450px;"></div>
    </div>
    {$ERROR}
  </div>
  <script>
function realizaProceso(valorCaja1, valorCaja2){
        var parametros = {
                "materia" : valorCaja1,
                "tiporeporte" : valorCaja2
                
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
{literal}
<script type="text/javascript">
jQuery('#materia_selec').change(function () {
var numero =document.getElementById("materia_selec").value;
var to=document.getElementById("Buscando");
to.innerHTML="buscando....";

jQuery.ajax({
type: "POST", 
url: "reporte.sistema.carga.php",
data: 'idmateria='+numero,
success: function(a) {
jQuery('#tiporeporte_selec').html(a);
var to=document.getElementById("Buscando");
to.innerHTML="";
}
});
})
.change();
</script>
{/literal}