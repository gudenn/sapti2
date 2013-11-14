<table class="tbl_lista">
  <thead>
  <tr>
    <th><a href='?order=nombre'              class="tajax"  title='Ordenar por Nombre'           >Nombre           {$filtros->iconOrder('nombre')}</a></th>
    <th><a href='?order=apellido_paterno'    class="tajax"  title='Ordenar por Apellido Paterno' >Apellido Paterno {$filtros->iconOrder('apellido_paterno')}</a></th>
    <th><a href='?order=apellido_materno'    class="tajax"  title='Ordenar por Apellido Materno' >Apellido Materno {$filtros->iconOrder('apellido_materno')}</a></th>
    <th>Profesional</th>
     <th>Activo AC, Inactivo IN</th>
      <th>Desactivar Cuenta</th>
      <th>Opciones</th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$objs[ic]['nombre']}</td>
      <td>{$objs[ic]['apellido_paterno']}</td>
      <td>{$objs[ic]['apellido_materno']}</td>
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
       <td>{$objs[ic]['estado']}</td>
     <td>{if ($objs[ic]['estado']=='AC')}
         <a href="usuario.gestion.php?id_usuario={$objs[ic]['id']}">Desactivar Cuenta</a></td>
      {/if}
     {if ($objs[ic]['estado']=='IN')}
         <a href="usuario.gestion.php?id_activar={$objs[ic]['id']}">Activar Cuenta</a></td>
       {/if}
      <td>
        {if (!$objs[ic]['puede_ser_tutor'])}
          <a href="usuario.gestion.php?es_profecional={$objs[ic]['id']}">Cambiar a profecional</a>
        {else}
          <a href="usuario.gestion.php?noes_profecional={$objs[ic]['id']}">Cambiar a no profecional</a>
        {/if}
        
      </td>
    </tr>
  </tbody>
  {/section}
</table>
