<div class="wrapper row2">
  <div class="rnd">
    <div id="topnav">
      <ul>
        <li><a href="{$URL}ayuda/">Ayuda</a></li>
        {section name=ic loop=$topnav}
        <li {if $smarty.section.ic.last} class="active" {/if} ><a href="{$URL}ayuda/?codigo={$helpdesk->getCodeByDirectory($topnav[ic])}">{$topnav[ic]}</a></li>
        {/section}
      </ul>
    </div>
  </div>
</div>