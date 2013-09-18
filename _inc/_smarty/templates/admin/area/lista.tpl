<table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=id'                  class="tajax"  title='Ordenar por Id'                 >Id                 {$filtros->iconOrder('id')}</a></th>
      <th><a href='?order=nombre'              class="tajax"  title='Ordenar por Nombre'             >Nombre             {$filtros->iconOrder('nombre')}</a></th>
      <th><a href='?order=descripcion'         class="tajax"  title='Ordenar por Descripci&oacute;n' >Descripci&oacute;n {$filtros->iconOrder('descripcion')}</a></th>
      <th>Opciones</th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$objs[ic]['id']}</td>
      <td>{$objs[ic]['nombre']}</td>
      <td>{$objs[ic]['descripcion']}</td>
      <td>
        <a href="area.registro.php?area_id={$objs[ic]['id']}" >{icono('basicset/pencil_48.png','Editar')} Editar</a>
        <a href="areasubarea.registro.php?area_id={$objs[ic]['id']}" >{icono('basicset/pencil_48.png','Editar')} Aniadir Subarea </a>
      </td>
    </tr>
  </tbody>
  {/section}
</table>
