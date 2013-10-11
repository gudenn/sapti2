{if (isset($header_ui))}
  {include file="admin/header-ui.tpl"}
{else}
  {include file="admin/header-sjq.tpl"}
{/if}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
      {if isset($cabecera_file)}
        {include file=$cabecera_file}
      {/if}
      
      {include file='admin/filtro.tpl'}
      {if !isset($mascara)}
        {include file='admin/listas.lista.tpl'}
      {else}
        {include file=$mascara}
      {/if}
    </div>
    {$ERROR}
  </div>
</div>
{include file="footer.tpl"}