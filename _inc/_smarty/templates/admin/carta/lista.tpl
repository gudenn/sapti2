<table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=estado_impresion'    class="tajax"  title='Ordenar por Estado Impresion'          >Imp.               {$filtros->iconOrder('estado_impresion')}</a></th>
      <th><a href='?order=numero_asignado'     class="tajax"  title='Ordenar por N&uacute;mero Asignado'    >#                  {$filtros->iconOrder('numero_asignado')}</a></th>
      {* @TODO hay que agregar los datos del estudiante
      <th><a href='?order=codigo_sis'          class="tajax"  title='Ordenar por C&oacute;digo SIS'         >C&oacute;digo SIS  {$filtros->iconOrder('codigo_siso')}</a></th>
      <th><a href='?order=nombre_completo'     class="tajax"  title='Ordenar por Nombre de Estudiante'      >Estudiante         {$filtros->iconOrder('nombre_completo')}</a></th>
      *}
      <th><a href='?order=proyecto_nombre'     class="tajax"  title='Ordenar por T&iacute;tulo de Proyecto' >Proyecto           {$filtros->iconOrder('proyecto_nombre')}</a></th>
      <th><a href='?order=titulo'              class="tajax"  title='Ordenar por T&iacute;tulo de Carta'    >Carta              {$filtros->iconOrder('titulo')}</a></th>
      <th>Opciones</th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$carta->getIconEstado($objs[ic]['estado_impresion'])}</td>
      <td>{$objs[ic]['proyecto_numero_asignado']}</td>
      <td>{$objs[ic]['proyecto_nombre']}</td>
      <td>{$objs[ic]['modelo_carta_titulo']}</td>
      <td>
        <a href="carta.detalle.php?carta_id={$objs[ic]['id']}" target="_blank" >{icono('basicset/guarantee.png','Ver Detralle para Imprimir')} Ver</a>
      </td>
    </tr>
  </tbody>
  {/section}
</table>
