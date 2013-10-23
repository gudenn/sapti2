{include file="docente/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
        <h1 class="title">Lista de Estudiantes Inscritos</h1>
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
        </div>
        <a href="../revision/observacion.estudiante-cvs.php" class="sendme">CARGAR OBSERVACION(ES) POR CVS</a>
        <script type="text/javascript">
                editableGrid.onloadXML("loaddata.estudiante.lista.php?iddicta={$iddicta}");
        </script>
    </div>
    {$ERROR}
  </div>
</div>
{include file="footer.tpl"}