<table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=numero_asignado'     class="tajax"  title='Ordenar por N&uacute;mero de proyecto'      >#       {$filtros->iconOrder('numero_asignado')}</a></th>
      <th><a href='?order=codigo_sis'          class="tajax"  title='Ordenar por C&oacute;digo Sis'              >C&oacute;digo Sis   {$filtros->iconOrder('codigo_sis')}</a></th>
      <th><a href='?order=titulo'              class="tajax"  title='Ordenar por T&iacute;tulo'                  >T&iacute;tulo       {$filtros->iconOrder('titulo')}</a></th>
      <th><a href='?order=tipo_proyecto'       class="tajax"  title='Ordenar por Tipo de proyecto'               >Tipo                {$filtros->iconOrder('tipo_proyecto')}</a></th>
      <th><a href='?order=estado_proyecto'     class="tajax"  title='Ordenar por Estado de proyecto'             >Est.                {$filtros->iconOrder('estado_proyecto')}</a></th>
      <th><a href='?order=es_actual'           class="tajax"  title='Ordenar por Proyecto Actual del estudiante' >Act.                {$filtros->iconOrder('es_actual')}</a></th>
      <!--<th><a href='?order=fecha_registro'      class="tajax"  title='Ordenar por Fecha de Registro'              >Registro            {$filtros->iconOrder('fecha_registro')}</a></th>-->

      <th>Opciones</th>
    </tr>
  </thead>
  <tbody>
  {section name=ic loop=$objs}
    <tr  class="{cycle values="light,dark"}">
      <td>{$objs[ic]['proyecto_numero_asignado']}</td>
      <td>{$objs[ic]['estudiante_codigo_sis']}</td>
      <td title="{htmlspecialchars($objs[ic]['proyecto_nombre'])}">{cortar($objs[ic]['proyecto_nombre'],28)}</td>
      <td>{$objs[ic]['proyecto_tipo_proyecto']}</td>
      <td>{$objs[ic]['proyecto_estado_proyecto']}</td>
      <td>{$objs[ic]['proyecto_es_actual']}</td>
      <!--<td>{$objs[ic]['proyecto_fecha_registro']}</td>-->
      
      <td>
        <a href="{$URL}{Administrador::URL}detalle/proyecto.detalle.php?estudiante_id={$objs[ic]['estudiante_id']}" target="_blank" >{icono('basicset/document.png','Detalle')} Detalle</a>
        <a href="{$URL}{Administrador::URL}detalle/proyecto.pdf.php?estudiante_id={$objs[ic]['estudiante_id']}" target="_blank" >{icono('basicset/filepd.png','Descargar Pdf')} Pdf</a>
      </td>
    </tr>
  {/section}
  </tbody>
</table>
