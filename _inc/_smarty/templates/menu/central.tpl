      {if ( isset($menus) )}
      {section name=ic loop=$menus}
        {assign var="menu" value=$menus[ic]}
        <div class="dashboard">
          <h2>{$menu->nombre_menu}</h2>
          {section name=id loop=$menu->menu_items}
            {assign var="menu_item" value=$menu->menu_items[id]}
            
            <a href="{$URL}{$menu_item->link}" target="{$menu_item->target}">
              {if (isset($menu_item->pendientes) && $menu_item->pendientes)}<span class="pendientes">{$menu_item->pendientes}</span>{/if}
              {if (isset($menu_item->nopendientes) && $menu_item->nopendientes)}<span class="nopendientes">{$menu_item->nopendientes}</span>{/if}
              {$menu_item->menu_icono->mostrar()}
              <h3>{$menu_item->titulo}</h3>
              <p>{$menu_item->descripcion}</p>
            </a>
          {/section}
        </div>
      {/section}
      {/if}