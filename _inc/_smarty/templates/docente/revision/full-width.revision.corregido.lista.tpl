{include file="docente/header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
        <h1 class="title">Lista de Correcciones y Avances</h1>
            <p>
               <b>Proyecto:</b> {$proyecto->nombre}<br/>
               <b>Estudiante:</b> {$usuario->getNombreCompleto()|upper}
            </p>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       	
        </head>
        <div id="wrap">
<table class="tbl_lista">
  <thead>
    <tr>
      <th>Id                 </th>
      <th>Nombre Proyecto    </th>
      <th>Descripcion        </th>
      <th>Fecha de Avance    </th>
      <th>Tipo Avance        </th>
      <th>Estado Avance      </th>
      <th>Detalle            </th>    
    </tr>
  </thead>
  {section name=ic loop=$avances}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$avances[ic]['id']}</td>
      <td>{$avances[ic]['nombrep']}</td>
      <td>{$avance->getResumen($avances[ic]['descripcion'])}</td>
      <td>{$avances[ic]['fecha']}</td>
      <td>{if $avances[ic]['correcionrevision'] > 0}
          {icono('basicset/document_pencil.png','Correccion de Revision')}
          Correccion
          {else}
          {icono('basicset/document.png','Avance de Proyecto')}
          Avance
          {/if}</td>
      <td>{$revision->getEstadoRevision($avances[ic]['estoavance'])}</td>
      <td>{if $avances[ic]['correcionrevision'] > 0}
            <a href="avance.detalle.php?iddicta={$iddicta}&estudiente_id={$estudiante->id}&avance_id={$avances[ic]['id']}" style="cursor:pointer">{icono('basicset/cabinet.png','Detalle')}Detalle de Correccion</a>
          {else}
            <a href="avance.detalle.php?iddicta={$iddicta}&estudiente_id={$estudiante->id}&avance_id={$avances[ic]['id']}" style="cursor:pointer">{icono('basicset/cabinet.png','Detalle')}Detalle de Avance</a>
          {/if}
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