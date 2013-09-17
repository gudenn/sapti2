<table>
  <thead>
  <tr>
    <th>Configuraci&oacute;n para el Semestre:</th>
    <th>Semestre Actual</th>
    <th>Cambiar Semestre</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>{$semestre->codigo}</td>
    <td>
      {if ($semestre->activo)}
        {icono('basicset/tick_48.png','Editar')} Si
      {else}
        {icono('basicset/delete_48.png','Editar')} No
      {/if}
    </td>
    <td>
      <a href="semestre.gestion.php" >{icono('basicset/folder_48.png','Editar')} Cambiar</a>
    </td>
  </tr>
  </tbody>
</table>
<table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=id'            class="tajax"  title='Ordenar por Id'      >Id      {$filtros->iconOrder('id')}</a></th>
      <th><a href='?order=nombre'        class="tajax"  title='Ordenar por Nombre'  >Nombre  {$filtros->iconOrder('nombre')}</a></th>
      <th><a href='?order=valor'         class="tajax"  title='Ordenar por Valor'   >VAlor   {$filtros->iconOrder('valor')}</a></th>
      <th>Opciones</th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$objs[ic]['id']}</td>
      <td>{$objs[ic]['nombre']}</td>
      <td>{$objs[ic]['valor']}</td>
      <td>
        <a href="configuracion_semestral.registro.php?configuracion_semestral_id={$objs[ic]['id']}" >{icono('basicset/pencil_48.png','Editar')} Editar</a>
      </td>
    </tr>
  </tbody>
  {/section}
</table>
