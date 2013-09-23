<table class="tbl_lista">
  <thead>
  <tr>
    <th><a href='?order=id'                  class="tajax"  title='Ordenar por Id'           >Id           {$filtros->iconOrder('id')}</a></th>
    {if ($proyecto)}
    <th><a href='?order=estado'              class="tajax"  title='Ordenar por Estado'       >Estado       {$filtros->iconOrder('estado')}</a></th>
    {/if}
    <th><a href='?order=nombre'              class="tajax"  title='Ordenar por Nombre'       >Nombre       {$filtros->iconOrder('nombre')}</a></th>
    <th><a href='?order=apellidos'           class="tajax"  title='Ordenar por Apellidos'    >Apellidos    {$filtros->iconOrder('apellidos')}</a></th>
    <th><a href='?order=email'               class="tajax"  title='Ordenar por Email'        >Email        {$filtros->iconOrder('email')}</a></th>
    <th>Opciones</th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$objs[ic]['id']}</td>
      {if ($proyecto)}
      {$estado = $proyecto->consultarEstadoTutor($objs[ic]['id'])}
      <td>
        {if ($estado == 'PE')}
          {icono('basicset/alarm.png','Pendiente')} Pendiente
        {else}
          {icono('basicset/licence.png','Aprobado')} Aceptado
        {/if}
      </td>
      {/if}
      <td>{$objs[ic]['usuario_nombre']}</td>
      <td>{$objs[ic]['usuario_apellidos']}</td>
      <td>{$objs[ic]['usuario_email']}</td>
      <td>
        
        {if (isset($estudiante))}
          
          <a href="tutor.asignar.php?estudiante_id={$estudiante->id}&cambiartutor_id={$objs[ic]['id']}">{icono('basicset/reload.png','Cambiar')} Cambiar</a>
        {/if}
      </td>
    </tr>
  </tbody>
  {/section}
</table>
