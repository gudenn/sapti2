<table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=id'                  class="tajax"  title='Ordenar por Id'                 >Id                 {$filtros->iconOrder('id')}</a></th>
      <th><a href='?order=estado_helpdesk'     class="tajax"  title='Ordenar por Estado'             >Estado             {$filtros->iconOrder('estado_helpdesk')}</a></th>
      <th><a href='?order=descipcion'          class="tajax"  title='Ordenar por Descripci&oacute;n' >Descripci&oacute;n {$filtros->iconOrder('descripcion')}</a></th>
      <th><a href='?order=keywords'            class="tajax"  title='Ordenar por Palabras clave'     >Claves             {$filtros->iconOrder('keywords')}</a></th>
      <th>Opciones</th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$objs[ic]['id']}</td>
      <td>{$helpdesk->getIconEstadoHD($objs[ic]['estado_helpdesk'])}</td>
      <td>{$objs[ic]['descripcion']}</td>
      <td>{$objs[ic]['keywords']}</td>
      <td>
        <a href="helpdesk.registro.php?helpdesk_id={$objs[ic]['id']}" >{icono('basicset/pencil_48.png','Editar')} Editar</a>
        {if ($objs[ic]['estado_helpdesk'] == Helpdesk::EST02_EDITAD)}
          <a href="helpdesk.gestion.php?helpdesk_id={$objs[ic]['id']}&activar=1" >{icono('basicset/Flag1_Green.png','Activar')} Activar</a>
        {/if}
      </td>
    </tr>
  </tbody>
  {/section}
</table>
