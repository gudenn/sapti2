{include file="helpdesk/header.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
      {if (isset($indice))}
        {include file=$indice}
      {/if}
      <div style="clear: both"></div>
      {if (isset($template) )}
        {include file=$template}
      {/if}
      {if (isset($URLEDITAR))}
        <p class="readmore"><a href="{$URLEDITAR}">[+] Editar Tema de Ayuda &raquo;</a></p>
      {/if}
      <div style="clear: both"></div>
    </div>
  </div>
</div>
{include file="helpdesk/footer.tpl"}