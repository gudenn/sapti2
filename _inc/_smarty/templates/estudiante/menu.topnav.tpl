<div class="wrapper row2">
  <div class="rnd">
    <div id="topnav">
      <ul>
        {if (isset($menuList))}
          <li><a href="{$URL}">Inicio &gt;</a></li>
          {foreach from=$menuList key=myId item=i name=foo} 
          <li {if $smarty.foreach.foo.last}class="active"{/if} ><a href="{$i.url}">{$i.name} {if !$smarty.foreach.foo.last}&gt;{/if}</a></li>
          {/foreach}
        {else}
        <li><a href="{$URL}">Inicio</a></li>
        {/if}
      </ul>
    </div>
  </div>
</div>