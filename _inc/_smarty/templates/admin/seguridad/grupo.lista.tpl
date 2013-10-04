<table class="tbl_lista">
  <thead>
  <tr>
    <th><a href='?order=codigo'              class="tajax"  title='Ordenar por Grupo'        >Grupo               {$filtros->iconOrder('codigo')}</a></th>
    <th><a href='?order=descripcion'         class="tajax"  title='Ordenar por Descipcion'   >Descripci&oacute;n  {$filtros->iconOrder('descripcion')}</a></th>
    <th>Tools</th>
  </tr>
  </thead>
  {section name=ic loop=$objs}
    <tbody>
    <tr>
      <td>{$objs[ic]['codigo']}</td>
      <td>{$objs[ic]['descripcion']}</td>
      <td>
        <a href='grupo.registro.php?grupo_id={{$objs[ic]['id']}}' title='Editar'       >{icono('basicset/pencil_48.png','Editar')} Editar</a>
      </td>
    </tr>
  {/section}
  </tbody>
</table>