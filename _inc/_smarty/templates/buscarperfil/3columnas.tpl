{include file="header-sjq.tpl"}
<div class="wrapper row3">
  <div class="rnd">
    <div id="container" class="clear">
      <!-- ############ -->
      {include file="buscarperfil/columna.left.tpl"}
      <!-- ############ -->
      {if !isset($columnacentro)}
        {include file="buscarperfil/columna.centro.tpl"}
      {else}
        {include file=$columnacentro}
      {/if}
      <!-- ############ -->
    
      <!-- ############ -->
    </div>
  </div>
</div>
{include file="footer.tpl"}