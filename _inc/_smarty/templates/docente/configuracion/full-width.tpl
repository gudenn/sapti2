{include file="header.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
      {if isset($cabecera_file)}
        {include file=$cabecera_file}
      {/if}
  
      {if !isset($mascara)}
        {include file='docente/configuracion/listas.lista.tpl'}
      {else}
        {include file=$mascara}
      {/if}
    </div>
    {$ERROR}
  </div>
</div>
{include file="footer.tpl"}