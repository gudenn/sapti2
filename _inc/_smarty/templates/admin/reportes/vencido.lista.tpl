{include file="admin/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
       
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
        	
        
		<div id="tablecontent"></div>
        
        	<div id="paginator"></div>
        </div>
      <center>
        <a href="vencido-pdf.php?id_p={$semestre->id}" target="_blank" >{icono('filepd.png','descargar')}descargar pdf</a>
        <a href="venceexcel.php?id_p={$semestre->id}" target="_blank" >{icono('boton_excel.png','descargar')}descargar excel</a>  
     </center>
        <script type="text/javascript">
                editableGrid.onloadXML("loaddata.vencido.lista.php");
        </script>
    </div>
    {$ERROR}
  </div>
</div>
{include file="footer.tpl"}