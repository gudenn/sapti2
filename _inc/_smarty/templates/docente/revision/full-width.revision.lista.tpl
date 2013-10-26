{include file="docente/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
        <h1 class="title">Seguimiento de Proyecto</h1>
            <p>
               <b>Proyecto:</b> {$proyecto->nombre}<br/>
               <b>Estudiante:</b> {$usuario->getNombreCompleto()|upper}
            </p>
        <div id="wrap">
        <div id="message"></div>
        	<div id="pagecontrol">
		<label for="pagecontrol">Filas por Página: </label>
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
        	<label for="filter">Búsqueda Rápida:</label>
		<input type="text" id="filter"/>
        
		<div id="tablecontent"></div>
        
        	<div id="paginator"></div>
        </div>
        <script type="text/javascript">
                editableGrid.onloadXML("loaddata.revision.lista.php?doc={$estudiante->id}",{$estudiante->id},{$iddicta});
        </script>
        <p>{$ERROR}</p>
     </div>
    {$ERROR}
    </div>
</div>
{include file="footer.tpl"}