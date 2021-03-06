          <div align="right">
              <a href="{$cerrar}">{icono('close.png','Cerrar')}</a>
          </div>
<form action="{$filtros->clearaction}" method="get" name="filtro" id="filtro" >
  <h2>Opciones de B&uacute;squeda R&aacute;pida: <b>{$description}</b></h2>
    
  <table  style="width: {sizeof($filtros->nombres)*105}px;float: left;" class="tbl_filtro">
    <tr>
      {section name=ic loop=$filtros->nombres}
        <th style="width: 120px;"><label for="{$filtros->valores[ic][1]}">{$filtros->nombres[ic]}{getHelpTip($filtros->valores[ic][1])}</label></th>
      {/section}
      <th style="width: 120px;">&nbsp;</th>
    </tr>
    <tr>
      {section name=ic loop=$filtros->valores}
        <td>
          {if ($filtros->valores[ic][0] == 'select')}
            <select name="{$filtros->valores[ic][1]}" id="{$filtros->valores[ic][1]}">
              {html_options selected=$filtros->valores[ic][2] values=$filtros->valores[ic][3] output=$filtros->valores[ic][4]}
            </select>
          {else}
            <input type="text" name="{$filtros->valores[ic][1]}"  id="{$filtros->valores[ic][1]}" value="{$filtros->valores[ic][2]}" />
          {/if}
        </td>
      {/section}
      <td><input type="submit" value="Buscar" name="find" class="sendme" /></td>
    </tr>
  </table>
</form>
<table  style="width: 110px;float: left;" class="tbl_filtro">
  <tr>
    <th>&nbsp;</th>
  </tr>
  <tr>
    <td>
      <form action="{$filtros->clearaction}" method="post" id="filtro_clear">
        <input type="submit" value="Limpiar" name="clear" class="sendme" onclick="clear_form('#filtro')" />
      </form>
    </td>
  </tr>
</table>
<script type="text/javascript">
{literal}
  function clear_form(ele) {
      $(ele).find(':input').each(function() {
          switch(this.type) {
              case 'password':
              case 'select-multiple':
              case 'select-one':
              case 'text':
              case 'textarea':
                  $(this).val('');
                  break;
              case 'checkbox':
              case 'radio':
                  this.checked = false;
          }
      });

  }
{/literal}
</script>
{if isset($crear_nuevo)}
  <table  style="width: 120px;float: left;" class="tbl_filtro">
    <tr>
      <th>&nbsp;</th>
    </tr>
    <tr>
      <td style="line-height: 26px;">
        <a href="{$crear_nuevo}" title="Crear Nuevo" class="sendme" style="line-height: 19px;" >Nuevo</a>
      </td>
    </tr>
  </table>
{/if}