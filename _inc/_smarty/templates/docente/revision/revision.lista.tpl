<table class="tbl_lista">
  <thead>
    <tr>
      <th>Estado       </th>
      <th>Fecha        </th>
      <th>Descripcion  </th>
      <th>Detalle</th>
      <th>Revisiones</th>
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}" >
      <td>{$avance->getEstadoAvance($objs[ic]['estado_avance'])}</td>
      <td>{$objs[ic]['fecha_avance']}</td>
      <td>{$avance->getResumen($objs[ic]['descripcion'])}</td>
      {assign var="ides" value=$objs[ic]['id']}
      <td>
        <a href="avance.detalle.php?avance_id={$objs[ic]['id']}" target="_blank" >Ver {icono('basicset/search_48.png','Detalle')}</a>
      </td>
      <td><div align="center" id="{$objs[ic]['id']}" onClick="cambiarDisplay({$objs[ic]['id']+1},{$objs[ic]['id']})" style="cursor: pointer;">Mostrar</div></td> 
    </tr>
    {foreach name=outer item=contact from=$objs[ic][8]}
  {foreach key=key item=item from=$contact}
    <tr id="{$objs[ic]['id']+1}" onClick="cambiarDisplay({$objs[ic]['id']+1},{$objs[ic]['id']})" style="display:none">
    <td>{$item['id']}</td>
    <td>{$item['estado']}ss</td>
    <td>{$item['fecha_re']}d</td>
    <td>{$item['revisor']}f</td>
    <td>{$item['fecha_co']}g</td>
    </tr>

  {/foreach}
    {/foreach}

  </tbody>
  {/section}
</table>
<script type="teXt/javascript"> 
function cambiarDisplay(id,row) {
    var rownom = document.getElementById(row);
  if (!document.getElementById) return false;
  fila = document.getElementById(id);
  if (fila.style.display != "none") {
    fila.style.display = "none"; //ocultar fila 
    rownom.innerHTML = "Mostrar";
  } else {
    fila.style.display = ""; //mostrar fila 
    rownom.innerHTML = "Ocultar";
  }
} 
</script> 