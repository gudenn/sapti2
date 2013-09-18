{include file="docente/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
        <h1 class="title">Registro de Evaluaciones</h1>
            <p>
               <label for="nombre de proyecto"><small>NOMBRE DE PROYECTO:</small></label>
               <span>{$proyecto->nombre}</span><br/>
               <label for="nombre de estudiante"><small>NOMBRE DE ESTUDIANTE:</small></label>
               <span>{$usuario->nombre} {$usuario->apellido_paterno} {$usuario->apellido_materno}</span>
            </p>
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

        <h1 class="title">Evaluaciones</h1>

		<div id="tablecontent1"></div>
        </div>
        <p>{$ERROR}</p>
     </div>
    {$ERROR}
    </div>
</div>
{include file="footer.tpl"}
        <script type="text/javascript">
                editableGrid.onloadXML("loaddata.revision.lista.php?doc={$proyecto->id}");
        </script>