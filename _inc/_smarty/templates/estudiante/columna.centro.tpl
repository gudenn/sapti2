      <div id="content"  style="width:685px;min-height: 450px;">
        {if isset($columnacentrodetalle)}
          {include file=$columnacentrodetalle}
        {else}
          <h1 class="title">{$description}</h1>
        {/if}
        {include file="menu/central.tpl"}
        <div  style="clear: both;" ></div>
      </div>