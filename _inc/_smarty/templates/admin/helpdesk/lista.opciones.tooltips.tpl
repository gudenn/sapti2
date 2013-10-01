<table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=estado_helpdesk'     class="tajax"  title='Ordenar por Estado'             >Estado             {$filtros->iconOrder('estado_helpdesk')}</a></th>
      <th><a href='?order=descipcion'          class="tajax"  title='Ordenar por Descripci&oacute;n' >Descripci&oacute;n {$filtros->iconOrder('descripcion')}</a></th>
      <th><a href='?order=keywords'            class="tajax"  title='Ordenar por Palabras clave'     >Claves             {$filtros->iconOrder('keywords')}</a></th>
      <th>Pendientes</th>
      <th>Ver Tooltips</th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$helpdesk->getIconEstadoHD($objs[ic]['estado_helpdesk'])}</td>
      <td>{$objs[ic]['descripcion']}</td>
      <td>{$objs[ic]['keywords']}</td>
      <td>
        {$helpdesk->getContadorTooltipsLita($objs[ic]['id'],'RC')}
        {$helpdesk->getContadorTooltipsLita($objs[ic]['id'],'CL')}
        {$helpdesk->getContadorTooltipsLita($objs[ic]['id'],'AP')}
      </td>
      <td>
        <a href="tooltip.gestion.php?helpdesk_id={$objs[ic]['id']}" >{icono('basicset/tag.png','Activar')} Tooltips</a>
      </td>
    </tr>
  </tbody>
  {/section}
</table>
