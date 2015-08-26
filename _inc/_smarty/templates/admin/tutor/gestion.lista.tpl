<table class="tbl_lista">
  <thead>
  <tr>
    {if ($proyecto)}
    <th><a href='?order=estado'              class="tajax"  title='Ordenar por Estado'       >Estado           {$filtros->iconOrder('estado')}</a></th>
    {/if}
    <th><a href='?order=titulo_honorifico'   class="tajax"  title='Ordenar por Titulo'       >T&iacute;tulo    {$filtros->iconOrder('titulo_honorifico')}</a></th>
    <th><a href='?order=nombre'              class="tajax"  title='Ordenar por Nombre'       >Nombre           {$filtros->iconOrder('nombre')}</a></th>
    <th><a href='?order=apellido_paterno'    class="tajax"  title='Ordenar por Apellido Paterno' >Ap. Paterno  {$filtros->iconOrder('apellido_paterno')}</a></th>
    <th><a href='?order=apellido_materno'    class="tajax"  title='Ordenar por Apellido Materno' >Ap. Materno  {$filtros->iconOrder('apellido_materno')}</a></th>
    <th><a href='?order=login'               class="tajax"  title='Ordenar por Login'            >Login        {$filtros->iconOrder('login')}</a></th>
    <th><a href='?order=email'               class="tajax"  title='Ordenar por Email'            >Email        {$filtros->iconOrder('email')}</a></th>
    <th>Opciones</th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
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
      <td>{$objs[ic]['usuario_titulo_honorifico']}</td>
      <td>{$objs[ic]['usuario_nombre']}</td>
      <td>{$objs[ic]['usuario_apellido_paterno']}</td>
      <td>{$objs[ic]['usuario_apellido_materno']}</td>
      <td>{$objs[ic]['usuario_login']}</td>
      <td>{$objs[ic]['usuario_email']}</td>
      <td>
        
        {if ($proyecto)}
          
          <a href="tutor.asignar.php?estudiante_id={$estudiante->id}&cambiartutor_id={$objs[ic]['id']}">{icono('basicset/reload.png','Cambiar')} Cambiar</a>
        {else}
          <a href="tutor.registro.php?tutor_id={$objs[ic]['id']}">{icono('basicset/pencil_48.png','Editar')} Editar</a>
        {/if}
      </td>
    </tr>
  </tbody>
  {/section}
</table>
