{include file="helpdesk/header.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container">
      <div style="clear: both"></div>
      {if (isset($template) )}
        {include file=$template}
      {/if}
      <div style="clear: both"></div>
    </div>
  </div>
</div>
{include file="helpdesk/footer.tpl"}