{if (isset($header_ui))}
  {include file="admin/header-ui.tpl"}
{else}
  {include file="estudiante/header-sjq.tpl"}
{/if}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container" class="clear">
      <!-- ############ -->
      {include file="estudiante/columna.left.tpl"}
      <!-- ############ -->
      {if !isset($columnacentro)}
        {include file="estudiante/columna.centro.tpl"}
      {else}
        {include file=$columnacentro}
      {/if}
    </div>
  </div>
</div>
{include file="footer.tpl"}