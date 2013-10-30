<div id="comments">
  <h2>Resustados de la B&uacute;squeda de &quot;{$busqueda}&quot;</h2>
  <ul class="commentlist">


      {section name=ic loop=$helpdesks}
      <li class="{cycle values="comment_odd,comment_even"}">
        <div class="author"><img class="avatar" src="{$URL_IMG}icons/basicset/helpdesk_48.png" width="32" height="32" alt="{$busqueda}" title="{$busqueda}"><span class="name"><a href="index.php?codigo={$helpdesks[ic]->codigo}">{$helpdesks[ic]->titulo}</a></span></div>
        <div class="submitdate"><a href="#">August 4, 2009 at 8:35 am</a></div>
        <p>{$helpdesks[ic]->getDescripcionResumen($busqueda)}</p>
        <p class="readmore"><a href="index.php?codigo={$helpdesks[ic]->codigo}">Seguir leyendo &raquo;</a></p>
      </li>
      {sectionelse}
      <li class="{cycle values="comment_odd,comment_even"}">
        <div class="author"><img class="avatar" src="{$URL_IMG}icons/basicset/helpdesk_48.png" width="32" height="32" alt="{$busqueda}" title="{$busqueda}"><span class="name"><a href="#">No se encontr&oacute; Temas de Ayuda relacionados</a></span></div>
        <div class="submitdate"><a href="#">{$busqueda}</a></div>
        <p>Lo sentimos No se encontr&oacute; ning&uacute;n tema de ayuda relacionado a su b&uacute;squeda.</p>
        <p class="readmore"><a href="index.php?codigo={$helpdesks[ic]->codigo}">Seguir leyendo &raquo;</a></p>
      </li>
      {/section}
  </ul>
</div>


<div class="clear" style="padding: 0px; margin: 0px; clear: both; color: rgb(128, 128, 128); font-family: Verdana, Geneva, sans-serif; font-size: 12px; line-height: normal; background-color: rgb(254, 254, 253);">&nbsp;</div>
