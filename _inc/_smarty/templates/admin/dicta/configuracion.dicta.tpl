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
                    <td>
                        <h2 class="title">Crear Grupo: </h2>
                    </td>
                    <td>
                        <h2 class="title">Grabar Grupo:</h2>
                    </td>
                </tr>
                <tr>
                <td>
              <tr>
             <p>
              <input type="text" name="nombre" value="{$semestre->codigo}"  readonly>
              <label for="codigo"><small>Codigo Semestre Actual (*)</small></label>
             </p>
             <p>
              <select name="docente_id" id="docente_id" >
              {html_options values=$docentes_values selected=$docentes_selected output=$docentes_output}
              </select>
              <label for="docente_id"><small>Seleccione Docente(*)</small></label>
             </p>
             </tr>
             <tr>
            <p>
              <select name="materia_id" id="materia_id" >
              {html_options values=$materia_values selected=$materia_selected output=$materia_output}
              </select>
              <label for="materia_id"><small>Seleccione Materia(*)</small></label>
            </p>
            <p>
              <input type="text" name="grupo" id="grupo" data-validation-engine="validate[required]">
              <label for="grupo"><small>Codigo de Grupo(*)</small></label>
            </p>
            </tr>
                </td>
                <td>
            
            <p>
              <input name="submit" type="submit" value="Grabar">
              &nbsp;
              <input name="reset" type="reset" tabindex="3" value="Resetear">
            </p>
                </td>
                </tr>
            </table>
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