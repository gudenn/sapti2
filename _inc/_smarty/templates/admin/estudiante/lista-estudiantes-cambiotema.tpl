<table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=codigo_sis'          class="tajax"  title='Ordenar por C&oacute;digo SIS' >C&oacute;digo SIS {$filtros->iconOrder('codigo_sis')}</a></th>
      <th><a href='?order=nombre'              class="tajax"  title='Ordenar por Nombre'            >Nombre            {$filtros->iconOrder('nombre')}</a></th>
      <th><a href='?order=apellidos'           class="tajax"  title='Ordenar por Apellidos'         >Apellidos         {$filtros->iconOrder('apellidos')}</a></th>
      <th><a href='?order=login'               class="tajax"  title='Ordenar por Login'             >Login             {$filtros->iconOrder('login')}</a></th>
      <th><a href='?order=email'               class="tajax"  title='Ordenar por Email'             >Email             {$filtros->iconOrder('email')}</a></th>
     
      <th>Cambio Leve</th>
      <th>Cambio Total</th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$objs[ic]['codigo_sis']}</td>
      <td>{$objs[ic]['usuario_nombre']}</td>
      <td>{$objs[ic]['usuario_apellidos']}</td>
      <td>{$objs[ic]['usuario_login']}</td>
      <td>{$objs[ic]['usuario_email']}</td>
     
      <td>
        <a href="proyectocambio/proyecto.registro.php?estudiante_id={$objs[ic]['id']}&cambio_leve" target="_blank" >{icono('basicset/reload.png','Cambio')} Cambio Leve</a>
      </td>
      <td>
        <a href="proyectocambio/proyecto.registro.php?estudiante_id={$objs[ic]['id']}&cambio_total" target="_blank" >{icono('basicset/reload.png','Cambio')} Cambio Total</a>
      </td>
    </tr>
  </tbody>
  {/section}
</table>
 
 