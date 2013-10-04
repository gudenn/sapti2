<table class="tbl_lista">
  <thead>
    <tr>
      <th><a href='?order=descipcion'          class="tajax"  title='Ordenar por Descripci&oacute;n' >Descripci&oacute;n {$filtros->iconOrder('descripcion')}</a></th>
      <th><a href='?order=keywords'            class="tajax"  title='Ordenar por Palabras clave'     >Claves             {$filtros->iconOrder('keywords')}</a></th>
      {section name=ia loop=$grupos}
      <th style="background: #FFF;">{$grupos[ia]->getIcon()}</th>
       {/section}
    </tr>
  </thead>
  {section name=ic loop=$objs}
  <tbody>
    <tr  class="{cycle values="light,dark"}">
      <td>{$objs[ic]['descripcion']}</td>
      <td>{$objs[ic]['keywords']}</td>
      {section name=ia loop=$grupos}
      <td>
        {assign var="permiso" value=$grupos[ia]->tieneAccesoHelpdesk($objs[ic]['id'])}
        <div id="loading_{$permiso->id}" style="display: none" >{icono('basicset/loadingcircle.gif','Guardando...')}</div>
        <div id="hidme_{$permiso->id}" >
        {if ($permiso->ver)}
          <a href="?dar_acceso=0&permiso_id={$permiso->id}&pg={$objs_pg->ses_pg}" class="tajax" onclick="$('#hidme_{$permiso->id}').hide();$('#loading_{$permiso->id}').show();" >
          {icono('basicset/Off.png','Denegar acceso')}
          </a>
          {icono('basicset/eye.png','Puede ver')}
        {else}
          <a href="?dar_acceso=1&permiso_id={$permiso->id}&pg={$objs_pg->ses_pg}" class="tajax" onclick="$('#hidme_{$permiso->id}').hide();$('#loading_{$permiso->id}').show();" >
          {icono('basicset/On.png','Dar acceso')}
          </a>
          {icono('basicset/eyeclose.png','No puede ver')}
        {/if}
        </div>
      </td>
       {/section}
    </tr>
  </tbody>
  {/section}
</table>
