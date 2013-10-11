{include file="docente/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
        <div id="container">
        <h1 class="title">Materias Dictadas en el Semestre</h1>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        </head>
        <div id="wrap">
        <div id="message"></div>
        	<div id="pagecontrol">
		<label for="pagecontrol">Filas por Pagina: </label>
		<select id="pagesize" name="pagesize">
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="15">15</option>
                    <option value="20">20</option>
                    <option value="25">25</option>
                    <option value="30">30</option>
                    <option value="40">40</option>
                    <option value="50">50</option>
                </select>

                </div>
        	<label for="filter">Busqueda Rapida :</label>
		<input type="text" id="filter"/>

		<div id="tablecontent"></div>

        	<div id="paginator"></div>
        <form name="nueva_grupo" id="nueva_grupo" action="" onsubmit="enviarDatosGrupo(); return false">
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
              <input type="text" name="nombre" value="{$semestre->codigo}"  readonly>
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
              </select>
              <label for="materia_id"><small>Seleccione Materia(*) {getHelpTip('materia')}</small></label>
                </td>
                <td>
              <select name="grupo" id="grupo" >
              {html_options values=$grupo_values selected=$grupo_selected output=$grupo_output}
              </select>
              <label for="grupo"><small>Codigo de Grupo(*) {getHelpTip('grupo')}</small></label>
                </td>
                <td>
              <input name="submit" type="submit" value="Grabar">
              &nbsp;
              <input name="reset" type="reset" tabindex="3" value="Resetear">
                </td>
                </tr>
            </table>
              <span id=”comprobarusuario”></span><br/>
        </form>
        </div>
        <script type="text/javascript">
                editableGrid.onloadXML("configuracion.dicta2.php");
        </script>
    </div>
               {$ERROR}
    </div>
</div>
{include file="footer.tpl"}