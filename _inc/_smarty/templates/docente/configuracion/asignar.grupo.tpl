<table class="tbl_lista">
  <thead>
  <tr>

    <th><a  > </a>Periodo </th>
    <th><a  > </a>Lunes </th>
    <th><a  > </a>Martes </th>
    <th><a  > </a>Miércoles </th>
    <th><a  > </a>Jueves</th>
    <th><a  > </a>Viernes </th>
    
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
   <td>{$objs[ic]['nombre']}</td>
   {section name=iaz loop=$grupos}
   {if ($grupos[iaz]->codigo!= 'TRIBUNALES')}
   {assign var="i" value=ia}
      <td>
        {assign var="pertenece" value=$usuario->perteneceGrupo($grupos[iaz]->codigo,$objs[ic]['id'])}
        <div id="loading_{$i}{$objs[ic]['id']}{$grupos[iaz]->id}" style="display: none" >{icono('basicset/loadingcircle.gif','Guardando...')}</div>
        <div id="hidme_{$i}{$objs[ic]['id']}{$grupos[iaz]->id}" >
        {if ($pertenece)}
          <a href="?asignar_grupo=0&pertenece_id={$pertenece->id}&usuario_id={$objs[ic]['id']}&grupo_id={$grupos[iaz]->id}&pg={$objs_pg->ses_pg}" class="tajax" onclick="$('#hidme_{$i}{$objs[ic]['id']}{$grupos[iaz]->id}').hide();$('#loading_{$i}{$objs[ic]['id']}{$grupos[iaz]->id}').show();" >
          {icono('basicset/Off.png','Sacar del grupo')}
          </a>
          {icono('basicset/login.png','Pertenece al grupo')}
        {else}
          <a href="?asignar_grupo=1&pertenece_id={$pertenece->id}&usuario_id={$objs[ic]['id']}&grupo_id={$grupos[iaz]->id}&pg={$objs_pg->ses_pg}" class="tajax" onclick="$('#hidme_{$i}{$objs[ic]['id']}{$grupos[iaz]->id}').hide();$('#loading_{$i}{$objs[ic]['id']}{$grupos[iaz]->id}').show();" >
          {icono('basicset/On.png','Incorporar al grupo')}
          </a>
          {icono('basicset/user_48.png','No Pertenece al grupo')}
        {/if}
        </div>
      </td>
        {/if}
       {/section}
    </tr>
  </tbody>
  {/section}
</table>
