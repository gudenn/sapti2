{include file="docente/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
        <div id="container">
        <h1 class="title">Materias Dictadas en el Semestre</h1>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        </head>
        <div id="wrap">
  <div style="height: 250px; width: 920px; font-size: 12px; overflow: auto;">
  <table class="tbl_lista">
  <thead>
    <tr>
      <th>Id      </th>
      <th>Semestre  </th>
      <th>Docente </th>
      <th>Materia </th>
      <th>Grupo </th>
      <th>Opciones </th>
       </tr>
  </thead>
  <tbody>
  {section name=ic loop=$tabla}
     <tr  class="selectable">
     <td>{$tabla[ic]['id']} </td>
     <td>{$tabla[ic]['semestre']}</td>
     <td>{$tabla[ic]['nombre']}</td>
     <td>{$tabla[ic]['materia']}</td>
     <td>{$tabla[ic]['grupo']}</td>
     <td>  <a href="configuracion.dicta.php?eliminar=1&dicta_id={$tabla[ic]['id']}" onclick="return confirm('Eliminar este Grupo?');"  >{icono('borrar.png','ELIMINAR')}</a>
     </td>
    </tr>
  {/section}
    </tbody> 
</table>
  </div>
        <form action="#" method="post" id="registro" name="registro" >
                <h1>Registrar Materias</h1>
            <table>
                <tr>
                    <td colspan="2">
                        <h2 class="title">Crear Grupo: </h2>
                    </td>

                    <td>
                        <h2 class="title">Grabar Grupo:</h2>
                    </td>
                </tr>
                <tr>
                    <td>
              <input type="text" name="codigo" value="{$semestre->codigo}"  readonly>
              <label for="codigo"><small>Codigo Semestre Actual (*)</small></label>
                    </td>
                    <td>
              <select name="docente_id" id="docente_id" >
              {html_options values=$docentes_values selected=$docentes_selected output=$docentes_output}
              </select>
              <label for="docente_id"><small>Seleccione Docente(*) {getHelpTip('docente')}</small></label>
                    </td>
                    <td></td>
                </tr>
                <tr>
                <td>
              <select name="materia_id" id="materia_id" >
              {html_options values=$materia_values selected=$materia_selected output=$materia_output}
              </select>&nbsp;<span id='Buscando'></span>
              <label for="materia_id"><small>Seleccione Materia(*)</small></label>                   
                </td>
                <td>
              <select name="grupo_id" id="grupo_id" >
              {html_options values=$grupoid selected=$grupoid output=$gruponombre}
              </select>                    
              <label for="grupo_id"><small>Codigo de Grupo(*)</small></label>
                </td>
                <td>

              <input type="hidden" name="dicta_id" value="{$dicta->id}">
              <input type="hidden" name="tarea" value="registrar">
              <input type="hidden" name="token" value="{$token}">
              
              <input name="submit" type="submit" value="Grabar">
              &nbsp;
              <input name="reset" type="reset" tabindex="5" value="Resetear">
                </td>
                </tr>
            </table>
        </form>
{literal}
<script type="text/javascript">
jQuery('#materia_id').change(function () {
var numero =document.getElementById("materia_id").value;
var to=document.getElementById("Buscando");
to.innerHTML="buscando....";

jQuery.ajax({
type: "POST", 
url: "configuracion.dicta3.php",
data: 'idmateria='+numero,
success: function(a) {
jQuery('#grupo_id').html(a);
var to=document.getElementById("Buscando");
to.innerHTML="";
}
});
})
.change();
</script>
{/literal} 
        </div>                  
    </div> 
{$ERROR}
    </div>
</div>
{include file="footer.tpl"}
