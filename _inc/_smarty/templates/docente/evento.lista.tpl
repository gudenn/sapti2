<div id="content" style="width:685px;min-height: 400px;">
        <h1 class="title">Registro de Eventtos</h1>
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
        <script type="text/javascript">
                editableGrid.onloadXML("loaddata.evento.lista.php?doc={$docente_ids}");
        </script>
        <style type="text/css">
        tr:nth-child(even) { background: #ddd }
        tr:nth-child(odd) { background: #fff}
        table {
        color: #666666;
        }
        </style>
        
    {$ERROR}
</div>  
