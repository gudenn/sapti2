<h1> Asignar un tutor de la lista</h1>
<table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=titulo_honorifico'   class="tajax"  title='Ordenar por Titulo'       >T&iacute;tulo    {$filtros->iconOrder('titulo_honorifico')}</a></th>
      <th><a href='?order=nombre'              class="tajax"  title='Ordenar por Nombre'       >Nombre           {$filtros->iconOrder('nombre')}</a></th>
      <th><a href='?order=apellido_paterno'    class="tajax"  title='Ordenar por Apellido Paterno' >Ap. Paterno  {$filtros->iconOrder('apellido_paterno')}</a></th>
      <th><a href='?order=apellido_materno'    class="tajax"  title='Ordenar por Apellido Materno' >Ap. Materno  {$filtros->iconOrder('apellido_materno')}</a></th>
      <th><a href='?order=login'               class="tajax"  title='Ordenar por Login'            >Login        {$filtros->iconOrder('login')}</a></th>
      <th><a href='?order=email'               class="tajax"  title='Ordenar por Email'            >Email        {$filtros->iconOrder('email')}</a></th>
      <th  title='N&uacute;mero Total de Tutor&iacute;as, M&aacute;ximo n&uacute;mero de tutorias activas permitidas es {$max_tutorias}' ># Tutor&iacute;as</th>
      <th></th>
      <th>Opciones</th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  {assign var="tutorias" value=$tutor->getTotalTutorias($objs[ic]['id']) nocache}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$objs[ic]['titulo_honorifico']}</td>
      <td>{$objs[ic]['nombre']}</td>
      <td>{$objs[ic]['apellido_paterno']}</td>
      <td>{$objs[ic]['apellido_materno']}</td>
      <td>{$objs[ic]['login']}</td>
      <td>{$objs[ic]['email']}</td>
      <td>{$tutorias}</td>
      <td>
        {if ($objs[ic]['puede_ser_tutor'])}
          {if ($objs[ic]['sexo']=='M')}
          {icono('basicset/user5.png','Profecional')}
          {else}
          {icono('basicset/user6.png','Profecional')}
          {/if}
        {else}
          {if ($objs[ic]['sexo']=='M')}
          {icono('basicset/user1.png','No')}
          {else}
          {icono('basicset/user2.png','No')}
          {/if}
        {/if}
      </td>
      <td>
        {if ( isset($cambiartutor_id) )}
          <a href="tutor.asignar.php?asignar=1&usuario_id={$objs[ic]['id']}&cambiartutor_id={$cambiartutor_id}" target="_self" onclick="return (confirm('Confirma cambiar a {$tutor->getNombreCompleto()} ( Tutor actual) por {$objs[ic]['nombre']}'));">{icono('basicset/arrow_down.png','ASIGNAR TUTOR')} Cambiar por</a>
        {else}
          {if ( $tutorias < $max_tutorias )}
            <a href="tutor.asignar.php?asignar=1&usuario_id={$objs[ic]['id']}" target="_self">{icono('basicset/tick_48.png','ASIGNAR TUTOR')} asignar</a>
          {/if}
        {/if}
      </td>
    </tr>
  </tbody>
  {/section}
</table>
         