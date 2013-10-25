{include file="header.tpl"}

<div class="wrapper row3">
    <div class="rnd">
        <div id="container" class="clear">
            
            <div style="width: 100%;float: left;" class="tbl_filtro">

<title>BUSCADOR</title>

<script type="text/javascript" src="ajaxbuscarperfil.js"></script>

<center> 

<h1><b>BUSQUEDA DE PROYECTOS</b></h1>

<input type="text" id="bus" style="width : 400px; length:150px" placeholder="rellene en este campo el T&iacute;tulo ,Nombre del Estudiante o  La Gesti&oacute;n"  autofocus="autofocus" name="bus" onkeyup="loadXMLDoc()" required /><b>BUSCAR {icono('Search.png','Buscador')}</b>

<div id="myDiv"></div>

</center>


</div>
</div>
</div>
 </div>    

{include file="footer.tpl"}
