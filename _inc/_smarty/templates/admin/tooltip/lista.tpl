<table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=estado_tooltip'      class="tajax"  title='Ordenar por Estado'             >Estado             {$filtros->iconOrder('estado_tooltip')}</a></th>
      <th><a href='?order=codigo'              class="tajax"  title='Ordenar por C&oacute;digo'      >C&oacute;digo      {$filtros->iconOrder('codigo')}</a></th>
      <th><a href='?order=titulo'              class="tajax"  title='Ordenar por T&iacute;tulo'      >T&iacute;tulo      {$filtros->iconOrder('titulo')}</a></th>
      <th><a href='?order=descipcion'          class="tajax"  title='Ordenar por Descripci&oacute;n' >Descripci&oacute;n {$filtros->iconOrder('descripcion')}</a></th>
      <th>Opciones</th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$tooltips->getIconEstadoHD($objs[ic]['estado_tooltip'])}</td>
      <td>{$objs[ic]['codigo']}</td>
      <td>{$objs[ic]['titulo']}</td>
      <td>{$objs[ic]['descripcion']}</td>
      <td>
        <a href="tooltip.registro.php?tooltip_id={$objs[ic]['id']}" >{icono('basicset/pencil_48.png','Editar')} Editar</a>
        {if ($objs[ic]['mostrar'] )}
          <a href="tooltip.gestion.php?tooltip_id={$objs[ic]['id']}&ocultar=1" >{icono('basicset/eyeclose.png','Ocultar')} Ocultar</a>
        {else}  
          <a href="tooltip.gestion.php?tooltip_id={$objs[ic]['id']}&ocultar=0" >{icono('basicset/eye.png','Mostrar')} Mostrar</a>
        {/if}
      </td>
    </tr>
  </tbody>
  {/section}
</table>
