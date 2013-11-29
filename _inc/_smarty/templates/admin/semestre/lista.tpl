<table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=id'                  class="tajax"  title='Ordenar por Id'           >Id            {$filtros->iconOrder('id')}</a></th>
      <th><a href='?order=codigo'              class="tajax"  title='Ordenar por Codigo'       >C&oacute;digo {$filtros->iconOrder('codigo')}</a></th>
      <th><a href='?order=activo'              class="tajax"  title='Ordenar por Activo'       >Activo        {$filtros->iconOrder('activo')}</a></th>
      <th>Opciones</th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$objs[ic]['id']}</td>
      <td>{$objs[ic]['codigo']}</td>
      <td>{if ($objs[ic]['activo'] === '1')}{icono('basicset/tick_48.png','Activo')}{/if}</td>
      <td>
        <a href="semestre.registro.php?semestre_id={$objs[ic]['id']}" >{icono('basicset/pencil_48.png','Activar')} Editar</a>
        <a href="configuracion_semestral.gestion.php?semestre_id={$objs[ic]['id']}" >{icono('basicset/gear_48.png','Configurar')} Configurar</a>
        {*}
        {if ($objs[ic]['activo'] === '0')}
        <a href="semestre.gestion.php?semestre_id={$objs[ic]['id']}&activar=1" >{icono('basicset/tick_48.png','Activar')} Activar</a>
        {/if}
        {/*}
      </td>
    </tr>
  </tbody>
  {/section}
</table>
