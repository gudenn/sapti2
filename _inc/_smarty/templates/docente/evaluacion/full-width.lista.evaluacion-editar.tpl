{include file="docente/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
        <h1 class="title">Registro de Evaluaciones</h1>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       	
        </head>
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
                <center> 
                    <a href="../reportes.sistema.pdf.php?sql={$sqlreporte}&iddicta={$iddicta}" target="_blank" >{icono('filepd.png','descargar')}Descargar PDF</a>
                    <a href="../reportes.sistema.excel.php?sql={$sqlreporte}&iddicta={$iddicta}" target="_blank" >{icono('boton_excel.png','descargar')}Descargar EXCEL</a>
                </center>
        </div>
        <a href="evaluacion.estudiante-cvs.php?iddicta={$iddicta}" class="sendme">CARGAR NOTAS POR CVS</a>
        <script type="text/javascript">
                editableGrid.onloadXML("loaddata.evaluacion-editar.php?iddicta={$iddicta}");
        </script>
    </div>
    {$ERROR}
  </div>
</div>
{include file="footer.tpl"}