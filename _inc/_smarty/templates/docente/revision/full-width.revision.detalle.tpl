{include file="docente/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
        <h1 class="title">Lista de Correcciones y Avances</h1>

        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       	
        </head>
        <div id="wrap">
<table class="tbl_lista">
  <thead>
    <tr>
      <th>Ruta               </th>
      <th>Detalle            </th>    
    </tr>
  </thead>
  {section name=ic loop=$archivosruta}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$archivosruta[ic]}</td>
      <td>
            <a href="{$dir}{$archivosruta[ic]}" target="_self" >{icono('basicset/cabinet.png','Detalle')}Descargar Archivo</a>
      </td>    
    </tr>
  </tbody>
  {/section}
</table>
        </div>
    </div>
    {$ERROR}
  </div>
</div>
{include file="footer.tpl"}