{if (isset($header_ui))}
  {include file="admin/header-ui.tpl"}
{else}
  {include file="tribunal/header-sjq.tpl"}
{/if}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container" class="clear">
      <!-- ############ -->
      {include file="tribunal/columna.left.tpl"}
      <!-- ############ -->
      {if !isset($columnacentro)}
        {include file="tribunal/columna.centro.tpl"}
      {else}
        {include file=$columnacentro}
      {/if}
    </div>
  </div>
</div>
{include file="footer.tpl"}