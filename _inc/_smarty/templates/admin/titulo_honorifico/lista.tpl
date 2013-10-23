<table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=nombre'              class="tajax"  title='Ordenar por Nombre'             >Nombre             {$filtros->iconOrder('nombre')}</a></th>
      <th><a href='?order=descripcion'         class="tajax"  title='Ordenar por Descripci&oacute;n' >Descripci&oacute;n {$filtros->iconOrder('descripcion')}</a></th>
      <th>Opciones</th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$objs[ic]['nombre']}</td>
      <td>{$objs[ic]['descripcion']}</td>
      <td>
        <a href="titulo_honorifico.registro.php?titulo_honorifico_id={$objs[ic]['id']}" >{icono('basicset/pencil_48.png','Editar')} Editar</a>
      </td>
    </tr>
  </tbody>
  {/section}
</table>
